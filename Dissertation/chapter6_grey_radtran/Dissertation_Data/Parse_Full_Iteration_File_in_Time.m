function [n_steps, time_trimmed, dt_trimmed] = Parse_Full_Iteration_File_in_Time(fid, max_steps)

line_data_old = Read_Iteration_File_Line(fid);
n_stage_in_cpp = line_data_old.stage_num;

dt_accepted = zeros(max_steps,1);
time = dt_accepted;

n_repeat = 0;
n_steps = 0;
while true
    line_data_new = Read_Iteration_File_Line(fid);
    % we will never go past this point until we figure n_stage_in_cpp
    if(line_data_new.stage_num > n_stage_in_cpp);
        n_stage_in_cpp = line_data_new.stage_num;
        line_data_old = line_data_new;
        continue;
    else
        break;
    end
end

% right now line_data_t_new has the first stage of the second attempted time step
% line_data_t_old has the last stage of the first attempted time step

while true    
    if( line_data_new.step_num == line_data_old.step_num)
        % time step was too big and now it is being repeated
        n_repeat = n_repeat +1;
    else
      % we know that we accepted the line_data_old time step size 
      n_steps = n_steps + 1;
      dt_accepted(line_data_old.step_num+1,1) = line_data_old.dt_size;
      if(n_steps > 1)
         time(n_steps,1) = time(n_steps - 1,1) + line_data_old.dt_size;
      else
          time(n_steps,1) = line_data_old.dt_size;
      end
      line_data_old = line_data_new;
    end
    
    % last line read will be the start of the next attempted time step
    for s=0:1:n_stage_in_cpp
       line_data_new =  Read_Iteration_File_Line(fid);
       if(~line_data_new.is_line)
           break;
       end
    end    
    
    
    % we did not get a complete iteration status line, and need to leave
    % the loop
    if(line_data_new.step_num < 0)
        break;
    end  
    
end

time_trimmed = time(1:n_steps,1);
dt_trimmed = dt_accepted(1:n_steps,1);

return
end