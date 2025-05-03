function stop = opt_fun_prt(x, optimValues, state)
global pval

stop = false;

hold on;
if exist('pval', 'var') && optimValues.iteration > 0
    plot([optimValues.iteration-1, optimValues.iteration], [pval, optimValues.fval], 'b-*');
    drawnow
end


fprintf("\nOptimization step %d (%s)\n", optimValues.iteration, optimValues.procedure);
for xxi = 1:length(x)
    fprintf(" %d) %.6f\n", xxi, x(xxi));
end
fprintf("Cost: %.0f (ΔC = %.5f) @ Evals = %d\n", optimValues.fval, optimValues.fval-pval, optimValues.funccount);

pval = optimValues.fval;

end