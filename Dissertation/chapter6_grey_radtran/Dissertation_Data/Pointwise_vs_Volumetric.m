

% iter_files = {  sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P3_100C_Pointwise_1P_5eV_iteration_status.txt'); ...
%                 sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P3_100C_Pointwise_1P_50eV_iteration_status.txt'); ...
%                 };
%             
% max_steps = [400000 ; 185000];
% 
% 
% 
% Plot_dt_Trace(iter_files,max_steps)
% % Plot_dt_Trace_in_Time(iter_files,max_steps)
% 
% h = legend('Modifieid 5eV','Modified 50eV','Location','NorthWest');
% 
% set(h,'Interpreter','latex','FontSize',24)
% 
% SavePretty(gcf,'Pointwise_1eV_vs_50eV_in_time_vs_step')
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% Plot_dt_Trace_in_Time(iter_files,max_steps)
% % 
% h = legend('Modifieid 5eV','Modified 50eV','Location','NorthWest');
% % 
% set(h,'Interpreter','latex','FontSize',24)
% % 
% SavePretty(gcf,'Pointwise_1eV_vs_50eV_in_time')

%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% iter_files = {  ...
%               ...  sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P3_100C_Volumetric_1P_1C_iteration_status.txt');
%                 sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P3_100C_Volumetric_1P_1C_iteration_status.txt'); ...
%                 sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P3_100C_Pointwise_1P_50eV_iteration_status.txt'); 
%                 };
%             
% 
%             
% max_steps = [ 30000 ; 185000];
% Plot_dt_Trace_in_Time(iter_files,max_steps)
% h = legend('Volumetric $N_{cg}=1$','Modified 50eV','Location','NorthWest');
% set(h,'Interpreter','latex','FontSize',24)
% % 
% 
% % 
% SavePretty(gcf,'Volumetric_1C_vs_50eV_in_time')

iter_files = {  ...
                sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P3_100C_Volumetric_1P_2C_iteration_status.txt');
                sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P3_100C_Volumetric_1P_5C_iteration_status.txt'); ...
          ...      sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P3_100C_Pointwise_1P_50eV_iteration_status.txt'); 
                };
            

            
max_steps = [ 68200 ; 29700] ;
Plot_dt_Trace_in_Time(iter_files,max_steps)
h = legend('Volumetric $N_{cg}=2$','Volumetric $N_{cg}=5$','Location','NorthWest');
set(h,'Interpreter','latex','FontSize',24)
% 

% 
SavePretty(gcf,'Volumetric_2C_vs_5C_in_time')


