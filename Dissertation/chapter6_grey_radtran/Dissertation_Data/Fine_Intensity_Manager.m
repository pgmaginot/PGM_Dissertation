function Fine_Intensity_Manager()

close all

cell_base = {  
               sprintf('Marshak_Results/Marshak_Wave_10k') ...
            };
             
data_base = {  
               sprintf('Marshak_Results/Marshak_Wave_10k')...
            };
          
[quad_pt , w] = lglnodes(4);
[dfem_mat,junk] = feshpln( linspace(-1,1, 15) , quad_pt , 3);
            
n_dir = 2;
n_grp = 1;
n_skip = 75;
Dark_Arts_Intensity_Plotter(1,cell_base,data_base,dfem_mat,n_skip,n_dir,n_grp)         

% Dark_Arts_Plotter(1,2,cell_base,data_base,dfem_mat)    

figure(1)
h = legend('$\mu=-\frac{1}{\sqrt{3}}$','$\mu=\frac{1}{\sqrt{3}}$');
set(h,'Interpreter','latex','FontSize',16)

axis([0 20E-4 1.73 1.733])
set(gca,'FontSize',18,'FontName','Times')
% SavePretty(gcf,'20_Cells_at_Boundary_Intensity')

axis([0.385 0.39 1E-6 0.6])
set(gca,'YScale','log','YTick',[1E-5 1E-3 1E-1])
SavePretty(gcf,'50_Cells_at_Wavefront_Intensity_Log')
return
end