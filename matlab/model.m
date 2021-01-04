%%%% This code was generated by heta-compiler of v0.5.16
% 

function [ode_func, out_func, y0_, events_conditions, events_affects] = nameless_Model(p)

    %%% auxilary
    % ternary operator
    function out = tern__(cond, x, y)
        if cond
            out = x;
        else
            out = y;
        end
    end

    ode_func = @ODEFunc;
    out_func = @OutputFunc;
    events_conditions = @Conditions;
    events_affects = {};
    y0_ = InitFunc();

    % shared variable
    shared_values = zeros(1, 4);
    integrator = [];

    %%% Initialization of dynamic records
    function y__ = InitFunc()
        integrator = []; % reset integrator
        time = 0; % zero time
        B = 0; % B,  ()
        A = 10; % A,  ()
        comp1 = 1; % comp1,  ()
        r1 = p(1) * A * comp1; % r1,  ()

        % before reinitialization
        y0__ = [comp1; A * comp1; B * comp1];

        % reinitialization by events
        y__ = ReinitY0(time, y0__);
    end

    %%% Check events conditions at `zero`
    function y__ = ReinitY0(time, y0)
        
        cond_zero = Conditions(time, y0);
        ev_idxs = find(cond_zero==0, 1);
        
        if ~isempty(ev_idxs)
            for idx = 1:length(ev_idxs)
                ev = events_affects(idx);
                y__ = ev{1}(0.0,y0);
            end
        else
            y__ = y0;
        end
    end

    function status = OutputFunc(time, y, flag)
        switch flag
            case 'done'
                assignin('base', 'output', integrator);
            case 'affect'
                integrator(end, :) = shared_values;
            otherwise
                integrator = [integrator; shared_values];
        end
        status = 0;
    end

    function dydt = ODEFunc(time, y)

        dydt = zeros(3, 1);

        %%% Dynamic records annotation
        %1 - comp1,  () 
        %2 - A,  () 
        %3 - B,  () 

        %%% Output records
        %  () 
        comp1 = y(1);
        %  () 
        B = y(3) / comp1;
        %  () 
        A = y(2) / comp1;
        %  () 
        r1 = p(1) * A * comp1;
        shared_values = [comp1, B, A, r1];

        %%% Differential equations
        dydt(1) = 0;
        dydt(2) = -r1;
        dydt(3) = 2*r1;
    end

    

    function [res,isterminal,direction] = Conditions(time, y)
        direction = ones(0, 1);
        isterminal = ones(0, 1);
        res = [];     
    end
end
