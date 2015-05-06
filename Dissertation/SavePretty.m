function SavePretty(h,filename_base)
    saveas(h,filename_base,'fig');
    export_fig( filename_base,  '-pdf' , '-nocrop' , '-a1' , '-transparent' , '-q101' , '-p30',h)
return
end