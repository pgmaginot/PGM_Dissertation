
% 
% iter_files = {  sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P3_100C_Volumetric_1P_1C_iteration_status.txt'); ...
%                 sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P3_100C_Volumetric_1P_2C_iteration_status.txt'); ...
%                 sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P3_100C_Volumetric_1P_5C_iteration_status.txt'); ...
%               sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P3_100C_Volumetric_1P_10C_iteration_status.txt'); ...
%                 sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P3_100C_Volumetric_1P_25C_iteration_status.txt'); ...
%                sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P3_100C_Volumetric_1P_50C_iteration_status.txt'); ...
%                 sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P3_100C_Volumetric_1P_100C_iteration_status.txt'); ...
%                 };
%             
% max_steps = [ 132100 ; 68200 ; 29700 ; 16700 ; 9800 ; 7200 ; 6000];
% 
% 
% 
% Plot_dt_Trace(iter_files,max_steps)
% % Plot_dt_Trace_in_Time(iter_files,max_steps)
% 
% h = legend('$N_{cg} = 1$','$N_{cg}=100$','Location','NorthWest');
% 
% set(h,'Interpreter','latex','FontSize',24)

% SavePretty(gcf,'Volumetric_Trace_1cg_vs_100cg_vs_time')

%
%

clear all

figure(2)
iter_files = {...  sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P3_100C_Volumetric_1P_1C_iteration_status.txt'); ...
               ... sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P3_100C_Volumetric_1P_2C_iteration_status.txt'); ...
                sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P3_100C_Volumetric_1P_5C_iteration_status.txt'); ...
             ... sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P3_100C_Volumetric_1P_10C_iteration_status.txt'); ...
                sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P3_100C_Volumetric_1P_25C_iteration_status.txt'); ...
             ...  sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P3_100C_Volumetric_1P_50C_iteration_status.txt'); ...
               ... sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P3_100C_Volumetric_1P_100C_iteration_status.txt'); ...
                };
            
max_steps = [ 132100 ; 68200 ; 29700 ; 16700 ; 9800 ; 7200 ; 6000];



% Plot_dt_Trace(iter_files,max_steps)
Plot_dt_Trace_in_Time(iter_files,max_steps)

h = legend('$N_{cg} = 5$','$N_{cg}=25$','Location','NorthWest');

set(h,'Interpreter','latex','FontSize',24)


axis([ 0.03 0.05 1E-8 1E-3])

% SavePretty(gcf,'Volumetric_Trace_5cg_vs_25cg_vs_time_zoom')




