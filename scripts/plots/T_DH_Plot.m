function T_DH_Plot(Streams, f, fmt)
    figure(f);
    hold on;
    grid on;
    
    Q = 0;
    for i = 1:length(Streams)
        DH = Streams(i).Q;

        X = [Q, Q + DH];
        Y = [Streams(i).T, Streams(i).T_e];

        plot(X, Y - 273.15, fmt);
        xlabel("ΔΗ");
        ylabel("T (^oC)");
        
        if ~endsWith(Streams(i).Name, '$')
            text(mean(X), mean(Y)-273.15, Streams(i).Name)
        end

        Q=Q+DH;
    end
end