clear; clc; close all;

p_names = ["k1"];
output_names = ["comp1", "B", "A", "r1"];

p = param();
[ode_func, out_func, y0, events_conditions, events_affects] = model(p);

%%% default task
t_span = [0 100]; % [0:1:100]
opt = odeset('OutputFcn', out_func, 'Events', events_conditions, 'MaxStep', 1); % odeset(, 'Mass',M,'RelTol',1e-4,'AbsTol',[1e-6 1e-10 1e-6], 'Stats','on');

% solution without events
%[tout, y] = ode15s(ode_func, t_span, y0, opt);

% solution with events
ti = t_span(1);
yi = y0;
tout = [];
output = [];
while ti < t_span(2)
    [t, y, te, ye, ie] = ode15s(ode_func, [ti t_span(2)], yi, opt);

    tout = vertcat(tout, t);
    if isempty(ie)
        break
    end
    ti = t(end);
    ev = events_affects(ie(end));
    yi = ev{1}(ti, ye(end,:));
end

%  plot all outputs from show_names
show_names = ["comp1", "B", "A", "r1"];
[idx, loc] = ismember(show_names, output_names);
figure
hold on
for i = loc
    plot(tout, output(:, i), '-', 'Linewidth', 1)
end
title('Default plot','Fontsize', 14)
xlabel('t', 'Fontsize', 14)
ylabel('records', 'Fontsize', 14)
legend(show_names)
hold off
