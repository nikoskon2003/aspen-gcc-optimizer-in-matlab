function [ign] = IgnoreBlock(blk)
    switch lower(blk.Type)
        case {"heater", "mixer", "fsplit"}
            ign = true;
        otherwise
            ign = false;
    end
end