function [x,t] = GetOneTempData(fid_c, fid_t , n_el )

    % first value we read will be data  then read the next cell number before
    % leaving

    x = fscanf(fid_c , '%f' , [n_el 1] );
    junk = fscanf(fid_c ,'%i' , 1);

    t = fscanf(fid_t , '%f' , [n_el 1]);
    junk = fscanf(fid_t , '%i' , 1);


    return
end