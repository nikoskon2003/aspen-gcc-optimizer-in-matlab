classdef AspenInstance
    properties
        Aspen = [];
    end

    methods
        function i = HasInitted(asp)
            i = ~isempty(asp.Aspen);
        end
        function CheckInit(asp, wanted_state)
            exists = asp.HasInitted();
            if wanted_state == true && ~exists
                error("Aspen istance is not initiated");
            end
            if wanted_state == false && exists
                error("Aspen istance is already initiated");
            end
        end

        function asp = StartBkp(asp, file_path, relative)
            arguments
                asp AspenInstance;
                file_path string;
                relative = false
            end

            asp.CheckInit(false);

            path = file_path;
            if relative
                path = sprintf("%s/%s", pwd, file_path);
            end
            
            asp.Aspen = actxserver('Apwn.Document.37.0');
            asp.Aspen.invoke('InitFromArchive2', path);
            asp.Aspen.Visible = 0;
            asp.Aspen.SuppressDialogs = 1;
        end
        function SetVisibility(asp, vis)
            asp.CheckInit(true);

            asp.Aspen.Visible = vis;
        end

        function TryRun(asp, ign_err)
             asp.CheckInit(true);

             try
                 asp.Aspen.Run2();
             catch e
                 if ign_err
                    disp("Ignoring aspen runtime error: ")
                    disp(e)
                 else
                     error(e)
                 end
             end
        end

        function [asp] = CloseAndExit(asp)
            asp.CheckInit(true);

            asp.Aspen.Quit;
            asp.Aspen.Close;
            asp.Aspen.delete;

            asp.Aspen = [];
        end

        function [n] = GetTreeNode(asp, elms)
            arguments
                asp AspenInstance;
                elms (1, :) string;
            end
            
            asp.CheckInit(true);
            n = AspenInstance.TraverseNode(asp.Aspen.Tree, elms);
        end

        function [c] = GetTreeNodeChildren(asp, elms)
            arguments
                asp AspenInstance;
                elms (1, :) string;
            end

            node = asp.GetTreeNode(elms);
            c = AspenInstance.GetNodeChildren(node);
        end
        
        function [v, t] = GetTreeNodeValue(asp, elms)
            arguments
                asp AspenInstance;
                elms (1, :) string;
            end
            node = asp.GetTreeNode(elms);
            [v, t] = AspenInstance.GetNodeValue(node);
        end
        function SetTreeNodeValue(asp, elms, value)
            arguments
                asp AspenInstance;
                elms (1, :) string;
                value;
            end
            node = asp.GetTreeNode(elms);
            AspenInstance.SetNodeValue(node, value);
        end

        function [v, t] = GetTreeNodeAttribute(asp, elms, atr_idx)
            arguments
                asp AspenInstance;
                elms (1, :) string;
                atr_idx;
            end
            node = asp.GetTreeNode(elms);
            [v, t] = AspenInstance.GetNodeAttribute(node, atr_idx);
        end

        function [c] = AddTreeNodeChild(asp, elms, flag)
            arguments
                asp AspenInstance;
                elms (1, :) string;
                flag string;
            end
            node = asp.GetTreeNode(elms);
            c = AspenInstance.AddNodeChild(node, flag);
        end

        function DeleteAllTreeNodeChildren(asp, elms)
            arguments
                asp AspenInstance;
                elms (1, :) string;
            end
            node = asp.GetTreeNode(elms);
            AspenInstance.DeleteAllChildren(node);
        end

    end

    methods(Static)
        function [n] = TraverseNode(node, elms)
            arguments
                node;
                elms (1, :) string;
            end
            n = node;
            for en = elms
                n = n.FindNode(en);
            end
        end
        function [c] = GetNodeChild(node, i)
            c = node.Elements.Item(i-1);
        end
        function [c] = GetNodeChildren(node)
            num = node.Elements.Count;
            for i = 1:num
                c(i) = AspenInstance.GetNodeChild(node, i);
            end

            if ~exist('c','var') || isempty(c)
                c = [];
            end
        end
        function [v, t] = GetNodeValue(node)
            v = node.Value;
            t = node.ValueType;
        end
        function SetNodeValue(node, value)
            node.Value = value;
        end
        function [v, t] = GetNodeAttribute(node, atr_idx)
            v = node.AttributeValue(atr_idx+0);
            t = node.AttributeType(atr_idx+0);
        end

        function [c] = AddNodeChild(node, flag)
            c = node.Elements.Add(flag);
        end

        function DeleteNodeChild(node, ch_name)
            node.Elements.Remove(ch_name);
        end

        function DeleteAllChildren(node)
            for i = 1:node.Elements.Count
                node.Elements.Remove(node.Elements.Item(0).Name);
            end 
        end
    end
end