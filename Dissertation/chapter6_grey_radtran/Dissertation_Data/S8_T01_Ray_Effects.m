% plot each methd and P as the mesh get refined
% use the finest time step size
close all

p=3;
[q,w] = lglnodes(p+1);
[dfem_mat , d_dfem_mat] = feshpln(linspace(-1,1,10) , q , p);

cell_base = {   sprintf('Marshak_Results/MW_S8_Cv1_T01_SigA_1') ...
                };

data_base = {   sprintf('Marshak_Results/MW_S8_Cv1_T01_SigA_1') ...
                };

Dark_Arts_Plotter(1,2 ,cell_base,data_base,dfem_mat)
        
% Temperature
% figure(1)
% set(gca, 'FontName','Times','FontSize',18)
% axis([0 0.07 -0.05 1]) 
% SavePretty(gcf,'S8_T01_Temperature_Cv1_SigA1');

% Radiation
figure(2)
set(gca, 'FontName','Times','FontSize',18)
axis([0 0.07 -0.05 2.2])
text(0.02 , 1.5 , '$\mu=0.1834$' , 'Interpreter','latex','FontSize',18 );
text(0.055 , 0.4 ,'$\mu=0.5255$', 'Interpreter','latex','FontSize',18 );
set(gcf,'OuterPosition',[-7 33 1936 1056],'PaperPosition',[0.2500  2.5000 8.0000 6.0000],'PaperSize',[8.5 11] , 'Position', [1 41 1920  964])
SavePretty(gcf,'S8_T01_Radiation_Cv1_SigA1');

        
% figure(3)
%             
% n_dir = 8;
% n_grp = 1;
% 
% n_skip = 20; 
% Marshak_Intensity_Plotter(3,cell_base,data_base,dfem_mat,n_skip,n_dir,n_grp)       
% set(gca, 'FontName','Times','FontSize',18)
% axis([0 0.07 1E-6 10])
% set(gca,'FontName','Times','FontSize',30)
% set(gca,'YScale','log')
% h = legend('$\mu=-.9603$','$\mu=-.7967$','$\mu=-.5255$','$\mu=-.1834$','$\mu=.1834$','$\mu=.5255$','$\mu=.7967$','$\mu=.9603$','Location','SouthWest');
% set(h,'Interpreter','latex','FontSize',30)
% xlabel('Position','FontSize',30,'Interpreter','latex');
% ylabel('Intensity','FontSize',30,'Interpreter','latex');
% set(gcf,'OuterPosition',[-7 33 1936 1056],'PaperPosition',[0.2500  2.5000 8.0000 6.0000],'PaperSize',[8.5 11] , 'Position', [1 41 1920  964])
% SavePretty(gcf,'S8_T01_Intensity')