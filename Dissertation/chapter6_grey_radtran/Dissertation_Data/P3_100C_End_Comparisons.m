close all

% p=3;
% [q,w] = lglnodes(p+1);
% [dfem_mat , d_dfem_mat] = feshpln(linspace(-1,1,20) , q , p);
% 
% cell_base = { sprintf('Physical_Marshak/MW_Physical_S8_P3_100C_Volumetric_1P_100C') ...
%               sprintf('Physical_Marshak/MW_Physical_S8_P3_100C_Pointwise_1P_1eV') ...
%                 };
% 
% data_base = { sprintf('Physical_Marshak/MW_Physical_S8_P3_100C_Volumetric_1P_100C') , sprintf('Final');...
%               sprintf('Physical_Marshak/MW_Physical_S8_P3_100C_Pointwise_1P_1eV') , sprintf('Final');...
%                 };
% 
% Dark_Arts_Plotter(1,2 ,cell_base,data_base,dfem_mat)
% 
% figure(1)
% h=legend('Volumetric- $N_{cg}=100$', 'Modified Point-wise- $T_{offset}=1~[eV]$','Location','SouthWest');
%             
% axis([0 0.05 -0.25 1]) 
% set(h,'Interpreter','latex','FontSize',24)
% xlabel('Position [cm]' , 'FontSize',24,'Interpreter','latex')
% ylabel('Temperature [keV]','FontSize',24,'Interpreter','latex')
% set(gca,'FontName','Times','FontSize',30,'YTick',[-0.2 0 0.2 0.4 0.6 0.8 1.0])
% 
% set(gcf,'OuterPosition',[-7 33 1936 1056],'PaperPosition',[0.2500  2.5000 8.0000 6.0000],'PaperSize',[8.5 11] , 'Position', [1 41 1920  964])
% SavePretty(gcf,'100C_vs_1ev_Physical_Marshak_Wave_Temperature_Adaptive_Comparison_Final')
% 
% axis([0.042 0.045 -0.2 0.6])
% SavePretty(gcf,'100C_vs_1ev_Physical_Marshak_Wave_Temperature_Adaptive_Comparison_Final_Zoom')
% 
% figure(2)
% h=legend('Volumetric- $N_{cg}=100$', 'Modified Point-wise- $T_{offset}=1~[eV]$','Location','SouthWest');
%             
% axis([0 0.05 -0.2 4.5]) 
% set(h,'Interpreter','latex','FontSize',24)
% xlabel('Position [cm]' , 'FontSize',24,'Interpreter','latex')
% ylabel('$\phi$ $[ \frac{jerks}{cm^2~sh} ]$','FontSize',24,'Interpreter','latex')
% set(gca,'FontName','Times','FontSize',30 ,'YTick',[-0.2 0.2 1 2 3 4])
% 
% set(gcf,'OuterPosition',[-7 33 1936 1056],'PaperPosition',[0.2500  2.5000 8.0000 6.0000],'PaperSize',[8.5 11] , 'Position', [1 41 1920  964])
% SavePretty(gcf,'100C_vs_1ev_Physical_Marshak_Wave_Radiation_Adaptive_Comparison_Final')
% % 
% axis([0.042 0.045 -0.1 0.5])
% set(gca,'FontName','Times','FontSize',30 ,'YTick',[-0.1 0 0.1 0.2 0.3 0.5])
% SavePretty(gcf,'100C_vs_1ev_Physical_Marshak_Wave_Radiation_Adaptive_Comparison_Final_Zoom')

% %%%%%%%%%%%%%%%%%%%%%%%%
 % linar vs. cubic
%
close all
clear all

cell_base = { sprintf('Physical_Marshak/MW_Physical_S8_P3_100C_Volumetric_1P_100C') ...
              sprintf('Physical_Marshak/MW_Physical_S8_P3_100C_Pointwise_1P_1eV') ...
              sprintf('Physical_Marshak/MW_Physical_S8_P1_100C_Dumb_1p_0eV') ...
                };

data_base = { sprintf('Physical_Marshak/MW_Physical_S8_P3_100C_Volumetric_1P_100C') , sprintf('Final');...
              sprintf('Physical_Marshak/MW_Physical_S8_P3_100C_Pointwise_1P_1eV') , sprintf('Final');...
              sprintf('Physical_Marshak/MW_Physical_S8_P1_100C_Dumb_1p_0eV'), sprintf('Final');...  
                };

Dark_Arts_Plotter(1,2 ,cell_base,data_base,@lglnodes)

figure(1)
h=legend('P3 Volumetric- $N_{cg}=100$', 'P3 Modified Point-wise- $T_{offset}=1~[eV]$','P1 Modified Point-wise- $T_{offset}=0~[eV]$','Location','SouthWest');
axis([0 0.05 -0.25 1]) 
set(h,'Interpreter','latex','FontSize',24)
xlabel('Position [cm]' , 'FontSize',24,'Interpreter','latex')
ylabel('Temperature [keV]','FontSize',24,'Interpreter','latex')
set(gca,'FontName','Times','FontSize',30,'YTick',[-0.2 0 0.2 0.4 0.6 0.8 1.0])

set(gcf,'OuterPosition',[-7 33 1936 1056],'PaperPosition',[0.2500  2.5000 8.0000 6.0000],'PaperSize',[8.5 11] , 'Position', [1 41 1920  964])
SavePretty(gcf,'P3_P1_100C_vs_Physical_Marshak_Wave_Temperature_Comparison_Final_Zoon')

axis([0.042 0.045 -0.2 0.6])
SavePretty(gcf,'P3_P1_100C_vs_Physical_Marshak_Wave_Temperature_Comparison_Final_Zoom')

figure(2)
h=legend('P3 Volumetric- $N_{cg}=100$', 'P3 Modified Point-wise- $T_{offset}=1~[eV]$','P1 Modified Point-wise- $T_{offset}=0~[eV]$','Location','SouthWest');
            
axis([0 0.05 -0.2 4.5]) 
set(h,'Interpreter','latex','FontSize',24)
xlabel('Position [cm]' , 'FontSize',24,'Interpreter','latex')
ylabel('$\phi$ $[ \frac{jerks}{cm^2~sh} ]$','FontSize',24,'Interpreter','latex')
set(gca,'FontName','Times','FontSize',30 ,'YTick',[-0.2 0.2 1 2 3 4])

set(gcf,'OuterPosition',[-7 33 1936 1056],'PaperPosition',[0.2500  2.5000 8.0000 6.0000],'PaperSize',[8.5 11] , 'Position', [1 41 1920  964])
SavePretty(gcf,'P3_P1_100C_vs_Physical_Marshak_Wave_Radiation_Comparison_Final')
% 
axis([0.042 0.045 -0.1 0.5])
set(gca,'FontName','Times','FontSize',30 ,'YTick',[-0.1 0 0.1 0.2 0.3 0.5])
SavePretty(gcf,'P3_P1_100C_vs_Physical_Marshak_Wave_Radiation_Comparison_Final_Zoom')

