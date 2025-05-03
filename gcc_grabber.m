clear; clc; close all;
config;

addpath("./scripts/aspen")

disp("Opening aspen...")

aspen = AspenInstance();
aspen = aspen.StartBkp(sprintf("%s/%s.bkp", conf.aspen_dir, conf.filename), true);
aspen.SetVisibility(conf.aspen_visible);
aspen.Aspen.Reinit();

aspen.TryRun(conf.ignore_run_errors);

Qeps = conf.heat_duty_eps;
try
    disp("Populating initial...");

    db = DBManager();
    db = db.SetAspenInstance(aspen);

    db = db.PopulateAllStreams();
    db = db.PopulateAllBlocks();

    StreamEntries = struct("Stream", {}, "Block", {}, "Tprocc", {}, "Tstart", {}, "Q", {}, "VirHea", {});

    disp("Finding streams...");

    for b = db.GetAllBlocks()
        if IgnoreBlock(b)
            continue;
        end

        [strms, Temps] = FindBlockConnectingStreams(b, db, "");

        for s = 1:length(strms)
            StreamEntries(end+1).Stream = strms(s);
            StreamEntries(end).Block = string(b.Name);
            StreamEntries(end).Tprocc = Temps(s);
        end
    end
    if ~conf.ignore_outlets
        for s = db.GetAllStreams()
            if ~s.connected
                StreamEntries(end+1).Stream = s.Name;
                StreamEntries(end).Block = "";
                StreamEntries(end).Tprocc = TempConv(conf.enviroment_temp_in_oC , 'C');
            end
        end
    end

    save exports/strms.mat StreamEntries

    disp("Deleting everything...");

    db = db.DeleteEverything();

    disp("Placing exchangers...");

    i = 0;
    for e = StreamEntries
        i = i + 1;

        s = db.GetStream(e.Stream);

        T_in = s.T;
        T_out = e.Tprocc;

        StreamEntries(i).Tstart = T_in;

        if abs(T_in - T_out) < 1e-3
            fprintf("[-] %s |> %s\n", e.Stream, e.Block)
            continue;
        end

        fprintf("[+] %s |> %s\n", e.Stream, e.Block)

        [db, in_name, in_stream] = db.CreateStream();
        [db, h_name, heater] = db.CreateHeaterBlock(T_out);
        [db, out_name, out_stream] = db.CreateStream();

        StreamEntries(i).VirHea = h_name;

        db = db.AttachHeaterStream(in_name, h_name, 0);
        db = db.AttachHeaterStream(out_name, h_name, 1);

        db = db.DefineStream(in_stream, s.z, s.F, T_in, s.P);
    end

    disp("Getting Q values...")

    aspen.Aspen.Reinit();
    aspen.TryRun(conf.ignore_run_errors);

    db = db.PopulateAllStreams();
    db = db.PopulateAllBlocks();

    disp("Exporting data...")

    ssss = db.Streams;
    save(sprintf("exports/%s.mat", conf.filename), "ssss");

    if conf.export_nonsplit_streams
        i = 0;
        for e = StreamEntries
            i = i + 1;
            hea = db.GetBlock(e.VirHea);
            if ~isempty(e.VirHea)
                StreamEntries(i).Q = hea.Q;
            end
        end

        msk = abs([StreamEntries.Tprocc] - [StreamEntries.Tstart])>1e-3;
        writetable( ...
            table([StreamEntries(msk).Stream]', ...
            [StreamEntries(msk).Block]', ...
            [StreamEntries(msk).Tstart]', ...
            [StreamEntries(msk).Tprocc]', ...
            [StreamEntries(msk).Q]', ...
            'VariableNames',["Stream start", "Target block", "Tstart", "Tprocc", "Q"]), ...
            sprintf("exports/%s.xlsx", conf.filename), ...
            "WriteMode", "overwrite", "WriteRowNames",true);
    end

    if conf.split_stream
        disp("Staring splitting...")
        Qmax = max(abs([db.Streams.Q]));
        for s = db.Streams((abs([db.Streams.Q]) > Qeps) & ([db.Streams.connected] == 1))
            if s.deleted
                continue
            end

            N = max(0, min(round(conf.max_split_exchangers * abs(s.Q)/Qmax), conf.max_split_exchangers));
            Ts = linspace(s.T, s.T_e, N+2);
            p_name = s.Name;
            for i = 1:N
                Ti = Ts(i+1);

                [db, h_name, heater] = db.CreateHeaterBlock(Ti);
                [db, s_name, n_stream] = db.CreateStream();

                db = db.AttachHeaterStream(s_name, h_name, 1);
                db = db.AttachHeaterStream(p_name, h_name, 0);

                p_name = s_name;
            end

            db = db.AttachStreamDest(p_name, s.Connects.Name, s.Connects.Port);
        end

        aspen.TryRun(conf.ignore_run_errors);

        disp("Getting split Q...")

        db = db.PopulateAllStreams();
        db = db.PopulateAllBlocks();

        ssss = db.Streams;
        save(sprintf("exports/s-%s.mat", conf.filename), "ssss");
    end

catch e
    disp(e)
    disp(e.stack)
end

disp("! DONE !")

if conf.pause_before_exit
    input("Press enter to finish code execution, to stop aspen and cleanup");
end

aspen.CloseAndExit();