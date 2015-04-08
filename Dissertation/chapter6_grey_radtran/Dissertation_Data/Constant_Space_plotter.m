% % % script to generate steady state spatial convergence plots

cxs_phi_a_str = sprintf('Constant_Time/MMS_Constant_Time_CXS_final_space_phi_A_error.txt');
cxs_phi_l2_str = sprintf('Constant_Time/MMS_Constant_Time_CXS_final_space_phi_L2_error.txt');
cxs_temp_a_str = sprintf('Constant_Time/MMS_Constant_Time_CXS_final_space_temperature_A_error.txt');
cxs_temp_l2_str = sprintf('Constant_Time/MMS_Constant_Time_CXS_final_space_temperature_L2_error.txt');

lobatto_phi_a_str = sprintf('Constant_Time/MMS_Constant_Time_SLXS_Lobatto_final_space_phi_A_error.txt');
lobatto_phi_l2_str = sprintf('Constant_Time/MMS_Constant_Time_SLXS_Lobatto_final_space_phi_L2_error.txt');
lobatto_temp_a_str = sprintf('Constant_Time/MMS_Constant_Time_SLXS_Lobatto_final_space_temperature_A_error.txt');
lobatto_temp_l2_str = sprintf('Constant_Time/MMS_Constant_Time_SLXS_Lobatto_final_space_temperature_L2_error.txt');

gauss_phi_a_str = sprintf('Constant_Time/MMS_Constant_Time_SLXS_Gauss_final_space_phi_A_error.txt');
gauss_phi_l2_str = sprintf('Constant_Time/MMS_Constant_Time_SLXS_Gauss_final_space_phi_L2_error.txt');
gauss_temp_a_str = sprintf('Constant_Time/MMS_Constant_Time_SLXS_Gauss_final_space_temperature_A_error.txt');
gauss_temp_l2_str = sprintf('Constant_Time/MMS_Constant_Time_SLXS_Gauss_final_space_temperature_L2_error.txt');

fid = zeros(12,1);

fid(1,1) = fopen(cxs_phi_a_str,'r');
fid(2,1) = fopen(cxs_phi_l2_str,'r');
fid(3,1) = fopen(cxs_temp_a_str,'r');
fid(4,1) = fopen(cxs_temp_l2_str,'r');

fid(5,1) = fopen(lobatto_phi_a_str,'r');
fid(6,1) = fopen(lobatto_phi_l2_str,'r');
fid(7,1) = fopen(lobatto_temp_a_str,'r');
fid(8,1) = fopen(lobatto_temp_l2_str,'r');

fid(9,1) = fopen(gauss_phi_a_str,'r');
fid(10,1) = fopen(gauss_phi_l2_str,'r');
fid(11,1) = fopen(gauss_temp_a_str,'r');
fid(12,1) = fopen(gauss_temp_l2_str,'r');

% load data for cxs
n_data = 
for i=1:1:4
    SortByP
end


for i=1:1:12
   fclose(fid(i,1)); 
end