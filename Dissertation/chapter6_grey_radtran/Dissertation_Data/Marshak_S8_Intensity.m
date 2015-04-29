function Marshak_S8_Intensity()

close all

cell_base = {  
               sprintf('Marshak_Results/Marshak_Wave_SL_Gauss_P4_S8_More_Cells') ...
            };
             
data_base = {  
               sprintf('Marshak_Results/Marshak_Wave_SL_Gauss_P4_S8_More_Cells')...
            };
          
[quad_pt , w] = GLNodeWt(5);
[dfem_mat,junk] = feshpln( linspace(-1,1, 15) , quad_pt ,4);
            
n_dir = 8;
n_grp = 1;
% n_skip = 300; % set for 10k cells looking at x\in[0, 0.5]
n_skip = 20; % set for 10k cells looking at x\in[0.17, 0.19]
Marshak_Intensity_Plotter(1,cell_base,data_base,dfem_mat,n_skip,n_dir,n_grp)         
% 
% % Dark_Arts_Plotter(1,2,cell_base,data_base,dfem_mat)    
% 
% % -0.9603
% %    -0.7967
% %    -0.5255
% %    -0.1834
% %     0.1834
% %     0.5255
% %     0.7967
% %     0.9603
% figure(1)
% % h = legend('$\mu=-.9603$','$\mu=-.7967$','$\mu=-.5255$','$\mu=-.1834$','$\mu=.1834$','$\mu=.5255$','$\mu=.7967$','$\mu=.9603$');
% % set(h,'Interpreter','latex','FontSize',16)
% 
% % % linear plot of whole wavefront
% % axis([0.0 0.5 0.0 2])
% % set(gca,'FontSize',18,'FontName','Times')
% % SavePretty(gcf,'S8_Intensity_Big')
% % 
% zooming on interesting regions, semilogy
% axis([0.15 0.45 1E-6 2])
% set(gca,'YScale','log')
% h = legend('$\mu=-.9603$','$\mu=-.7967$','$\mu=-.5255$','$\mu=-.1834$','$\mu=.1834$','$\mu=.5255$','$\mu=.7967$','$\mu=.9603$','Location','SouthWest');
% set(h,'Interpreter','latex','FontSize',24)
% set(gca,'XTick',[0.15 0.2 0.25 0.3 0.35 0.4 0.45])
% set(gca,'FontName','Times','FontSize',30)
% set(h,'Interpreter','latex','FontSize',30)
% xlabel('Position','FontSize',30,'Interpreter','latex');
% ylabel('Intensity','FontSize',30,'Interpreter','latex');
% set(gcf,'OuterPosition',[-7          33        1936        1056],'PaperPosition',[0.2500    2.5000    8.0000    6.0000],'PaperSize',[8.5 11] , 'Position', [1          41        1920         964])
% SavePretty(gcf,'S8_Intensity_SemiLogy')
% 
% % zoom of glancing early wavefront
% axis([0.17 0.19 1E-1 2])
% set(gca,'YScale','log')
% h = legend('$\mu=-.9603$','$\mu=-.7967$','$\mu=-.5255$','$\mu=-.1834$','$\mu=.1834$','$\mu=.5255$','$\mu=.7967$','$\mu=.9603$','Location','SouthWest');
% set(gca,'XTick',[0.17 0.175 0.18 0.185 0.19])
% set(gca,'FontName','Times','FontSize',16)
% set(h,'Interpreter','latex','FontSize',16)
% SavePretty(gcf,'S8_pos_mu_glance_boundary_layer_log')
% 
% axis([0.17 0.19 1E-1 2])
% set(gca,'YScale','linear')
% h = legend('$\mu=-.9603$','$\mu=-.7967$','$\mu=-.5255$','$\mu=-.1834$','$\mu=.1834$','$\mu=.5255$','$\mu=.7967$','$\mu=.9603$','Location','SouthWest');
% set(gca,'XTick',[0.17 0.175 0.18 0.185 0.19])
% set(gca,'FontName','Times','FontSize',16)
% set(h,'Interpreter','latex','FontSize',16)
% SavePretty(gcf,'S8_pos_mu_glance_boundary_layer_linear')

% zoom of thermal wavefront boundary layers
set(gca,'YScale','log')
axis([0.42 0.43 1E-6 2])
h = legend('$\mu=-.9603$','$\mu=-.7967$','$\mu=-.5255$','$\mu=-.1834$','$\mu=.1834$','$\mu=.5255$','$\mu=.7967$','$\mu=.9603$','Location','SouthWest');
set(gca,'XTick',[0.42 0.422 0.424 0.426 0.428 0.43])
set(gca,'FontName','Times','FontSize',30)
set(h,'Interpreter','latex','FontSize',30)
xlabel('Position','FontSize',30,'Interpreter','latex');
ylabel('Intensity','FontSize',30,'Interpreter','latex');
set(gcf,'OuterPosition',[-7 33 1936 1056],'PaperPosition',[0.2500  2.5000 8.0000 6.0000],'PaperSize',[8.5 11] , 'Position', [1 41 1920  964])
SavePretty(gcf,'S8_thermal_wavefront_boundary_layer')

return
end