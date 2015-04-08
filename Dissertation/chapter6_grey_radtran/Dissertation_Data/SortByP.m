function [data_hold] = SortByP(fid , n_data , data_hold , dim_4 , width)
% % % sort a file by DFEM trial space degree 

for i=1:1:n_data
    err_info = ReadErrorFileLine(fid);
    
    data_hold(i,1,err_info.p_ord,dim_4) = width/err_info.n_cell;
    data_hold(i,2,err_info.p_ord,dim_4) = err_info.err;    
end

for p=1:1:4
   data_hold(:,:,p,dim_4) = sortrows( data_hold(:,:,p,dim_4) );
end

return
end