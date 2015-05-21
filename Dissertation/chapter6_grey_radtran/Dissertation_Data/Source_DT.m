
iter_files = {  sprintf('Physical_Marshak/Iteration_Status/Physical_Source_S8_P3_1000C_Dumb_1P_iteration_status.txt'); ...
                sprintf('Physical_Marshak/Iteration_Status/Physical_Source_S8_P3_1000C_Pointwise_1P_iteration_status.txt');...
                sprintf('Physical_Marshak/Iteration_Status/Physical_Source_S8_P3_1000C_Volumetric_1P_iteration_status.txt');...
                };
            

            
max_steps = [ 1400 ; 1400 ; 1400] ;
Plot_dt_Trace(iter_files,max_steps)
h = legend('Pointwise','Modified Pointwise $T_{offset} = 0~[eV]$','Volumetric $N_{cg}=1$','Location','SouthEast');
set(h,'Interpreter','latex','FontSize',24)
% 

% 
SavePretty(gcf,'Source_dt_trace')


