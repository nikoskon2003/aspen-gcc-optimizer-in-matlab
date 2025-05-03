classdef DBManager
    properties
        Aspen = AspenInstance();
        Streams;
        Blocks;
        ElementNames = strings(0);
        NextName = 0;
    end

    methods
        %% Aspen
        function db = SetAspenInstance(db, aspen)
            arguments
                db DBManager
                aspen AspenInstance
            end
            db.Aspen = aspen;
        end

        function [ok] = AspenInstanceOK(db)
            ok = false;
            if ~isa(db.Aspen, 'AspenInstance')
                return;
            end

            ok = db.Aspen.HasInitted();
        end

        function [ok] = ElementExists(db, name)
            name = string(name);
            ok = ismember(name, db.ElementNames);
        end

        function [db, v] = NextElementName(db)
            if ~db.AspenInstanceOK()
                error("Cant get next element name - Aspen instance not ok.");
            end

            fnd = 0;
            while fnd == 0
                v = sprintf("%d$", db.NextName);
                db.NextName = db.NextName + 1;
                
                if isempty(db.Aspen.GetTreeNode(sprintf("Data/Streams/%s", v)))
                   fnd = 1; 
                end
            end
        end
    
        function [db] = DeleteEverything(db)
            strm = db.Aspen.GetTreeNode("Data/Streams");
            blk = db.Aspen.GetTreeNode("Data/Blocks");

            all_s = db.GetAllStreams();

            for s = 1:length(all_s)
                strm.Elements.Remove(all_s(s).Name);
                db.Streams(s).deleted = true;
            end

            all_b = db.GetAllBlocks();

            for b = 1:length(all_b)
                blk.Elements.Remove(all_b(b).Name);
                db.Blocks(b).deleted = true;
            end

            db.Aspen.DeleteAllTreeNodeChildren("\Data\Flowsheeting Options\Design-Spec");
            db.Aspen.DeleteAllTreeNodeChildren("\Data\Model Analysis Tools\Sensitivity");
            db.Aspen.DeleteAllTreeNodeChildren("\Data\Model Analysis Tools\Optimization");
            db.Aspen.DeleteAllTreeNodeChildren("\Data\Model Analysis Tools\Constraint");
        end


        %% Streams

        function db = InitDBStreams(db) 
            if ~isempty(db.Streams)
                disp("Warining: Overriding DB streams");
            end
        
            db.Streams = struct( ...
                ... % These will be populated by the Stream itself
                'Name', {}, ...
                'F', {}, ...
                'T', {}, ...
                'P', {}, ...
                'z', [], ...
                ... % ... rest will be populated by connected exit Block 
                'T_e', {}, ...
                'Src', {}, ...
                'Connects', struct( ...
                    'Name', {}, ...
                    'Port', {}, ...
                    'IsRF', false, ...
                    'RF_Stage', {}, ...
                    'RF_CONV', {}...
                    ), ...
                'Q', 0, ...
                ... % 'Qr', struct('DH', {}, 'T', {}), ...
                'c_state', false, ...
                'connected', false, ...
                'deleted', false);
        end
        
        function [streams] = GetAllStreams(db)
            if isempty(db.Streams)
                db.InitDBStreams()
            end
        
            streams = db.Streams;
        end
        

        function [s, idx] = GetStream(db, st_name)
            streams = db.GetAllStreams();
            s = [];
            idx = 0;
            for st = 1:length(streams)
                if strcmp(streams(st).Name, st_name)
                    s = streams(st);
                    idx = st;
                    return;
                end
            end
        end
        function [r] = StreamExists(db, st_name)
            [~, idx] = db.GetStream(st_name);
            r = idx > 0;
        end

        function [db, idx] = AppendStream(db, name)
            if db.ElementExists(name)
                error("Element with name '%s' already exists.", name)
            end
            db.ElementNames(end+1) = name;

            idx = length(db.Streams)+1;

            global conf;
            
            db.Streams(idx).Name = string(name);
            db.Streams(idx).T_e = TempConv(conf.enviroment_temp_in_oC , 'C');
            db.Streams(idx).Q = 0;

            db.Streams(idx).c_state = false;
            db.Streams(idx).connected = false;
            db.Streams(idx).deleted = false;
            db.Streams(idx).Src = "";
        end

        function db = PopulateStreamStateVars(db, name)
            [stream, idx] = db.GetStream(name);
            if idx == 0 || isempty(stream)
                error("Could not populate stream '%s' - Does not exist.", name)
            end
            
            if ~db.AspenInstanceOK() 
                error("Could not populate stream '%s' - Aspen instance not ok.", name)
            end

            if stream.deleted 
                return
            end
            
            str = db.Aspen.GetTreeNode(["Data" "Streams" name]);

            Tn = AspenInstance.TraverseNode(str, "Output/TEMP_OUT/MIXED");
            Pn = AspenInstance.TraverseNode(str, "Output/PRES_OUT/MIXED");
            Fn = AspenInstance.TraverseNode(str, "Output/RES_MOLEFLOW");

            db.Streams(idx).F = Fn.Value;
            db.Streams(idx).T = TempConv(Tn.Value, Tn.UnitString);
            db.Streams(idx).P = Pn.Value;
            db.Streams(idx).c_state = true;
            db.Streams(idx).connected = false;
            db.Streams(idx).Connects.IsRF = false;

            db.Streams(idx).z = struct('m', {}, 'v', {});

            zn = AspenInstance.TraverseNode(str, "Output/MOLEFRAC/MIXED");
            zc = AspenInstance.GetNodeChildren(zn);

            for z = zc
                db.Streams(idx).z(end+1) = struct('m', z.Name, 'v', z.Value);
            end
        end

        function db = PopulateAllStreams(db)
            a_streams = db.Aspen.GetTreeNodeChildren(["Data" "Streams"]);
            for str = a_streams
                name = str.Name;

                if ~db.ElementExists(name)
                    [db, ~] = db.AppendStream(name);
                end

                db = db.PopulateStreamStateVars(name);
            end
        end

        function [db, s, str] = CreateStream(db)
            [db, s] = db.NextElementName();
            
            a_streams = db.Aspen.GetTreeNode(["Data" "Streams"]);
            str = AspenInstance.AddNodeChild(a_streams, sprintf("%s!MATERIAL", s));

            db = db.AppendStream(s);
        end

        function [db] = DefineStream(db, s, z, F, T, P)

% 1) Data\Streams\<NAME>\Input\BASIS\MIXED -> Value = "MOLE-FRAC"
% 2) Data\Streams\<NAME>\Input\FLOW\MIXED\<New child> -> 
%      Name = <material>, Value = <fraction>, Attribute.Basis = "MOLE-FRAC"
% 3) Data\Streams\<NAME>\Input\TEMP\MIXED -> Value = <T>
% 4) Data\Streams\<NAME>\Input\PRES\MIXED -> Value = <P>
% 5) Data\Streams\<NAME>\Input\TOTFLOW\MIXED -> Value = <F>, Attribute.Basis = "MOLE"

            basis = AspenInstance.TraverseNode(s, "Input/BASIS/MIXED");
            basis.Value = "MOLE-FRAC";
            pause(0.01);

            temp = AspenInstance.TraverseNode(s, "Input/TEMP/MIXED");
            temp.Value = InverseTempConv(T, temp.UnitString);
            pause(0.01);

            pres = AspenInstance.TraverseNode(s, "Input/PRES/MIXED");
            pres.Value = P;
            pause(0.01);

            flow = AspenInstance.TraverseNode(s, "Input/TOTFLOW/MIXED");
            flow.Value = F;
            pause(0.01);
            %AspenInstance.SetNodeAttribute(flow, AspenAttributeIDs.HAP_BASIS, "MOLE");

            flow_frac = AspenInstance.TraverseNode(s, "Input/FLOW/MIXED");
            for ze = z
                ch = AspenInstance.TraverseNode(flow_frac, ze.m);
                if ze.v > 0
                    ch.Value = ze.v;
                    pause(0.01);
                end
                %AspenInstance.SetNodeAttribute(ch, AspenAttributeIDs.HAP_BASIS, "MOLE-FRAC");
            end

        end

        function [db] = AttachStreamDest(db, name, block_n, port_n)
            [stream, idx] = db.GetStream(name);
            if idx == 0 || isempty(stream)
                error("Could not attach stream '%s' - Does not exist.", name)
            end

            [block, bid] = db.GetBlock(block_n);
            if bid == 0 || isempty(block)
                error("Could not attach stream '%s' - Block destination '%s' not exist.", name, block_n)
            end

            blk = db.Aspen.GetTreeNode(["Data/Blocks" block_n]);

            port = AspenInstance.TraverseNode(blk, ["Ports" port_n]);
            AspenInstance.AddNodeChild(port, name);            
        end
        


        %% Blocks

        function db = InitDBBlocks(db) 
            if ~isempty(db.Blocks)
                disp("Warining: Overriding DB blocks");
            end
        
            db.Blocks = struct( ...
                'Name', {}, ...
                'Type', {}, ...
                'Ports', [struct('Name', {}, 'Type', {}, 'Streams', {})], ...
                'T', {}, ...
                'P', {}, ...
                'Q', 0, ...
                'comp', false, ...
                'deleted', false);
        end

        function [blocks] = GetAllBlocks(db)
            if isempty(db.Blocks)
                db.InitDBBlocks()
            end
        
            blocks = db.Blocks;
        end
        

        function [b, idx] = GetBlock(db, bl_name)
            blocks = db.GetAllBlocks();
            b = [];
            idx = 0;
            for bl = 1:length(blocks)
                if strcmp(blocks(bl).Name, bl_name)
                    b = blocks(bl);
                    idx = bl;
                    return;
                end
            end
        end

        function [db, idx] = AppendBlock(db, name)
            if db.ElementExists(name)
                error("Element with name '%s' already exists.", name)
            end
            db.ElementNames(end+1) = name;

            idx = length(db.Blocks)+1;
            
            db.Blocks(idx).Name = name;
            db.Blocks(idx).Q = 0;
            db.Blocks(idx).comp = false;
            db.Blocks(idx).deleted = false;
        end

        function db = PopulateAllBlocks(db)
            a_blocks = db.Aspen.GetTreeNodeChildren(["Data" "Blocks"]);
            for blk = a_blocks
               name = blk.Name;

                if ~db.ElementExists(name)
                    [db, ~] = db.AppendBlock(name);
                end

                db = db.PopulateBlockStateVars(name);
            end
        end

        function db = PopulateBlockStateVars(db, name)
            [block, idx] = db.GetBlock(name);
            if idx == 0 || isempty(block)
                error("Could not populate block '%s' - Does not exist.", name)
            end
            
            if ~db.AspenInstanceOK() 
                error("Could not populate block '%s' - Aspen instance not ok.", name)
            end

            if block.deleted
                return
            end
            
            blk = db.Aspen.GetTreeNode(["Data" "Blocks" name]);

            db.Blocks(idx).Type = AspenInstance.GetNodeAttribute(blk, AspenAttributeIDs.HAP_RECORDTYPE);

            if lower(string(db.Blocks(idx).Type)) == "heater"
                db.Blocks(idx).Q = AspenInstance.TraverseNode(blk, ["Output" "QCALC"]).Value;
            else
                db.Blocks(idx).Q = 0;
            end

            a_ports = AspenInstance.GetNodeChildren(AspenInstance.TraverseNode(blk, "Ports"));
            
            for i = 1:length(a_ports)
                db.Blocks(idx).Ports(i).Name = a_ports(i).Name;
                
                pc = AspenInstance.GetNodeChildren(a_ports(i));

                for c = 1:length(pc)
                   str_name = pc(c).Name;
                   if db.StreamExists(str_name)
                       db.Blocks(idx).Ports(i).Streams(c) = string(str_name);
                   end
                end


                [inout, ~] = AspenInstance.GetNodeAttribute(a_ports(i), AspenAttributeIDs.HAP_INOUT);
                db.Blocks(idx).Ports(i).Type = inout;
            end
            
            db = db.PostprocessBlockVars(idx);

            db.Blocks(idx).comp = true;
        end

        function [db] = PostprocessBlockVars(db, idx)
            CompInIdx = [];
            F = [];
            T = [];
            for p = db.Blocks(idx).Ports
                if p.Type == 0
                    for sn = p.Streams
                        [~, i] = db.GetStream(sn);
                        if i > 0
                            CompInIdx(end+1) = i;

                            db.Streams(i).Connects.Name = db.Blocks(idx).Name;
                            db.Streams(i).Connects.Port = p.Name;
                        end
                    end
                else
                    for sn = p.Streams
                        [s, i] = db.GetStream(sn);
                        if i > 0
                            F(end+1) = s.F;
                            T(end+1) = s.T;

                            db.Streams(i).Src = string(db.Blocks(idx).Name);
                        end
                    end
                end
            end

            Ti = sum((T.*F)./(sum(F)));
            for ins = 1:length(CompInIdx)
               i = CompInIdx(ins);
               db.Streams(i).T_e = Ti;
               db.Streams(i).Q = db.Blocks(idx).Q;
               db.Streams(i).connected = true;
               db = db.GetRFStreamData(idx, i);
            end

            db.Blocks(idx).T = Ti;
        end

        function [db, h, htr] = CreateHeaterBlock(db, T)
            [db, h] = db.NextElementName();

            a_blocks = db.Aspen.GetTreeNode(["Data" "Blocks"]);
            htr = AspenInstance.AddNodeChild(a_blocks, sprintf("%s!Heater", h));
             
            AspenInstance.SetNodeValue(AspenInstance.TraverseNode(htr, "Input/SPEC_OPT"), "TP");
            Te = AspenInstance.TraverseNode(htr, "Input/TEMP");
            AspenInstance.SetNodeValue(Te, InverseTempConv(T, Te.UnitString));
            AspenInstance.SetNodeValue(AspenInstance.TraverseNode(htr, "Input/PRES"), 0);

            db = db.AppendBlock(h);
        end

        function [db] = AttachHeaterStream(db, stream_name, block_n, in_or_out)
            [stream, idx] = db.GetStream(stream_name);
            if idx == 0 || isempty(stream)
                error("Could not attach stream '%s' - Does not exist.", stream_name)
            end

            [block, bid] = db.GetBlock(block_n);
            if bid == 0 || isempty(block)
                error("Could not attach stream '%s' - Block destination '%s' not exist.", stream_name, block_n)
            end

            blk = db.Aspen.GetTreeNode(["Data/Blocks" block_n]);

            if in_or_out == 0
                port = AspenInstance.TraverseNode(blk, "Ports/F(IN)");
            else
                port = AspenInstance.TraverseNode(blk, "Ports/P(OUT)");
            end
            
            AspenInstance.AddNodeChild(port, stream_name);            
        end
        
        function [db] = GetRFStreamData(db, bidx, sidx)
            isRF = strcmp(db.Blocks(bidx).Type, "RadFrac");
            if ~isRF
                db.Streams(sidx).Connects.IsRF = false;
                return;
            end
            
            db.Streams(sidx).Connects.IsRF = true;
            
            rfi = db.Aspen.GetTreeNode(["Data/Blocks" db.Blocks(bidx).Name "Input"]);

            fs = AspenInstance.TraverseNode(rfi, ["/FEED_STAGE" db.Streams(sidx).Name]).Value;
            fc = AspenInstance.TraverseNode(rfi, ["/FEED_CONVE2" db.Streams(sidx).Name]).Value;
            
            db.Streams(sidx).Connects.RF_Stage = fs;
            db.Streams(sidx).Connects.RF_CONV = fc;
        end

        function [db] = MaybeApplyRFConnData(db, b_nm, s_nm, conn)
            [~, sidx] = db.GetStream(s_nm);
            [~, bidx] = db.GetBlock(b_nm);

            if sidx == 0 || bidx == 0
                return
            end

            isRF = strcmp(db.Blocks(bidx).Type, "RadFrac");
            if ~isRF || ~conn.IsRF
                return;
            end
            
            rfi = db.Aspen.GetTreeNode(["Data/Blocks" db.Blocks(bidx).Name "Input"]);

            fs = AspenInstance.TraverseNode(rfi, ["/FEED_STAGE" db.Streams(sidx).Name]);
            fc = AspenInstance.TraverseNode(rfi, ["/FEED_CONVE2" db.Streams(sidx).Name]);
            
            if isempty(fs) || isempty(fc)
                return;
            end

            fs.Value = conn.RF_Stage;
            fc.Value = conn.RF_CONV;
        end
    end

end