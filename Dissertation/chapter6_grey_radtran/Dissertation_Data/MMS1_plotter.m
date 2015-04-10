% % % script to generate steady state spatial convergence plots

save_all = true;

prob_str = 'MMS1_first/MMS1';
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

% Rough plots for tl data for tl
n_data_tl = 32; 
offset = 0;
mm1 = GenerateRoughPlots(L,offset,n_data_tl,fid);

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

close 1
close 3

close 5
close 7

close 9
close 11


figure(2)
% tl phi_L2
c1 = 1E-4;
p1 = 2;
c2 = 1E-9;
p2 = 4;
hold on
loglog([mm1(1,2) mm1(2,2)] , [c1 c1*mm1(3,2)^p1],'k-','LineWidth',2 );
hold on
loglog([mm1(1,2) mm1(2,2)] , [c2 c2*mm1(3,2)^p2],'b-','LineWidth',2 );
h=legend('P1','P2','P3','P4','2nd Order','4th Order','Location','SouthEast');
set(h,'Interpreter','latex','Fontsize',14);

figure(4)
% tl temp_L2
c1 = 1E-2;
p1 = 1;
c2 = 5E-5;
p2 = 2;
hold on
loglog([mm1(1,2) mm1(2,2)] , [c1 c1*mm1(3,2)^p1],'k-','LineWidth',2 );
hold on
loglog([mm1(1,2) mm1(2,2)] , [c2 c2*mm1(3,2)^p2],'b-','LineWidth',2 );

h=legend('P1','P2','P3','P4','1st Order','2nd Order','Location','SouthEast');
set(h,'Interpreter','latex','Fontsize',14);
axis( [mm1(1,4) mm1(2,4) 5E-6 10])

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(6)
% Lobaato phi_L2
hold on
c1 = 3E-2;
p1 = 2;
c2 = 3E-5;
p2 = 3;
c3 = 2E-7;
p3 = 4;
c4 = 5E-10;
p4 = 5;

% hold on
% loglog([mm2(1,2) mm2(2,2)] , [c1 c1*mm2(3,2)^p1],'k-','LineWidth',2 );
% hold on
% loglog([mm2(1,2) mm2(2,2)] , [c2 c2*mm2(3,2)^p2],'b-','LineWidth',2 );
% hold on
% loglog([mm2(1,2) mm2(2,2)] , [c3 c3*mm2(3,2)^p3],'r-','LineWidth',2 );
% hold on
% loglog([mm2(1,2) mm2(2,2)] , [c4 c4*mm2(3,2)^p4],'g-','LineWidth',2 );
h=legend('P1','P2','P3','P4','Location','NorthWest');
set(h,'Interpreter','latex','Fontsize',14);
% axis( [mm2(1,2) mm2(2,2) 1E-8 1E2])


figure(8)
% Lobaato temp_L2
hold on
c1 = 1E-1;
p1 = 1;
c2 = 1E-5;
p2 = 2;
c3 = 1E-8;
p3 = 3;


hold on
loglog([mm2(1,4) mm2(2,4)] , [c1 c1*mm2(3,4)^p1],'k-','LineWidth',2 );
hold on
loglog([mm2(1,4) mm2(2,4)] , [c2 c2*mm2(3,4)^p2],'b-','LineWidth',2 );
hold on
loglog([mm2(1,4) mm2(2,4)] , [c3 c3*mm2(3,4)^p3],'r-','LineWidth',2 );
h=legend('P1','P2','P3','P4','1st Order','2nd Order','3rd Order','Location','SouthWest');
set(h,'Interpreter','latex','Fontsize',14);
axis( [mm2(1,4) mm2(2,4) 1E-8 1E2])

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(10)
% Gauss phi_L2
h=legend('P1','P2','P3','P4','Location','NorthWest');
set(h,'Interpreter','latex','Fontsize',14);
% axis( [mm3(1,2) mm3(2,2) 1E-8 1E3])    

figure(12)
% Gauss temp_L2
c1 = 1E-4;
p1 = 3;
c2 = 1E-6;
p2 = 4;
c3 = 2E-9;
p3 = 5;
c4 = 1E-12;
p4 = 6;

h=legend('P1','P2','P3','P4','Location','NorthWest');
set(h,'Interpreter','latex','Fontsize',14);
% axis( [mm3(1,4) mm3(2,4) 1E-7 1E3])

% % save all of these lovely plots
if(save_all)
    prob_str = sprintf('MMS1_Initial');

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
            if(i==1 || i==3)
                continue
            end
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