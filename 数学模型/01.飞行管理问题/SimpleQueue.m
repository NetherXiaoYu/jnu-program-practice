classdef SimpleQueue
    properties
        q = []
        index = 1
    end

    methods
        function obj = push(obj, x)
            obj.q = [obj.q x];
        end
        function [x, obj] = pop(obj)
            x = 0;
            x = obj.q(obj.index);
            obj.index = obj.index + 1;
        end
        function x = empty(obj)
            x = false;
            [m, n] = size(obj.q);
            x = obj.index > n;
        end
    end
end
