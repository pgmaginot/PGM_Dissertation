function [x,r] = GetOneIntensityData(fid_c , fid_r , n_el , n_dir, n_grp)
    
    r = cell(n_dir , n_grp);
    
    for g=1:1:n_grp
        for d=1:1:n_dir
            grp_num = fscanf(fid_r,'%i',1);    
            dir_num = fscanf(fid_r,'%i',1);
            r{d,g} = fscanf(fid_r,'%f',[n_el 1]);
            cell_num = fscanf(fid_r,'%i',1);            
        end
    end
    
    x = fscanf(fid_c , '%f' , [n_el 1]);
    junk = fscanf(fid_c, '%i',1);
    
return
end