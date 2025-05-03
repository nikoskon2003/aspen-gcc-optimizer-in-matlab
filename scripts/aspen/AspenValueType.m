classdef AspenValueType
    enumeration
        None (0)
        Int (1)
        Real (2)
        String (3)
        Node (4)
    end

    methods(Static)
        function ex = ValueExists(v)
            switch(v)
                case {AspenValueType.None, AspenValueType.Int, AspenValueType.Real, AspenValueType.String, AspenValueType.Node}
                    ex = true;
                otherwise
                    ex = false;
            end
        end
    end
end