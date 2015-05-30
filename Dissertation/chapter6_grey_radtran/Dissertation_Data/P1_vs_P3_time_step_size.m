% % 100 cells P1 vs 100 cells P3, modified adaptive T_offset = 1eV

iter_files = {  sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P1_100C_Pointwise_1p_1eV_iteration_status.txt'); ...
                sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P3_100C_Pointwise_1p_1eV_iteration_status.txt'); ...
    };
            
max_steps = [ 185000 ; 560000 ];




Plot_dt_Trace_in_time(iter_files,max_steps)

h = legend('Linear', 'Cubic', 'Location','SouthEast');

set(h,'Interpreter','latex','FontSize',24)

axis([0.01 0.015 1E-9 1E-5])
SavePretty(gcf,'S8_P1_vs_P3_Pointwise_in_time_zoom')

