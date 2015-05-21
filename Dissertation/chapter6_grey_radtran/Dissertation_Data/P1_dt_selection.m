

iter_files = {  sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P1_100C_Volumetric_1P_1C_iteration_status.txt'); ...
                sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P1_100C_Dumb_1P_0eV_iteration_status.txt'); ...
                sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P1_100C_Pointwise_1P_0eV_iteration_status.txt'); };
            
max_steps = [50000; 78000; 78000 ];




Plot_dt_Trace_in_Time(iter_files,max_steps)

h = legend('Volumetric','Point-wise','Modified 0eV');

set(h,'Interpreter','latex','FontSize',24)

SavePretty(gcf,'P1_vs_time')


Plot_dt_Trace(iter_files,max_steps)

h = legend('Volumetric','Point-wise','Modified 0eV');

set(h,'Interpreter','latex','FontSize',24)

SavePretty(gcf,'P1_vs_step')


