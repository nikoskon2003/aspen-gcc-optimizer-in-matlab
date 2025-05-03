function [X, Y] = SubtractPlots(X1, Y1, X2, Y2)
    X = sort(cat(1, X1, X2));
    X = X(X >= max(X1(1), X2(1)) & X <= min(X1(end), X2(end)));
    Y2i = interp1(X2, Y2, X);     
    Y1i = interp1(X1, Y1, X);
    Y = Y2i - Y1i;
end