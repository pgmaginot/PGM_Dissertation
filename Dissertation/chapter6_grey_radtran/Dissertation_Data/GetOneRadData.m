function [x,r] = GetOneRadData(fid_cell, fid_rad , n_el)
    junk1 = fscanf(fid_rad,'%i',1);
    junk1 = fscanf(fid_rad,'%i',1);
    
    r = fscanf(fid_rad , '%f', [n_el 1]);
    junk1 = fscanf(fid_rad,'%i',1);
    
    x = fscanf(fid_cell , '%f' , [n_el 1] );
    junk = fscanf(fid_cell ,'%i' , 1);

return
end