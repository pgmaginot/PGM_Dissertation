
iter_files = {  sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P3_100C_Pointwise_1P_1eV_iteration_status.txt'); ...
                sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P3_100C_Pointwise_1P_5eV_iteration_status.txt'); ...
                sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P3_100C_Pointwise_1P_50eV_iteration_status.txt'); ...
                };
            
max_steps = [560000; 400000 ; 185000];



% Plot_dt_Trace(iter_files,max_steps)
Plot_dt_Trace_in_Time(iter_files,max_steps)

h = legend('$T_{offset}=1~[eV]$','$T_{offset}=5~[eV]$','$T_{offset}=50~[eV]$','Location','NorthWest');

set(h,'Interpreter','latex','FontSize',24)

SavePretty(gcf,'Modified_Pointwise_T_offset');

axis([0.04 0.045 1E-9 1E-4])

SavePretty(gcf,'Modified_Pointwise_T_offset_zoom');
