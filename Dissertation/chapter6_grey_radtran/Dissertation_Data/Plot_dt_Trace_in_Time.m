function Plot_dt_Trace_in_Time(iter_files,max_steps)

    n_files = length(iter_files);
    close all

    color_str = cell(2,8);
    color_str(1,1) =  cellstr('-') ;  
    color_str(1,2) = cellstr('--' ) ;
    color_str(1,3) = cellstr('-.' ) ;   
    color_str(1,4) = cellstr(':' ); 
    color_str(1,5) =  cellstr('-') ;  
    color_str(1,6) = cellstr('--' ) ;
    color_str(1,7) = cellstr('-.' ) ;   
    color_str(1,8) = cellstr(':' ); 

    color_str(2,1) = {[0 0 0] } ;
    color_str(2,2) = {[1 0 0]} ;
    color_str(2,3) = {[0 0.8 0]} ;
    color_str(2,4) = {[0 0 1]} ;
    color_str(2,5) = {[1 0 1] } ;
    color_str(2,6) = {[0 0.5 0.5]} ;
    color_str(2,7) = {[0 1 1]} ;
    color_str(2,8) = {[0.5 0 0]} ;


    for i=1:1:n_files
        fid = fopen( char( iter_files(i,1) ) , 'r')
        [n_steps, time_trimmed, dt_accepted] = Parse_Full_Iteration_File_in_Time(fid, max_steps(i,1) );
%         fprintf('%s :  repeats %i  n_steps %i \n',char( iter_files(i,1) ) , n_repeat , n_steps);

%         ts = 1:1:n_steps;
%         ts  = ts ./ n_steps;
        hold on
        plot(time_trimmed,dt_accepted, char( color_str(1,i) ) , 'Color' , color_str{2,i} ,'LineWidth',1.5)
        fclose(fid);
    end

    set(gca,'YScale','log')
    axis([0 .1 1E-9 1E-3])
    xlabel('Simulation Time [sh]', 'Interpreter','latex','FontName','Times','FontSize',24)
    ylabel('$\Delta t$ Accepted [sh]','Interpreter','latex','FontSize',24)
    set(gca,'FontName','Times','FontSize',30)
    set(gcf,'OuterPosition',[-7 33 1936 1056],'PaperPosition',[0.2500  2.5000 8.0000 6.0000],'PaperSize',[8.5 11] , 'Position', [1 41 1920  964])

return
end