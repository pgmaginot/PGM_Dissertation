close all

p=3;
[q,w] = lglnodes(p+1);
[dfem_mat , d_dfem_mat] = feshpln(linspace(-1,1,10) , q , p);

cell_base = { sprintf('Physical_Marshak/MW_Physical_S8_P3_100C_Volumetric_1P_100C') ...
              sprintf('Physical_Marshak/MW_Physical_S8_P3_100C_Pointwise_1P_5eV') ...
                };

data_base = { sprintf('Physical_Marshak/MW_Physical_S8_P3_100C_Volumetric_1P_100C') , sprintf('Final');...
              sprintf('Physical_Marshak/MW_Physical_S8_P3_100C_Pointwise_1P_5eV') , sprintf('Final');...
                };

Dark_Arts_Plotter(1,2 ,cell_base,data_base,dfem_mat)

figure(1)
h=legend('Volumetric- $N_{cg}=100$', 'Modified- 5eV','Location','SouthWest');
            
axis([0 0.05 -0.25 1]) 
set(h,'Interpreter','latex','FontSize',24)
xlabel('Position [cm]' , 'FontSize',24,'Interpreter','latex')
ylabel('Temperature [keV]','FontSize',24,'Interpreter','latex')
set(gca,'FontName','Times','FontSize',30,'YTick',[-0.2 0 0.2 0.4 0.6 0.8 1.0])

set(gcf,'OuterPosition',[-7 33 1936 1056],'PaperPosition',[0.2500  2.5000 8.0000 6.0000],'PaperSize',[8.5 11] , 'Position', [1 41 1920  964])
SavePretty(gcf,'100C_Physical_Marshak_Wave_Temperature_Adaptive_Comparison_Final')

figure(2)
h=legend('Volumetric- $N_{cg}=100$', 'Modified- 5eV','Location','SouthWest');
            
axis([0 0.05 -0.2 4.5]) 
set(h,'Interpreter','latex','FontSize',24)
xlabel('Position [cm]' , 'FontSize',24,'Interpreter','latex')
ylabel('$\phi$ $[ \frac{jerks}{cm^2~sh} ]$','FontSize',24,'Interpreter','latex')
set(gca,'FontName','Times','FontSize',30 ,'YTick',[-0.2 0.2 1 2 3 4])

set(gcf,'OuterPosition',[-7 33 1936 1056],'PaperPosition',[0.2500  2.5000 8.0000 6.0000],'PaperSize',[8.5 11] , 'Position', [1 41 1920  964])
SavePretty(gcf,'100C_Physical_Marshak_Wave_Radiation_Adaptive_Comparison_Final')

close all
% clear all

cell_base = { sprintf('Physical_Marshak/MW_Physical_S8_P3_100C_Volumetric_1P_100C') ...
              sprintf('Physical_Marshak/MW_Physical_S8_P3_100C_Pointwise_1P_5eV') ...
                };

data_base = { sprintf('Physical_Marshak/MW_Physical_S8_P3_100C_Volumetric_1P_100C') , sprintf('step_970');...
              sprintf('Physical_Marshak/MW_Physical_S8_P3_100C_Pointwise_1P_5eV') , sprintf('step_24268');...
                };

Dark_Arts_Plotter(1,2 ,cell_base,data_base,dfem_mat)

figure(1)
h=legend('Volumetric- $N_{cg}=100$', 'Modified- 5eV','Location','NorthEast');
            
axis([0 0.005 -0.25 1]) 
set(h,'Interpreter','latex','FontSize',24)
xlabel('Position [cm]' , 'FontSize',24,'Interpreter','latex')
ylabel('Temperature [keV]','FontSize',24,'Interpreter','latex')
set(gca,'FontName','Times','FontSize',30,'YTick',[-0.2 0 0.2 0.4 0.6 0.8 1.0])

set(gcf,'OuterPosition',[-7 33 1936 1056],'PaperPosition',[0.2500  2.5000 8.0000 6.0000],'PaperSize',[8.5 11] , 'Position', [1 41 1920  964])
SavePretty(gcf,'100C_Physical_Marshak_Wave_Temperature_Adaptive_Comparison_0_001')

figure(2)
h=legend('Volumetric- $N_{cg}=100$', 'Modified- 5eV','Location','NorthEast');
            
axis([0 0.005 -0.2 3.5]) 
set(h,'Interpreter','latex','FontSize',24)
xlabel('Position [cm]' , 'FontSize',24,'Interpreter','latex')
ylabel('$\phi$ $[ \frac{jerks}{cm^2~sh} ]$','FontSize',24,'Interpreter','latex')
set(gca,'FontName','Times','FontSize',30 ,'YTick',[-0.2 0.2 1 2 3])

set(gcf,'OuterPosition',[-7 33 1936 1056],'PaperPosition',[0.2500  2.5000 8.0000 6.0000],'PaperSize',[8.5 11] , 'Position', [1 41 1920  964])
SavePretty(gcf,'100C_Physical_Marshak_Wave_Radiation_Adaptive_Comparison_0_001')

