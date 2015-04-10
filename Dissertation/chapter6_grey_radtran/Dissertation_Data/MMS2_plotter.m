% % % script to generate steady state spatial convergence plots

save_all = true;

prob_str = 'MMS2/MMS2';
i=0;
fid = zeros(12,1);
for m=1:1:3
    switch m
        case 1
            meth_str = 'TL';
        case 2
            meth_str = 'SL_Lobatto';
        case 3
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

% Rough plots for CXS data for cxs
n_data_cxs = 32; 
offset = 0;
mm1 = GenerateRoughPlots(L,offset,n_data_cxs,fid);

% load data for SLXS lobatto
n_data_lobatto = 32; 
offset = 4;
mm2 = GenerateRoughPlots(L,offset,n_data_lobatto,fid);

% load data for SLXS Gauss
n_data_gauss = 32; 
offset = 8;
mm3 = GenerateRoughPlots(L,offset,n_data_gauss,fid);


for i=1:1:12
   fclose(fid(i,1)); 
end


% now make each plot special
figure(1)
% CXS phi_A
c1 = 8E-5;
p1 = 2;
c2 = 1E-8;
p2 = 4;

hold on
loglog([mm2(1,1) mm2(2,1)] , [c1 c1*mm2(3,1)^p1],'k-','LineWidth',2 );
hold on
loglog([mm2(1,1) mm2(2,1)] , [c2 c2*mm2(3,1)^p2],'b-','LineWidth',2 );

h=legend('P1','P2','P3','P4','$O(\Delta x^2)$','$O(\Delta x^4)$','Location','SouthEast');
set(h,'Interpreter','latex','Fontsize',14);
axis([mm1(1,2)/2 2*mm1(2,2) 1E-9 1e2])

figure(2)
% CXS phi_L2
c1 = 1E-4;
p1 = 2;
c2 = 1E-8;
p2 = 4;

hold on
loglog([mm2(1,1) mm2(2,1)] , [c1 c1*mm2(3,1)^p1],'k-','LineWidth',2 );
hold on
loglog([mm2(1,1) mm2(2,1)] , [c2 c2*mm2(3,1)^p2],'b-','LineWidth',2 );
h=legend('P1','P2','P3','P4','$O(\Delta x^2)$','$O(\Delta x^4)$','Location','SouthEast');
set(h,'Interpreter','latex','Fontsize',14);
axis([mm1(1,2) mm1(2,2) 1E-9 1e1])

figure(3)
% CXS temp_A
c1 = 1E-4;
p1 = 2;
c2 = 1.5E-8;
p2 = 4;

hold on
loglog([mm2(1,1) mm2(2,1)] , [c1 c1*mm2(3,1)^p1],'k-','LineWidth',2 );
hold on
loglog([mm2(1,1) mm2(2,1)] , [c2 c2*mm2(3,1)^p2],'b-','LineWidth',2 );
h=legend('P1','P2','P3','P4','$O(\Delta x^2)$','$O(\Delta x^4)$','Location','SouthEast');
set(h,'Interpreter','latex','Fontsize',14);
axis([mm1(1,2)/2 2*mm1(2,2) 1E-9 1e1])

figure(4)
% CXS temp_L2
c1 = 7E-2;
p1 = 1;
c2 = 6E-4;
p2 = 2;

hold on
loglog([mm2(1,1) mm2(2,1)] , [c1 c1*mm2(3,1)^p1],'k-','LineWidth',2 );
hold on
loglog([mm2(1,1) mm2(2,1)] , [c2 c2*mm2(3,1)^p2],'b-','LineWidth',2 );
h=legend('P1','P2','P3','P4','$O(\Delta x)$','$O(\Delta x^2)$','Location','SouthEast');
set(h,'Interpreter','latex','Fontsize',14);
axis( [mm1(1,4)/2 2*mm1(2,4) 1E-4 8E1])

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(5)
% Lobaato phi_A
c1 = 1E-4;
p1 = 2;
c2 = 5E-8;
p2 = 4;
c3 = 1E-11;
p3 = 5;
c4 = 3E-15;
p4 = 6;

hold on
loglog([mm2(1,1) mm2(2,1)] , [c1 c1*mm2(3,1)^p1],'k-','LineWidth',2 );
hold on
loglog([mm2(1,1) mm2(2,1)] , [c2 c2*mm2(3,1)^p2],'b-','LineWidth',2 );
hold on
loglog([mm2(1,1) mm2(2,1)] , [c3 c3*mm2(3,1)^p3],'r-','LineWidth',2 );
% 
hold on
loglog([mm2(1,1) mm2(2,1)] , [c4 c4*mm2(3,1)^p4],'g-','LineWidth',2 );

h=legend('P1','P2','P3','P4','$O(\Delta x^2)$','$O(\Delta x^4)$','$O(\Delta x^5)$','$O(\Delta x^6)$','Location','NorthWest');
set(h,'Interpreter','latex','Fontsize',14);
axis([mm2(1,1)/2 2*mm2(2,1) 1E-9 1E1])

figure(6)
% Lobatto phi_L2
hold on
c1 = 2E-4;
p1 = 2;
c2 = 1E-6;
p2 = 3;
c3 = 1E-9;
p3 = 4;
c4 = 1E-11;
p4 = 5;

hold on
loglog([mm2(1,2) mm2(2,2)] , [c1 c1*mm2(3,2)^p1],'k-','LineWidth',2 );
hold on
loglog([mm2(1,2) mm2(2,2)] , [c2 c2*mm2(3,2)^p2],'b-','LineWidth',2 );
hold on
loglog([mm2(1,2) mm2(2,2)] , [c3 c3*mm2(3,2)^p3],'r-','LineWidth',2 );
hold on
loglog([mm2(1,2) mm2(2,2)] , [c4 c4*mm2(3,2)^p4],'g-','LineWidth',2 );
h=legend('P1','P2','P3','P4','$O(\Delta x^2)$','$O(\Delta x^3)$','$O(\Delta x^4)$','$O(\Delta x^5)$','Location','SouthEast');
set(h,'Interpreter','latex','Fontsize',14);
axis( [mm2(1,2)/2 2*mm2(2,2) 1E-9 1E2])

figure(7)
% Lobaato temp_A
c1 = 3E-3;
p1 = 2;
c2 = 1E-7;
p2 = 4;
c3 = 2E-13;
p3 = 6;
c4 = 1E-18;
p4 = 8;

hold on
loglog([mm2(1,3) mm2(2,3)] , [c1 c1*mm2(3,3)^p1],'k-','LineWidth',2 );
hold on
loglog([mm2(1,3) mm2(2,3)] , [c2 c2*mm2(3,3)^p2],'b-','LineWidth',2 );
hold on
loglog([mm2(1,3) mm2(2,3)] , [c3 c3*mm2(3,3)^p3],'r-','LineWidth',2 );
hold on
loglog([mm2(1,3) mm2(2,3)] , [c4 c4*mm2(3,3)^p4],'g-','LineWidth',2 );
h=legend('P1','P2','P3','P4','$O(\Delta x^2)$','$O(\Delta x^4)$','$O(\Delta x^6)$','$O(\Delta x^8)$','Location','NorthWest');
set(h,'Interpreter','latex','Fontsize',14);
axis( [mm2(1,3)/2 2*mm2(2,3) 1E-10 1E2])

figure(8)
% Lobaato temp_L2
hold on
c1 = 0.8;
p1 = 1;
c2 = 1E-3;
p2 = 2;
c3 = 2E-6;
p3 = 3;
c4 = 8E-9;
p4 = 4;

hold on
loglog([mm2(1,4) mm2(2,4)] , [c1 c1*mm2(3,4)^p1],'k-','LineWidth',2 );
hold on
loglog([mm2(1,4) mm2(2,4)] , [c2 c2*mm2(3,4)^p2],'b-','LineWidth',2 );
hold on
loglog([mm2(1,4) mm2(2,4)] , [c3 c3*mm2(3,4)^p3],'r-','LineWidth',2 );
hold on
loglog([mm2(1,4) mm2(2,4)] , [c4 c4*mm2(3,4)^p4],'g-','LineWidth',2 );
h=legend('P1','P2','P3','P4','$O(\Delta x)$','$O(\Delta x^2)$','$O(\Delta x^3)$','$O(\Delta x^4)$','Location','SouthEast');
set(h,'Interpreter','latex','Fontsize',14);
axis( [mm2(1,4)/2 2*mm2(2,4) 1E-9 1E2])

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(9)
% Gauss phi_A
c1 = 8E-8;
p1 = 3;
c2 = 3E-10;
p2 = 4;
c3 = 1E-15;
p3 = 6;

hold on
loglog([mm3(1,4) mm3(2,4)] , [c1 c1*mm3(3,4)^p1],'k-','LineWidth',2 );
hold on
loglog([mm3(1,4) mm3(2,4)] , [c2 c2*mm3(3,4)^p2],'b-','LineWidth',2 );
hold on
loglog([mm3(1,4) mm3(2,4)] , [c3 c3*mm3(3,4)^p3],'r-','LineWidth',2 );
h=legend('P1','P2','P3','P4','$O(\Delta x^3)$','$O(\Delta x^4)$','$O(\Delta x^6)$','Location','NorthWest');
set(h,'Interpreter','latex','Fontsize',14);
axis( [mm3(1,1)/2 2*mm3(2,1) 1E-9 1])

figure(10)
% Gauss phi_L2
c1 = 1E-7;
p1 = 3;
% c2 = 1E-8;
% p2 = 4;
c3 = 1E-9;
p3 = 4;
c4 = 3E-14;
p4 = 5;

hold on
loglog([mm3(1,4) mm3(2,4)] , [c1 c1*mm3(3,4)^p1],'k-','LineWidth',2 );
% hold on
% loglog([mm3(1,4) mm3(2,4)] , [c2 c2*mm3(3,4)^p2],'b-','LineWidth',2 );
hold on
loglog([mm3(1,4) mm3(2,4)] , [c4 c4*mm3(3,4)^p4],'g-','LineWidth',2 );

hold on
loglog([mm3(1,4) mm3(2,4)] , [c3 c3*mm3(3,4)^p1],'k-','LineWidth',2 );

h=legend('P1','P2','P3','P4','$O(\Delta x^3)$','$O(\Delta x^4)$','Location','NorthWest');
set(h,'Interpreter','latex','Fontsize',14);
axis( [mm3(1,2)/2 2*mm3(2,2) 1E-9 2])    

figure(11)
% Gauss temp_A
c1 = 1E-8;
p1 = 4;
c2 = 1E-13;
p2 = 6;
c3 = 1E-17;
p3 = 7;
c4 = 1E-23;
p4 = 9;

hold on
loglog([mm3(1,3) mm3(2,3)] , [c1 c1*mm3(3,3)^p1],'k-','LineWidth',2 );
hold on
loglog([mm3(1,3) mm3(2,3)] , [c2 c2*mm3(3,3)^p2],'b-','LineWidth',2 );
hold on
loglog([mm3(1,3) mm3(2,3)] , [c3 c3*mm3(3,3)^p3],'r-','LineWidth',2 );
hold on
loglog([mm3(1,3) mm3(2,3)] , [c4 c4*mm3(3,3)^p4],'g-','LineWidth', 2 );
h=legend('P1','P2','P3','P4','$O(\Delta x^4)$','$O(\Delta x^6)$','$O(\Delta x^7)$','$O(\Delta x^{9})$','Location','NorthWest');
set(h,'Interpreter','latex','Fontsize',14);
axis( [mm3(1,3)/2 2*mm3(2,3) 1E-10 3E0])

figure(12)
% Gauss temp_L2
c1 = 2E-6;
p1 = 3;
c2 = 1E-8;
p2 = 4;
c3 = 1E-11;
p3 = 5;
c4 = 1E-14;
p4 = 6;

hold on
loglog([mm3(1,4) mm3(2,4)] , [c1 c1*mm3(3,4)^p1],'k-','LineWidth',2 );
hold on
loglog([mm3(1,4) mm3(2,4)] , [c2 c2*mm3(3,4)^p2],'b-','LineWidth',2 );
hold on
loglog([mm3(1,4) mm3(2,4)] , [c3 c3*mm3(3,4)^p3],'r-','LineWidth',2 );
hold on
loglog([mm3(1,4) mm3(2,4)] , [c4 c4*mm3(3,4)^p4],'g-','LineWidth',2 );
h=legend('P1','P2','P3','P4','$O(\Delta x^3)$','$O(\Delta x^4)$','$O(\Delta x^5)$','$O(\Delta x^6)$','Location','NorthWest');
set(h,'Interpreter','latex','Fontsize',14);
axis( [mm3(1,4)/2 mm3(2,4)*2 1E-9 1E2])

% % save all of these lovely plots
if(save_all)
    prob_str = sprintf('MMS2');

    for m=1:1:3
        switch m
            case 1
                meth = sprintf('TL');
            case 2
                meth = sprintf('SLXS_Lobatto');
            case 3
                meth = sprintf('SLXS_Gauss');
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

            name_base = sprintf('%s_%s_%s',prob_str,meth,err_type);
            SavePretty( figure( (m-1)*4 + i) , name_base);

        end
    end
end