function [x, y] = CompoundLine(Streams)
    Ts = TempPoints(Streams);
    Ts = sort(Ts);
    y = Ts;

    T_eps = 1e-2;
    slope_eps = 1e-10;

    slopes = ([Streams.T_e]-[Streams.T])./[Streams.Q];
    slopes(abs(slopes)<slope_eps) = slope_eps;

    m = zeros(length(Ts)-1, 1);
    for s = 1:length(Streams)
        T_start = min(Streams(s).T, Streams(s).T_e);
        T_end = max(Streams(s).T, Streams(s).T_e);
        
        for t = 1:(length(Ts)-1)
            if T_start-T_eps <= Ts(t) && T_end >= Ts(t+1)-T_eps
                m(t) = m(t) + 1/slopes(s);
            end
        end
    end

    x = zeros(length(m)+1, 1);
    x(1) = 0;
    for i = 1:length(m)
        if abs(m(i)) < slope_eps
            % if slope is 0, that means that no stram exists in this region
            % setting x to be almost a vertical line.
            x(i+1) = x(i) + slope_eps;
        else
            x(i+1) = x(i) + (y(i+1)-y(i))*m(i);
        end
    end
end