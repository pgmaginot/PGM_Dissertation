% plot each methd and P as the mesh get refined
% use the finest time step size
close all

p=1;
[q,w] = lglnodes(p+1);
[dfem_mat , d_dfem_mat] = feshpln(linspace(-1,1,2) , q , p);

cell_base = {   sprintf('Marshak_Results/P1_MW_S8_Cv1_T01_SigA_1000') ...
                sprintf('Marshak_Results/P1_MW_S8_Cv1_T05_SigA_1000') ...
                sprintf('Marshak_Results/P1_MW_S8_Cv1_T1_SigA_1000') ...
                sprintf('Marshak_Results/P1_MW_S8_Cv1_T2_SigA_1000') ...
                };

data_base = {   sprintf('Marshak_Results/P1_MW_S8_Cv1_T01_SigA_1000') ...
                sprintf('Marshak_Results/P1_MW_S8_Cv1_T05_SigA_1000') ...
                sprintf('Marshak_Results/P1_MW_S8_Cv1_T1_SigA_1000') ...
                sprintf('Marshak_Results/P1_MW_S8_Cv1_T2_SigA_1000') ...
                };

Dark_Arts_Plotter(1,2 ,cell_base,data_base,dfem_mat)

        
        
temperature_file = sprintf('P1_S8_Time_Ray_Effects_Temperature_Cv1_SigA1000');
rad_file = sprintf('P1_S8_Time_Ray_Effects_Radiation_Cv1_SigA1000');
        
% Temperature
figure(1)
h = legend('t=0.1','t=0.5','t=1','t=2' );
set(h,'Interpreter','latex','FontSize',14);
set(gca, 'FontName','Times','FontSize',18)
axis([0 0.1 -0.05 1.5]) 
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
h = legend('t=0.1','t=0.5','t=1','t=2' );
set(h,'Interpreter','latex','FontSize',14);
set(gca, 'FontName','Times','FontSize',18)

axis([0 0.1 -0.05 4])

b = get(gcf,'OuterPosition');
    %         b(1) = b(2) - (b(2) - b(1))*1.2;
    %         b(3) = b(2) - (b(2) - b(1))*1.2;
    %         b(2) = b(2) * .8;
    %         b(3) = b(3)*1.2;
            b(4) = b(4)*1.2;
            set(gcf,'OuterPosition',b);
            
SavePretty(gcf,rad_file);

        