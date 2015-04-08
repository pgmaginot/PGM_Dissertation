dt_min = 0.001;
dt_max = 0.1;
r = 1.25;

t_start = 0;
t_end = 1;
time_now = t_start;
step = 0;
while(time_now < t_end)
    dt = dt_min *(r^step);
    if(dt > dt_max)
        dt=dt_max;
    end
    time_now = time_now + dt;
    
    fprintf('Step: %i dt:%8.6f Time Now: %8.6f\n',step,dt,time_now);
    step = step + 1;
end