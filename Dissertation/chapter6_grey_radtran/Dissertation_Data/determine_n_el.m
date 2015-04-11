function [n] = determine_n_el(fid)

    for j=1:1:100
       pnd_str = fscanf(fid , '%s' , 1);
       if( strcmp(pnd_str , '#') )
           junk = fscanf(fid , '%s' ,1);
       else
           n = j-1;
           break
       end
    end

return
end