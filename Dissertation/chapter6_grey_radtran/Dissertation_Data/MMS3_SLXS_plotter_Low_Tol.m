% % % script to generate steady state spatial convergence plots

save_all = true;

close all;

prob_str = 'MMS3_SLXS_Low_Tol/MMS3';
i=0;
fid = zeros(8,1);
for m=1:1:2
    switch m
        case 1            
            meth_str = 'SLXS_Lobatto';
        case 2
            meth_str = 'SLXS_Gauss';
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
        
        file_str = sprintf('%s_%s_Low_Tol_final_space_%s_error.txt',prob_str,meth_str,type_str);
        i = i+1;
        fid(i,1) = fopen(file_str,'r');
    end
end



% 
x_left = 0;
x_right = 10;
L = x_right - x_left;


% load data for SLXS lobatto
n_data_lobatto = 16; 
offset = 0;
mm1 = GenerateRoughPlots(L,offset,n_data_lobatto,fid);

% load data for SLXS Gauss
n_data_gauss = 16; 
offset = 4;
mm2 = GenerateRoughPlots(L,offset,n_data_gauss,fid);


for i=1:1:8
   fclose(fid(i,1)); 
end

% now make each plot special
figure(1)
% Lobatto phi_A
c1 = 4E-4;
p1 = 2;

c2 = 1E-7;
p2 = 3;

c3 = 1E-11;
p3 = 5;

c4 = 3E-14;
p4 = 6;

hold on
loglog([mm1(1,1) mm1(2,1)] , [c1 c1*mm1(3,1)^p1],'k-','LineWidth',2 );
hold on
loglog([mm1(1,1) mm1(2,1)] , [c2 c2*mm1(3,1)^p2],'b-','LineWidth',2 );
hold on
loglog([mm1(1,1) mm1(2,1)] , [c3 c3*mm1(3,1)^p3],'r-','LineWidth',2 );

hold on
loglog([mm1(1,1) mm1(2,1)] , [c4 c4*mm1(3,1)^p4],'g-','LineWidth',2 );

h=legend('P1','P2','P3','P4','$O(\Delta x^2)$','$O(\Delta x^3)$','$O(\Delta x^5)$','$O(\Delta x^6)$','Location','NorthWest');
set(h,'Interpreter','latex','Fontsize',14);
axis([mm1(1,2)/4 2*mm1(2,2) 1E-10 1e1])

figure(2)
% Lobatto phi_L2
c1 = 3E-3;
p1 = 2;

c2 = 2E-6;
p2 = 3;

c3 = 3E-11;
p3 = 4;

c4 = 1E-14;
p4 = 5;
% 
% hold on
% loglog([mm1(1,1) mm1(2,1)] , [c1 c1*mm1(3,1)^p1],'k-','LineWidth',2 );
% hold on
% loglog([mm1(1,1) mm1(2,1)] , [c2 c2*mm1(3,1)^p2],'b-','LineWidth',2 );
hold on
loglog([1E-2 10] , [c3 c3*(1E3)^p3],'r-','LineWidth',2 );
hold on
loglog([1E-2 10] , [c4 c4*(1E3)^p4],'g-','LineWidth',2 );

h=legend('P3','P4','$O(\Delta x^4)$','$O(\Delta x^5)$','Location','SouthEast');

set(h,'Interpreter','latex','Fontsize',14);
axis([mm1(1,2)/2 4*mm1(2,2) 1E-10 1e2])

figure(3)
% Lobatto T_A
c1 = 1E-5;
p1 = 2;

c2 = 3E-10;
p2 = 3;

c3 = 1E-12;
p3 = 4;

c4 = 1E-15;
p4 = 5;


hold on
loglog([mm1(1,1) mm1(2,1)] , [c1 c1*mm1(3,1)^p1],'k-','LineWidth',2 );
hold on
loglog([mm1(1,1) mm1(2,1)] , [c2 c2*mm1(3,1)^p2],'b-','LineWidth',2 );
hold on
loglog([mm1(1,1) mm1(2,1)] , [c3 c3*mm1(3,1)^p3],'r-','LineWidth',2 );
hold on
loglog([mm1(1,1) mm1(2,1)] , [c4 c4*mm1(3,1)^p4],'g-','LineWidth',2 );

h=legend('P1','P2','P3','P4','$O(\Delta x^2)$','$O(\Delta x^3)$','$O(\Delta x^4)$','$O(\Delta x^5)$','Location','NorthWest');
set(h,'Interpreter','latex','Fontsize',14);
axis([mm1(1,2)/3 2*mm1(2,2) 1E-11 3])

figure(4)
% Lobatto T
c1 = 2E-2;
p1 = 1;
c2 = 1E-4;
p2 = 2;
c3 = 2E-8;
p3 = 3;
c4 = 1E-11;
p4 = 4;

hold on
loglog([mm1(1,1) mm1(2,1)] , [c1 c1*mm1(3,1)^p1],'k-','LineWidth',2 );
hold on
loglog([mm1(1,1) mm1(2,1)] , [c2 c2*mm1(3,1)^p2],'b-','LineWidth',2 );
hold on
loglog([mm1(1,1) mm1(2,1)] , [c3 c3*mm1(3,1)^p3],'r-','LineWidth',2 );
hold on
loglog([mm1(1,1) mm1(2,1)] , [c4 c4*mm1(3,1)^p4],'g-','LineWidth',2 );

h=legend('P1','P2','P3','P4','$O(\Delta x)$','$O(\Delta x^2)$','$O(\Delta x^3)$','$O(\Delta x^4)$','Location','NorthWest');

set(h,'Interpreter','latex','Fontsize',14);
axis( [mm1(1,4)/5 2*mm1(2,4) 1E-10 8E1])

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(5)
% gauss phi_A
c1 = 4E-7;
p1 = 3;

c2 = 2E-10;
p2 = 4;

c3 = 6E-16;
p3 = 6;

% c4 = 1E-18;
% p4 = 7;

hold on
loglog([mm2(1,1) mm2(2,1)] , [c1 c1*mm2(3,1)^p1],'k-','LineWidth',2 );
hold on
loglog([mm2(1,1) mm2(2,1)] , [c2 c2*mm2(3,1)^p2],'b-','LineWidth',2 );
hold on
loglog([mm2(1,1) mm2(2,1)] , [c3 c3*mm2(3,1)^p3],'r-','LineWidth',2 );

h=legend('P1','P2','P3','P4','$O(\Delta x^3)$','$O(\Delta x^4)$','$O(\Delta x^6)$','Location','NorthWest');
set(h,'Interpreter','latex','Fontsize',14);
axis([mm2(1,1)/5 2*mm2(2,1) 1E-10 1E1])

figure(6)
% gauss phi_L2
hold on
c1 = 4E-4;
p1 = 2;

c2 = 1E-7;
p2 = 3;

c3 = 1E-12;
p3 = 4;

c4 = 4E-17;
p4 = 5;

hold on
loglog([1E-2 10] , [c3 c3*(1E3)^p3],'r-','LineWidth',2 );
hold on
loglog([1E-2 10] , [c4 c4*(1E3)^p4],'g-','LineWidth',2 );

h=legend('P3','P4','$O(\Delta x^4)$','$O(\Delta x^5)$','Location','SouthEast');
set(h,'Interpreter','latex','Fontsize',14);
axis( [mm2(1,2)/2 5*mm2(2,2) 1E-10 1E1])

figure(7)
% gauss temp_A
c1 = 4E-10;
p1 = 3;

c2 = 1E-11;
p2 = 4;

c3 = 5E-18;
p3 = 6;

hold on
loglog([mm2(1,3) mm2(2,3)] , [c1 c1*mm2(3,3)^p1],'k-','LineWidth',2 );
hold on
loglog([mm2(1,3) mm2(2,3)] , [c2 c2*mm2(3,3)^p2],'b-','LineWidth',2 );
hold on
loglog([mm2(1,3) mm2(2,3)] , [c3 c3*mm2(3,3)^p3],'r-','LineWidth',2 );

h=legend('P1','P2','P3','P4','$O(\Delta x^3)$','$O(\Delta x^4)$','$O(\Delta x^6)$','Location','NorthWest');
set(h,'Interpreter','latex','Fontsize',14);
axis( [mm2(1,3)/2 2*mm2(2,3) 1E-11 5E-3])

figure(8)
% gauss temp_L2
hold on
c1 = 3E-5;
p1 = 2;

c2 = 1E-7;
p2 = 3;

c3 = 3E-11;
p3 = 4;

c4 = 1E-14;
p4 = 5;

hold on
loglog([mm2(1,4) mm2(2,4)] , [c1 c1*mm2(3,4)^p1],'k-','LineWidth',2 );
hold on
loglog([mm2(1,4) mm2(2,4)] , [c2 c2*mm2(3,4)^p2],'b-','LineWidth',2 );
hold on
loglog([mm2(1,4) mm2(2,4)] , [c3 c3*mm2(3,3)^p3],'r-','LineWidth',2 );
hold on
loglog([mm2(1,4) mm2(2,4)] , [c4 c4*mm2(3,3)^p4],'g-','LineWidth',2 );

% c3 = 3E-9;
% hold on
% loglog([mm2(1,4) mm2(2,4)] , [c3 c3*mm2(3,4)^p1],'k-','LineWidth',2 );

h=legend('P1','P2','P3','P4','$O(\Delta x^2)$','$O(\Delta x^3)$','$O(\Delta x^4)$','$O(\Delta x^5)$','Location','NorthWest');
set(h,'Interpreter','latex','Fontsize',14);
axis( [mm2(1,4)/6 2*mm2(2,4) 1E-12 3E0])



% % save all of these lovely plots
if(save_all)
    prob_str = sprintf('MMS3_Low_Tol_First');

    for m=1:1:2
        if(m==1)
            continue
        end
        switch m
            case 1
                meth = sprintf('SLXS_Lobatto');
            case 2
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
            
%             if(i~=2)
%                 continue
%             end

            name_base = sprintf('%s_%s_%s',prob_str,meth,err_type);
            
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