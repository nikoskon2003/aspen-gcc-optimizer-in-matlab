function [ok] = ShouldSplitStream(db, stream)
    ok = true;
    if stream.connected == 0
        global conf;

        if conf.ignore_outlets
            ok = false;
        else
            ok = (stream.T < TempConv(conf.enviroment_temp_in_oC, 'C')) | (stream.T >= TempConv(conf.outlet_cooling_threshold_oC , 'C'));
        end

        return
    end

    Qeps = 1;

    blk = db.GetBlock(stream.Connects.Name);
    
    b_type = lower(string(blk.Type));
    switch b_type
        case {"heater", "pump", "compr", "valve", "mixer", "dryer"}
            ok = false;
        
        case {"decanter", "crystallizer", "sep", "filter", "flash2", "rplug", "rcstr"}
            Q = db.Aspen.GetTreeNode(["Data/Blocks/" blk.Name "/Output/QCALC"]).Value;

            ok = abs(Q) > Qeps;

        case {"fsplit", "dstwu", "radfrac"}
            ok = true;

        otherwise
            warning("Unknown block of type '%s' - ignoring streams leading into it. Update 'ShouldSplitStream.m' to address this block", b_type);
            ok = false;
    end
end