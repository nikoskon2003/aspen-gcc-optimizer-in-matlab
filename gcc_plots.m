clear; clc; close all;
config;

Streams = importdata("exports/OLA_v19.mat");
%Streams = importdata("exports/s-OLA_v19.mat");
Qeps = conf.heat_duty_eps;
addpath("scripts\plots");

mask_hot = ([Streams.T] > [Streams.T_e]) & abs([Streams.Q]) > Qeps;
mask_cold = ([Streams.T] < [Streams.T_e]) & abs([Streams.Q]) > Qeps;

HotStrs = Streams(mask_hot);
CldStrs = Streams(mask_cold);

[~, idx] = sortrows([HotStrs.T].', 'descend');
HotStrs = HotStrs(idx);

[~, idx] = sortrows([CldStrs.T].');
CldStrs = CldStrs(idx);


%T_DH_Plot(CldStrs, 1, 'b-<');
%T_DH_Plot(HotStrs, 2, 'r->');


[Xc, Yc] = CompoundLine(CldStrs);
[Xh, Yh] = CompoundLine(HotStrs);

Yh = Yh - 273.15;
Yc = Yc - 273.15;

figure(1);
hold on;
grid on;
plot(Xc, Yc, 'b.-');
xlabel("ΔΗ");
ylabel("T (^oC)");

figure(2);
hold on;
grid on;
plot(Xh, Yh, 'r.-');
xlabel("ΔΗ");
ylabel("T (^oC)");


%{
for x = -100:1:100
      [~, Y] = SubtractPlots(Xc, Yc, Xh+x, Yh);

      diff = min(Y);
      plot(x, diff, 'r.');
end
%}

DTm = 10;
[Mx, Px] = FindPinchPoint(Xc, Yc, Xh, Yh, DTm);
Xh = Xh + Mx - Px;
Xc = Xc - Px;

figure(3);
hold on;
grid on;
plot(Xc, Yc, 'b.-');
plot(Xh, Yh, 'r.-');
xlabel("ΔΗ (kW)");
ylabel("T (^oC)");

%[Xx, Yy] = SubtractPlots(Xc, Yc, Xh, Yh);
%plot(Xx, Yy, 'g.-');

Yh = Yh - DTm/2;
Yc = Yc + DTm/2;


figure(4);
hold on;
grid on;

plot(Xc, Yc, 'b*-');
plot(Xh, Yh, 'r*-');
xlabel("ΔΗ (kW)");
ylabel("T* (^oC)");


eps = 1e-10;
if Yc(end) < Yh(end)
    Yc(end+1) = Yh(end);
    Xc(end+1) = Xc(end) + eps;
else
    Yh(end+1) = Yc(end);
    Xh(end+1) = Xh(end) + eps;
end

if Yc(1) < Yh(1)
    Yh = [Yc(1), Yh];
    Xh = [Xh(1)-eps, Xh'];
else
    Yc = [Yh(1), Yc];
    Xc = [Xc(1)-eps, Xc'];
end


figure(5);
hold on; grid on;
[Y, X] = SubtractPlots(Yh', Xh, Yc', Xc);
plot(X, Y, 'k.-')
xlim([0, max(X)*1.01])
xlabel("ΔH (kW)");
ylabel("T* (^oC)");


 writetable(table(X, Y, 'VariableNames',["X (ΔΗ)", "Y (T*)"]), ...
            "exports/dhv-ts.xlsx", "WriteMode", "overwrite", "WriteRowNames",true);