function [streams, Tp] = FindBlockConnectingStreams(block, db, start_elm_name)
    streams = string.empty;
    Tp = [];

    function [b] = StreamBegginingBlock(sname)
        [s, ~] = db.GetStream(sname);
        blk = s.Src;

        if s.Src == ""
            b = "";
            return;
        end

        [b, ~] = db.GetBlock(blk);
    end

    if strcmp(block.Name, start_elm_name)
        return;
    end

    if ~IgnoreBlock(block)
        start_elm_name = block.Name;
    end
   

    for port = block.Ports
        if port.Type ~= 0
            continue;
        end

        for str = port.Streams
            T = db.GetStream(str).T;

            src_blk = StreamBegginingBlock(str);

            if isa(src_blk, "string")
                streams(end+1) = str;
                Tp(end+1) = T;
                continue;
            end

            if IgnoreBlock(src_blk)
                [ss, ~] = FindBlockConnectingStreams(src_blk, db, start_elm_name);
                streams = [streams, ss];
                Tp = [Tp, T*ones(1, length(ss))];
            else
                streams(end+1) = str;
                Tp(end+1) = T;
            end
        end
    end
end