% plot each methd and P as the mesh get refined
% use the finest time step size
close all

p=1;
[q,w] = lglnodes(p+1);
[dfem_mat , d_dfem_mat] = feshpln(linspace(-1,1,2) , q , p);

% cell_base = {   sprintf('Marshak_Results/P1_MW_S8_Cv1_T01_SigA_1000') ...
%                 sprintf('Modified_Marshak/P1_MW_S8_Cv1_SigA_1000_Long') ...                
%                 sprintf('Marshak_Results/P1_MW_S8_Cv1_T1_SigA_1000') ...
%                 sprintf('Modified_Marshak/P1_MW_S8_Cv1_SigA_1000_Long') ...
% ...%                 sprintf('Modified_Marshak/P1_MW_S8_Cv1_SigA_1000_Long') ...
%                 sprintf('Modified_Marshak/P1_MW_S8_Cv1_SigA_1000_Long') ...
% ...                 sprintf('Modified_Marshak/P1_MW_S8_Cv1_SigA_1000_Long') ...
%                 sprintf('Modified_Marshak/P1_MW_S8_Cv1_SigA_1000_Long')...
% ...%                 sprintf('Modified_Marshak/P1_MW_S8_Cv1_SigA_1000_Long') ...
%                 sprintf('Modified_Marshak/P1_MW_S8_Cv1_SigA_1000_Long') ...                
% ...%                 sprintf('Modified_Marshak/P1_MW_S8_Cv1_SigA_1000_Long') ...
% ...%                 sprintf('Modified_Marshak/P1_MW_S8_Cv1_SigA_1000_Long') ...    
%                 sprintf('Modified_Marshak/P1_MW_S8_Cv1_SigA_1000_Long') ...
%                 };
% 
% data_base = {   sprintf('Marshak_Results/P1_MW_S8_Cv1_T01_SigA_1000') , sprintf('Final') ; ...                
%                 sprintf('Modified_Marshak/P1_MW_S8_Cv1_SigA_1000_Long') , sprintf('step_2512') ; ...
%                  sprintf('Marshak_Results/P1_MW_S8_Cv1_T1_SigA_1000') , sprintf('Final') ; ...
%                 sprintf('Modified_Marshak/P1_MW_S8_Cv1_SigA_1000_Long') , sprintf('step_12529') ; ...
% ...%                 sprintf('Modified_Marshak/P1_MW_S8_Cv1_SigA_1000_Long') , sprintf('step_15050') ;  ...
%                 sprintf('Modified_Marshak/P1_MW_S8_Cv1_SigA_1000_Long') , sprintf('step_20073') ; ...
% ...%                 sprintf('Modified_Marshak/P1_MW_S8_Cv1_SigA_1000_Long') , sprintf('step_25073') ; ...
%                 sprintf('Modified_Marshak/P1_MW_S8_Cv1_SigA_1000_Long') , sprintf('step_30085') ; ...
% ...%                 sprintf('Modified_Marshak/P1_MW_S8_Cv1_SigA_1000_Long') , sprintf('step_35087') ; ...
%                 sprintf('Modified_Marshak/P1_MW_S8_Cv1_SigA_1000_Long') , sprintf('step_40088') ; ...
% ...%                 sprintf('Modified_Marshak/P1_MW_S8_Cv1_SigA_1000_Long') , sprintf('step_45110') ; ...
% ...%                 sprintf('Modified_Marshak/P1_MW_S8_Cv1_SigA_1000_Long') , sprintf('step_47615') ; ...
%                 sprintf('Modified_Marshak/P1_MW_S8_Cv1_SigA_1000_Long') , sprintf('Final') ; ...
%                 };
% 
% Dark_Arts_Plotter(1,2 ,cell_base,data_base,dfem_mat)
% 
%         
%         
% temperature_file = sprintf('More_Times_P1_S8_Time_Ray_Effects_Temperature_Cv1_SigA1000');
% rad_file = sprintf('More_Times_P1_S8_Time_Ray_Effects_Radiation_Cv1_SigA1000');
%         
% % Temperature
% figure(1)
% 
% h = legend('t=0.1','t=0.5','t=1','t=2.5','t=4','t=6','t=8','t=10','Location','NorthEast'  );
% % h = legend('t=0.5','t=2.5','t=3','t=4','t=5','t=6','t=7','t=8','t=9','t=9.5','t=10' );
% set(h,'Interpreter','latex','FontSize',14);
% set(gca, 'FontName','Times','FontSize',18)
% axis([0 0.18 -0.05 1.5]) 
% b = get(gcf,'OuterPosition');
%     %         b(1) = b(2) - (b(2) - b(1))*1.2;
%     %         b(3) = b(2) - (b(2) - b(1))*1.2;
%     %         b(2) = b(2) * .8;
%     %         b(3) = b(3)*1.2;
%             b(4) = b(4)*1.2;
%             set(gcf,'OuterPosition',b);
% SavePretty(gcf,temperature_file);
% 
% 
% 
% % Radiation
% figure(2)
% h = legend('t=0.1','t=0.5','t=1','t=2.5','t=4','t=6','t=8','t=10','Location','NorthEast' );
% set(h,'Interpreter','latex','FontSize',14);
% set(gca, 'FontName','Times','FontSize',18)
% 
% axis([0 0.15 -0.05 4])
% 
% b = get(gcf,'OuterPosition');
%     %         b(1) = b(2) - (b(2) - b(1))*1.2;
%     %         b(3) = b(2) - (b(2) - b(1))*1.2;
%     %         b(2) = b(2) * .8;
%     %         b(3) = b(3)*1.2;
%             b(4) = b(4)*1.2;
%             set(gcf,'OuterPosition',b);
%             
% SavePretty(gcf,rad_file);
% 

%%%%%% t = 0.5
% cell_base = { sprintf('Modified_Marshak/P1_MW_S8_Cv1_SigA_1000_Long') };
% data_base = { sprintf('Modified_Marshak/P1_MW_S8_Cv1_SigA_1000_Long') , sprintf('step_2512') } ; 

cell_base = { sprintf('Marshak_Results/P1_MW_S8_Cv1_T01_SigA_1000') };
data_base = { sprintf('Marshak_Results/P1_MW_S8_Cv1_T01_SigA_1000') } ; 

figure(3)
n_skip = 10;
n_dir = 8;
n_groups = 1;
Dark_Arts_Intensity_Plotter( 3 , cell_base , data_base ,dfem_mat , n_skip , n_dir, n_groups);
set(gca,'YScale','log')
axis([0 0.015 1E-6 10])
h = legend('$\mu=-0.9603$', ...
    '$\mu=-0.7967$', ...
    '$\mu=-0.5255$', ...    
    '$\mu=-0.1834$', ...
    '$\mu=0.1834$', ...
    '$\mu=0.5255$', ...
    '$\mu=0.7967$', ...
    '$\mu=0.9603$','Location','SouthWest');

% set(gca,'XTick',[0 0.1 0.2 0.3 0.4 0.5])
set(gca,'FontName','Times','FontSize',30)
set(h,'Interpreter','latex','FontSize',30)
xlabel('Position','FontSize',30,'Interpreter','latex');
ylabel('Intensity','FontSize',30,'Interpreter','latex');
set(gcf,'OuterPosition',[-7 33 1936 1056],'PaperPosition',[0.2500  2.5000 8.0000 6.0000],'PaperSize',[8.5 11] , 'Position', [1 41 1920  964])
        
SavePretty(gcf,'S8_Intensity_t01_Cv1_SigA1000');