iter_files = {  sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P3_100C_Pointwise_1P_1eV_iteration_status.txt'); ...
                sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P3_100C_Pointwise_1P_5eV_iteration_status.txt'); ...
                sprintf('Physical_Marshak/Iteration_Status/MW_Physical_S8_P3_100C_Pointwise_1P_50eV_iteration_status.txt'); ...
                };
            
max_steps = [560000; 400000 ; 185000];



Plot_dt_Trace(iter_files,max_steps)