% % % script to generate steady state spatial convergence plots

save_all = true;

prob_str = 'MMS3_Constant_XS/MMS3_Constant_XS';
i=0;
fid = zeros(8,1);
for m=1:1:2
    switch m
        case 1
            meth_str = 'SL_Lobatto';
        case 2
            meth_str = 'SL_Gauss';
    end
            
    for type=1:1:4
        switch type
            case 1
                type_str = 'phi_A';
            case 2
                type_str = 'phi_L2';
            case 3
                type_str = 'temperature_A';
            case 4
                type_str = 'temperature_L2';
        end
        
        file_str = sprintf('%s_%s_final_space_%s_error.txt',prob_str,meth_str,type_str);
        i = i+1;
        fid(i,1) = fopen(file_str,'r');
    end
end

% 
x_left = 0;
x_right = 10;
L = x_right - x_left;

close all;

% load data for SLXS lobatto
n_data_lobatto = 31; 
offset = 0;
mm1 = GenerateRoughPlots(L,offset,n_data_lobatto,fid);

% load data for SLXS Gauss
n_data_gauss = 32; 
offset = 4;
mm2 = GenerateRoughPlots(L,offset,n_data_gauss,fid);


for i=1:1:8
   fclose(fid(i,1)); 
end


% now make each plot special
figure(1)
% CXS phi_A
c1 = 2E-4;
p1 = 2;
% 
hold on
loglog([mm2(1,1) mm2(2,1)] , [c1 c1*mm2(3,1)^p1],'k-','LineWidth',2 );

h=legend('P1','P2','P3','P4','$O(\Delta x^2)$','Location','SouthEast');
set(h,'Interpreter','latex','Fontsize',14);
% axis([mm1(1,2)/2 2*mm1(2,2) 1E-9 1e2])

figure(2)
% CXS phi_L2
c1 = 3E-4;
p1 = 2;

hold on
loglog([mm2(1,1) mm2(2,1)] , [c1 c1*mm2(3,1)^p1],'k-','LineWidth',2 );

h=legend('P1','P2','P3','P4','$O(\Delta x^2)$','Location','SouthEast');
set(h,'Interpreter','latex','Fontsize',14);
% axis([mm1(1,2) mm1(2,2) 1E-9 1e1])

figure(3)
% CXS temp_A
c1 = 1E-5;
p1 = 2;

hold on
loglog([mm2(1,1) mm2(2,1)] , [c1 c1*mm2(3,1)^p1],'k-','LineWidth',2 );
h=legend('P1','P2','P3','P4','$O(\Delta x^2)$','Location','SouthEast');
set(h,'Interpreter','latex','Fontsize',14);
% axis([mm1(1,2)/2 2*mm1(2,2) 1E-9 1e1])

figure(4)
% CXS temp_L2
c1 = 2E-2;
p1 = 1;
hold on
loglog([mm2(1,1) mm2(2,1)] , [c1 c1*mm2(3,1)^p1],'k-','LineWidth',2 );
h=legend('P1','P2','P3','P4','$O(\Delta x)$','Location','SouthEast');
set(h,'Interpreter','latex','Fontsize',14);
% axis( [mm1(1,4)/2 2*mm1(2,4) 1E-4 8E1])

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(5)
% Lobaato phi_A
c1 = 2E-4;
p1 = 2;

hold on
loglog([mm2(1,1) mm2(2,1)] , [c1 c1*mm2(3,1)^p1],'k-','LineWidth',2 );

h=legend('P1','P2','P3','P4','$O(\Delta x^2)$','Location','NorthWest');
set(h,'Interpreter','latex','Fontsize',14);
% axis([mm2(1,1)/2 2*mm2(2,1) 1E-9 1E1])

figure(6)
% Lobatto phi_L2
c1 = 2E-4;
p1 = 2;

hold on
loglog([mm2(1,2) mm2(2,2)] , [c1 c1*mm2(3,2)^p1],'k-','LineWidth',2 );
h=legend('P1','P2','P3','P4','$O(\Delta x^2)$','Location','SouthEast');
set(h,'Interpreter','latex','Fontsize',14);
% axis( [mm2(1,2)/2 2*mm2(2,2) 1E-9 1E2])

figure(7)
% Lobaato temp_A
c1 = 2E-4;
p1 = 2;

hold on
loglog([mm2(1,3) mm2(2,3)] , [c1 c1*mm2(3,3)^p1],'k-','LineWidth',2 );
h=legend('P1','P2','P3','P4','$O(\Delta x^2)$','Location','NorthWest');
set(h,'Interpreter','latex','Fontsize',14);
% axis( [mm2(1,3)/2 2*mm2(2,3) 1E-10 1E2])

figure(8)
% Lobatto temp_L2
c1 = 2E-2;
p1 = 1;

hold on
loglog([mm2(1,4) mm2(2,4)] , [c1 c1*mm2(3,4)^p1],'k-','LineWidth',2 );

h=legend('P1','P2','P3','P4','$O(\Delta x)$','Location','SouthEast');
set(h,'Interpreter','latex','Fontsize',14);
% axis( [mm2(1,4)/2 2*mm2(2,4) 1E-9 1E2])

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % save all of these lovely plots
if(save_all)
    prob_str = sprintf('MMS3_Constant_XS');

    for m=1:1:2
        switch m
            case 1
                meth = sprintf('SL_Lobatto');
            case 2
                meth = sprintf('SL_Gauss');
        end

        for i=1:1:4
            switch i
                case 1
                    err_type = sprintf('phi_A');
                case 2
                    err_type = sprintf('phi_L2');
                case 3
                    err_type = sprintf('temp_A');
                case 4
                    err_type = sprintf('temp_L2');
            end

            n = (m-1)*4 + i;
            figure(n)
            b = get(gcf,'OuterPosition');
    %         b(1) = b(2) - (b(2) - b(1))*1.2;
    %         b(3) = b(2) - (b(2) - b(1))*1.2;
    %         b(2) = b(2) * .8;
    %         b(3) = b(3)*1.2;
            b(4) = b(4)*1.2;
            set(gcf,'OuterPosition',b);
        
            SavePretty( figure( n ) , name_base);
        end
    end
end