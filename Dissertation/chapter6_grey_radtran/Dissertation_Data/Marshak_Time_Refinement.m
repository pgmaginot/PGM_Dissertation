% plot each methd and P as the mesh get refined
% use the finest time step size
close all

data_meth = 'SL_Gauss';
cell_meth = 'SL_Gauss';
quad_f = @GLNodeWt;
p = 4;

[quad_pt , w] = quad_f(p+1);
[dfem_mat,junk] = feshpln( linspace(-1,1,p+10) , quad_pt ,p);

cell_base = { sprintf('Marshak_Results/%s_P%i_1280_cell',cell_meth,p) };

 data_base = {  sprintf('Marshak_Results/Marshak_Wave_%s_P%i_Base_Refine_64_Cells_64_Time',data_meth,p) ...
                sprintf('Marshak_Results/Marshak_Wave_%s_P%i_Base_Refine_64_Cells_16_Time',data_meth,p)...
                sprintf('Marshak_Results/Marshak_Wave_%s_P%i_Base_Refine_64_Cells_4_Time',data_meth,p)...
                sprintf('Marshak_Results/Marshak_Wave_%s_P%i_Base_Refine_64_Cells_1_Time',data_meth,p) };

Dark_Arts_Plotter(1,2 ,cell_base,data_base,dfem_mat)
        
temperature_file = sprintf('Time_Refinement_Zoom_Temperature');
rad_file = sprintf('Time_Refinement_Zoom_Radiation');
        
% Temperature
figure(1)
h = legend('$\frac{\Delta t}{64}$' ,'$\frac{\Delta t}{16}$' , '$\frac{\Delta t}{4}$','$\Delta t$' );
set(h,'Interpreter','latex','FontSize',14);
axis([0.38 0.39 0 0.5])
SavePretty( 1 , temperature_file);

% Radiation
figure(2)
h = legend('$\frac{\Delta t}{64}$' , '$\frac{\Delta t}{16}$' ,'$\frac{\Delta t}{4}$' ,'$\Delta t$' );
set(h,'Interpreter','latex','FontSize',14);
axis([0.37 0.39 -.05 0.8])
SavePretty(2 , rad_file);