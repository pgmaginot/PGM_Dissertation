% 
% 
% iter_files = {  sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S1_P1_100C_Volumetric_1P_1C_iteration_status.txt'); ...
%                 sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P1_100C_Dumb_1P_0eV_iteration_status.txt'); ...
%                 sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P1_100C_Pointwise_1P_0eV_iteration_status.txt'); };
%             
% max_steps = [50000; 78000; 78000 ];
% 
% 
% 
% 
% Plot_dt_Trace_in_Time(iter_files,max_steps)
% 
% h = legend('Volumetric','Point-wise','Modified 0eV');
% 
% set(h,'Interpreter','latex','FontSize',24)
% 
% SavePretty(gcf,'P1_vs_time')
% 
% 
% Plot_dt_Trace(iter_files,max_steps)
% 
% h = legend('Volumetric','Point-wise','Modified 0eV');
% 
% set(h,'Interpreter','latex','FontSize',24)
% 
% SavePretty(gcf,'P1_vs_step')
% 
% 



iter_files = {  sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S2_P1_50C_Volumetric_1P_1C_iteration_status.txt'); ...
                sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S2_P1_50C_Dumb_1P_0eV_iteration_status.txt'); ...
                sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S2_P1_50C_Pointwise_1P_0eV_iteration_status.txt'); };
            
max_steps = [50000; 78000; 78000 ];




Plot_dt_Trace_in_Time(iter_files,max_steps)

h = legend('Volumetric, $N_{cg}=1$','Point-wise','Modified Point-wise, $T_{offset}=0~[eV]$');

set(h,'Interpreter','latex','FontSize',24)

% SavePretty(gcf,'S2_P1_vs_time')


% Plot_dt_Trace(iter_files,max_steps)
% 
% h = legend('Volumetric','Point-wise','Modified 0eV');
% 
% set(h,'Interpreter','latex','FontSize',24)

% SavePretty(gcf,'S2_P1_vs_step')


