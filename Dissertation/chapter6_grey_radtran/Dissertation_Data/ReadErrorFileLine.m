function err_data = ReadErrorFileLine(fid)
% read an error file that we are handed, pull relevant data
    err_data = struct('err',0,'n_cell',0,'n_steps',0,'time_meth',[],'p_ord',0);
    junk = fscanf(fid,'%s',1);
    err_data.n_cell = fscanf(fid,'%i',1);
    
    junk = fscanf(fid,'%s',1);
    err_data.p_ord = fscanf(fid,'%i',1);
    
    junk = fscanf(fid,'%s',1);
    err_data.time_meth = fscanf(fid,'%s',1);
    
    junk = fscanf(fid,'%s',1);
    err_data.n_steps = fscanf(fid,'%i',1);
    
    for i=1:1:9
        junk =fscanf(fid,'%s',1);
    end
    err_data.err = fscanf(fid,'%e',1);
    
    for i=1:1:4
        junk = fscanf(fid,'%s',1);
    end   

return
end