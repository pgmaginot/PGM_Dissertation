% plot each methd and P as the mesh get refined
% use the finest time step size
close all

p=1;
[q,w] = lglnodes(p+1);
[dfem_mat , d_dfem_mat] = feshpln(linspace(-1,1,2) , q , p);

cell_base = {   sprintf('Modified_Marshak/P1_MW_S8_Cv001_SigA_1') ...
                sprintf('Modified_Marshak/P1_MW_S8_Cv001_SigA_1') ...
                sprintf('Modified_Marshak/P1_MW_S8_Cv001_SigA_1') ...
                sprintf('Modified_Marshak/P1_MW_S8_Cv001_SigA_1') ...
                sprintf('Modified_Marshak/P1_MW_S8_Cv001_SigA_1') ...
                sprintf('Modified_Marshak/P1_MW_S8_Cv001_SigA_1')...
                sprintf('Modified_Marshak/P1_MW_S8_Cv001_SigA_1') ...
                sprintf('Modified_Marshak/P1_MW_S8_Cv001_SigA_1') ...                
                sprintf('Modified_Marshak/P1_MW_S8_Cv001_SigA_1') ...
                sprintf('Modified_Marshak/P1_MW_S8_Cv001_SigA_1') ...    
                sprintf('Modified_Marshak/P1_MW_S8_Cv001_SigA_1') ...
                };

data_base = {   sprintf('Modified_Marshak/P1_MW_S8_Cv001_SigA_1') , sprintf('step_528') ; ...
                sprintf('Modified_Marshak/P1_MW_S8_Cv001_SigA_1') , sprintf('step_1278') ; ...
                sprintf('Modified_Marshak/P1_MW_S8_Cv001_SigA_1') , sprintf('step_2528') ;  ...
                sprintf('Modified_Marshak/P1_MW_S8_Cv001_SigA_1') , sprintf('step_5256') ; ...
                sprintf('Modified_Marshak/P1_MW_S8_Cv001_SigA_1') , sprintf('step_7763') ; ...
                sprintf('Modified_Marshak/P1_MW_S8_Cv001_SigA_1') , sprintf('step_15265') ; ...
                sprintf('Modified_Marshak/P1_MW_S8_Cv001_SigA_1') , sprintf('step_22765') ; ...
                sprintf('Modified_Marshak/P1_MW_S8_Cv001_SigA_1') , sprintf('step_30265') ; ...
                sprintf('Modified_Marshak/P1_MW_S8_Cv001_SigA_1') , sprintf('step_40286') ; ...
                sprintf('Modified_Marshak/P1_MW_S8_Cv001_SigA_1') , sprintf('step_45300') ; ...
                sprintf('Modified_Marshak/P1_MW_S8_Cv001_SigA_1') , sprintf('Final') ; ...
                };

Dark_Arts_Plotter(1,2 ,cell_base,data_base,dfem_mat)

        
        
temperature_file = sprintf('P1_S8_Time_Ray_Effects_Temperature_Cv001_SigA1');
rad_file = sprintf('P1_S8_Time_Ray_Effects_Radiation_Cv001_SigA1');
        
% Temperature
figure(1)
h = legend('t=0.1','t=0.25','t=0.5','t=1','t=1.5','t=3','t=4.5','t=6','t=8','t=9','t=10','Location','SouthEast' );
set(h,'Interpreter','latex','FontSize',14);
set(gca,'XTick',[0 0.2 0.4 0.6 0.8 1])
set(gca, 'FontName','Times','FontSize',18)
axis([0 1.6 -0.05 1.5]) 
b = get(gcf,'OuterPosition');
    %         b(1) = b(2) - (b(2) - b(1))*1.2;
    %         b(3) = b(2) - (b(2) - b(1))*1.2;
    %         b(2) = b(2) * .8;
    %         b(3) = b(3)*1.2;
            b(4) = b(4)*1.2;
            set(gcf,'OuterPosition',b);
SavePretty(gcf,temperature_file);



% Radiation
figure(2)
h = legend('t=0.1','t=0.25','t=0.5','t=1','t=1.5','t=3','t=4.5','t=6','t=8','t=9','t=10','Location','SouthEast' );
set(gca,'XTick',[0 0.2 0.4 0.6 0.8 1])
set(h,'Interpreter','latex','FontSize',14);
set(gca, 'FontName','Times','FontSize',18)

axis([0 1.6 -0.05 3])

b = get(gcf,'OuterPosition');
    %         b(1) = b(2) - (b(2) - b(1))*1.2;
    %         b(3) = b(2) - (b(2) - b(1))*1.2;
    %         b(2) = b(2) * .8;
    %         b(3) = b(3)*1.2;
            b(4) = b(4)*1.2;
            set(gcf,'OuterPosition',b);
            
SavePretty(gcf,rad_file);

        