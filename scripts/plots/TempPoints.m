function [rang] = TempPoints(strms)
    rang = [];

    T_eps = 1e-6;

    for i = 1:length(strms)
        if ~ismembertol(strms(i).T, rang, T_eps)
            rang(end+1) = strms(i).T;
        end

        if ~ismembertol(strms(i).T_e, rang, T_eps)
            rang(end+1) = strms(i).T_e;
        end
    end

    rang = sort(rang);
end