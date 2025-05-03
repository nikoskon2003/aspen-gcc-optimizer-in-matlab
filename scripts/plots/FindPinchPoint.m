function [Mx, Px] = FindPinchPoint(Xc, Yc, Xh, Yh, DTm)
    if DTm <= 0
        error("DTmin is less than zero");
    end

    Xc = Xc - Xc(1);
    Xh = Xh - Xh(1);

    sL = min(-Xh(end), Xc(end));
    sH = max(-Xh(end), Xc(end));

    eps = 1e-5;
    max_iters = ceil(2*log2((sH-sL)/eps));

    Mx = (sH+sL)/2;
    for i = 1:max_iters
      [X, Y] = SubtractPlots(Xc, Yc, Xh+Mx, Yh);

      diff = min(Y)-DTm;
      Px = X(Y == min(Y));

      if diff < 0
        sH = Mx;
      else
        sL = Mx;
      end

      Mx = (sH+sL)/2;

      if abs(diff) < eps
        break;
      end
    end

    if i == max_iters
        warning("Pinch point max iters reached");
    end
end