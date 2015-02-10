fid = fopen('file_list.txt')

while(~feof(fid))
    str_date = fscanf(fid,'%s',1);
    str_time = fscanf(fid,'%s',1);
    pm_str =fscanf(fid,'%s',1);
    size_str = fscanf(fid,'%s',1);
    file_name = fscanf(fid,'%s',1);
    
    h = open(file_name);
    
    png_file = strrep(file_name, '.fig', '.png');
    
    saveas(h,png_file,'png');
    
    junk = fgets(fid) ;
    close(h);
end

fclose(fid)