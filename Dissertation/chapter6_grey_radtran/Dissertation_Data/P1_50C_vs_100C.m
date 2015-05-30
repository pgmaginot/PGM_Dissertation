% % 50 cells P1 vs 100 cells P1, pointwise adaptive

iter_files = {  sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P1_50C_Dumb_1p_0eV_iteration_status.txt'); ...
    sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P1_100C_Dumb_1p_0eV_iteration_status.txt'); ...
    };
            
max_steps = [78000; 78000 ];




Plot_dt_Trace_in_Time(iter_files,max_steps)

h = legend('Point-wise 50 Cells','Point-wise 100 Cells', 'Location','SouthEast');

set(h,'Interpreter','latex','FontSize',24)

% SavePretty(gcf,'S8_P1_50C_vs_100C_Pointwise_in_time')


axis([0.00 0.02 1E-8 1e-4])

SavePretty(gcf,'S8_P1_50C_vs_100C_Pointwise_in_time_zoom')