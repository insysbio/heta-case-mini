clear; clc; close all;

p_names = ["k1"];
output_names = ["comp1", "B", "A", "r1"];

p = param();
y0 = init(p);
[ode_func, out_func] = model();

%%% default task
t_span = [0 100];
opt = odeset('OutputFcn', out_func); % odeset('Mass',M,'RelTol',1e-4,'AbsTol',[1e-6 1e-10 1e-6], 'Stats','on');
% the next string generates "output" variable
[t, y] = ode15s(@(t, y) ode_func(t, y, p), t_span, y0, opt);

figure
hold on
for i = 1:length(output_names)
    plot(t, output(:, i), '-', 'Linewidth', 1)
end
title('Default plot','Fontsize', 14)
xlabel('t', 'Fontsize', 14)
ylabel('records', 'Fontsize', 14)
legend(output_names)
hold off
