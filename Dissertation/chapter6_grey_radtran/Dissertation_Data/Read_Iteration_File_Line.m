function [stat_line] = Read_Iteration_File_Line(fid)
% read  single line of a dark-arts status file
% Time_step:      6 Stage:  0 Thermal_iter:     1 dt: 7.59149e-10 number_of_inner_solves: 2 Relative_Error: 0.00000e+00 Damping: 1.00000e+00

stat_line = struct('is_line' , false , 'step_num' , -1 , 'stage_num' , -1 , 'n_thermal' , -1 , 'dt_size' , -1 , 'n_inner' , -1);

str_1 = fscanf(fid,'%s',1);

if(strcmp(str_1,'Time_step:') )
    stat_line.is_line = true; 
    
    stat_line.step_num = fscanf(fid,'%i',1);
    
    str_stage = fscanf(fid,'%s',1);
    stat_line.stage_num = fscanf(fid,'%i',1);
    
    str_thermal_iter = fscanf(fid,'%s',1);
    stat_line.n_thermal = fscanf(fid,'%i',1);
    
    str_dt = fscanf(fid,'%s',1);    
    stat_line.dt_size = fscanf(fid,'%e',1);
    
    str_n_inner = fscanf(fid,'%s',1);
    stat_line.n_inner = fscanf(fid,'%i',1);
    
    str_the_rest_vec = fscanf(fid,'%s'  , 4);
else
   stat_line.is_line = false; 
end

return;
end