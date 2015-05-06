% % % script to generate steady state spatial convergence plots

save_all = false;

cxs_phi_a_str = sprintf('Constant_Time/MMS_Constant_Time_CXS_final_space_phi_A_error.txt');
cxs_phi_l2_str = sprintf('Constant_Time/MMS_Constant_Time_CXS_final_space_phi_L2_error.txt');
cxs_temp_a_str = sprintf('Constant_Time/MMS_Constant_Time_CXS_final_space_temperature_A_error.txt');
cxs_temp_l2_str = sprintf('Constant_Time/MMS_Constant_Time_CXS_final_space_temperature_L2_error.txt');

lobatto_phi_a_str = sprintf('Constant_Time/MMS_Constant_Time_SLXS_Lobatto_final_space_phi_A_error.txt');
lobatto_phi_l2_str = sprintf('Constant_Time/MMS_Constant_Time_SLXS_Lobatto_final_space_phi_L2_error.txt');
lobatto_temp_a_str = sprintf('Constant_Time/MMS_Constant_Time_SLXS_Lobatto_final_space_temperature_A_error.txt');
lobatto_temp_l2_str = sprintf('Constant_Time/MMS_Constant_Time_SLXS_Lobatto_final_space_temperature_L2_error.txt');

gauss_phi_a_str = sprintf('Constant_Time/MMS_Constant_Time_SLXS_Gauss_final_space_phi_A_error.txt');
gauss_phi_l2_str = sprintf('Constant_Time/MMS_Constant_Time_SLXS_Gauss_final_space_phi_L2_error.txt');
gauss_temp_a_str = sprintf('Constant_Time/MMS_Constant_Time_SLXS_Gauss_final_space_temperature_A_error.txt');
gauss_temp_l2_str = sprintf('Constant_Time/MMS_Constant_Time_SLXS_Gauss_final_space_temperature_L2_error.txt');

fid = zeros(12,1);

fid(1,1) = fopen(cxs_phi_a_str,'r');
fid(2,1) = fopen(cxs_phi_l2_str,'r');
fid(3,1) = fopen(cxs_temp_a_str,'r');
fid(4,1) = fopen(cxs_temp_l2_str,'r');

fid(5,1) = fopen(lobatto_phi_a_str,'r');
fid(6,1) = fopen(lobatto_phi_l2_str,'r');
fid(7,1) = fopen(lobatto_temp_a_str,'r');
fid(8,1) = fopen(lobatto_temp_l2_str,'r');

fid(9,1) = fopen(gauss_phi_a_str,'r');
fid(10,1) = fopen(gauss_phi_l2_str,'r');
fid(11,1) = fopen(gauss_temp_a_str,'r');
fid(12,1) = fopen(gauss_temp_l2_str,'r');

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
n_data_lobatto = 28; 
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
hold on
c = 1E1;
p = 2;
loglog([mm1(1,1) mm1(2,1)] , [c c*mm1(3,1)^p],'k-','LineWidth',2 );
h=legend('P1','P2','P3','P4','2nd Order','Location','NorthWest');
set(h,'Interpreter','latex','Fontsize',14);
axis( [mm1(1,1) mm1(2,1) 1E0 1E7])

figure(2)
% CXS phi_L2
hold on
c = 1E1;
p = 2;
loglog([mm1(1,2) mm1(2,2)] , [c c*mm1(3,2)^p],'k-','LineWidth',2 );
h=legend('P1','P2','P3','P4','2nd Order','Location','NorthWest');
set(h,'Interpreter','latex','Fontsize',14);
axis( [mm1(1,2) mm1(2,2) 1 1e7])

figure(3)
% CXS temp_A
hold on
c = 3E-3;
p = 2;
loglog([mm1(1,3) mm1(2,3)] , [c c*mm1(3,3)^p],'k-','LineWidth',2 );
h=legend('P1','P2','P3','P4','2nd Order','Location','NorthWest');
set(h,'Interpreter','latex','Fontsize',14);
axis( [mm1(1,3) mm1(2,3) 1E-3 1E3])

figure(4)
% CXS temp_L2
hold on
c = 0.3;
p = 1;
loglog([mm1(1,4) mm1(2,4)] , [c c*mm1(3,4)^p],'k-','LineWidth',2 );
h=legend('P1','P2','P3','P4','1st Order','Location','NorthWest');
set(h,'Interpreter','latex','Fontsize',14);
axis( [mm1(1,4) mm1(2,4) 0.3 8E2])

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(5)
% Lobaato phi_A
c1 = 1E1;
p1 = 2;
c2 = 5E-4;
p2 = 4;
c3 = 1E-7;
p3 = 6;

hold on
loglog([mm2(1,1) mm2(2,1)] , [c1 c1*mm2(3,1)^p1],'k-','LineWidth',2 );
hold on
loglog([mm2(1,1) mm2(2,1)] , [c2 c2*mm2(3,1)^p2],'b-','LineWidth',2 );
hold on
loglog([mm2(1,1) mm2(2,1)] , [c3 c3*mm2(3,1)^p3],'r-','LineWidth',2 );

hold on
c4 = 2E-10;
p4 = 8;
loglog([mm2(1,1) mm2(2,1)] , [c4 c4*mm2(3,1)^p3],'g-','LineWidth',2 );
h=legend('P1','P2','P3','P4','2nd Order','4th Order','6th Order','8th Order','Location','SouthEast');
set(h,'Interpreter','latex','Fontsize',14);
axis([mm2(1,1) mm2(2,1) 1E-11 1E6])

figure(6)
% Lobaato phi_L2
hold on
c1 = 3E1;
p1 = 2;
c2 = 1E-1;
p2 = 3;
c3 = 1E-4;
p3 = 4;
c4 = 3E-7;
p4 = 5;

hold on
loglog([mm2(1,2) mm2(2,2)] , [c1 c1*mm2(3,2)^p1],'k-','LineWidth',2 );
hold on
loglog([mm2(1,2) mm2(2,2)] , [c2 c2*mm2(3,2)^p2],'b-','LineWidth',2 );
hold on
loglog([mm2(1,2) mm2(2,2)] , [c3 c3*mm2(3,2)^p3],'r-','LineWidth',2 );
hold on
loglog([mm2(1,2) mm2(2,2)] , [c4 c4*mm2(3,2)^p4],'g-','LineWidth',2 );
h=legend('P1','P2','P3','P4','2nd Order','3rd Order','4th Order','5th Order','Location','SouthEast');
set(h,'Interpreter','latex','Fontsize',14);
axis( [mm2(1,2) mm2(2,2) 1E-6 1E6])

figure(7)
% Lobaato temp_A
c1 = 1E-2;
p1 = 2;
c2 = 2E-6;
p2 = 4;
c3 = 1E-10;
p3 = 6;
c4 = 1E-14;
p4 = 8;

hold on
loglog([mm2(1,3) mm2(2,3)] , [c1 c1*mm2(3,3)^p1],'k-','LineWidth',2 );
hold on
loglog([mm2(1,3) mm2(2,3)] , [c2 c2*mm2(3,3)^p2],'b-','LineWidth',2 );
hold on
loglog([mm2(1,3) mm2(2,3)] , [c3 c3*mm2(3,3)^p3],'r-','LineWidth',2 );
hold on
loglog([mm2(1,3) mm2(2,3)] , [c4 c4*mm2(3,3)^p4],'g-','LineWidth',2 );
h=legend('P1','P2','P3','P4','2nd Order','4th Order','6nd Order','8th Order','Location','SouthEast');
set(h,'Interpreter','latex','Fontsize',14);
axis( [mm2(1,3) mm2(2,3) 1E-14 1E3])

figure(8)
% Lobatto temp_L2
hold on
c1 = 2E0;
p1 = 1;
c2 = 1E-2;
p2 = 2;
c3 = 3E-5;
p3 = 3;
c4 = 3E-7;
p4 = 4;

hold on
loglog([mm2(1,4) mm2(2,4)] , [c1 c1*mm2(3,4)^p1],'k-','LineWidth',2 );
hold on
loglog([mm2(1,4) mm2(2,4)] , [c2 c2*mm2(3,4)^p2],'b-','LineWidth',2 );
hold on
loglog([mm2(1,4) mm2(2,4)] , [c3 c3*mm2(3,4)^p3],'r-','LineWidth',2 );
hold on
loglog([mm2(1,4) mm2(2,4)] , [c4 c4*mm2(3,4)^p4],'g-','LineWidth',2 );
h=legend('P1','P2','P3','P4','1st Order','2nd Order','3rd Order','4th Order','Location','SouthEast');
set(h,'Interpreter','latex','Fontsize',14);
axis( [mm2(1,4) mm2(2,4) 1E-8 1E3])

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(9)
% Gauss phi_A
c1 = 3E-4;
p1 = 4;
c2 = 5E-9;
p2 = 6;
c3 = 5E-12;
p3 = 7;
c4 = 1E-14;
p4 = 8;

hold on
loglog([mm3(1,4) mm3(2,4)] , [c1 c1*mm3(3,4)^p1],'k-','LineWidth',2 );
hold on
loglog([mm3(1,4) mm3(2,4)] , [c2 c2*mm3(3,4)^p2],'b-','LineWidth',2 );
hold on
loglog([mm3(1,4) mm3(2,4)] , [c3 c3*mm3(3,4)^p3],'r-','LineWidth',2 );
hold on
loglog([mm3(1,4) mm3(2,4)] , [c4 c4*mm3(3,4)^p4],'g-','LineWidth',2 );
h=legend('P1','P2','P3','P4','4th Order','6th Order','7th Order','8th Order','Location','SouthEast');
set(h,'Interpreter','latex','Fontsize',14);
axis( [mm3(1,1) mm3(2,1) 1E-12 1E5])

figure(10)
% Gauss phi_L2
c1 = 3E-2;
p1 = 3;
c2 = 1E-5;
p2 = 4;
c3 = 1E-7;
p3 = 5;
c4 = 1E-10;
p4 = 6;

hold on
loglog([mm3(1,4) mm3(2,4)] , [c1 c1*mm3(3,4)^p1],'k-','LineWidth',2 );
hold on
loglog([mm3(1,4) mm3(2,4)] , [c2 c2*mm3(3,4)^p2],'b-','LineWidth',2 );
hold on
loglog([mm3(1,4) mm3(2,4)] , [c3 c3*mm3(3,4)^p3],'r-','LineWidth',2 );
hold on
loglog([mm3(1,4) mm3(2,4)] , [c4 c4*mm3(3,4)^p4],'g-','LineWidth',2 );
h=legend('P1','P2','P3','P4','3rd Order','4th Order','5th Order','6th Order','Location','SouthEast');
set(h,'Interpreter','latex','Fontsize',14);
axis( [mm3(1,2) mm3(2,2) 1E-10 1E5])    

figure(11)
% Gauss temp_A
c1 = 1E-6;
p1 = 4;
c2 = 1E-10;
p2 = 6;
c3 = 1E-15;
p3 = 8;
c4 = 1E-19;
p4 = 10;

hold on
loglog([mm3(1,3) mm3(2,3)] , [c1 c1*mm3(3,3)^p1],'k-','LineWidth',2 );
hold on
loglog([mm3(1,3) mm3(2,3)] , [c2 c2*mm3(3,3)^p2],'b-','LineWidth',2 );
hold on
loglog([mm3(1,3) mm3(2,3)] , [c3 c3*mm3(3,3)^p3],'r-','LineWidth',2 );
hold on
loglog([mm3(1,3) mm3(2,3)] , [c4 c4*mm3(3,3)^p4],'g-','LineWidth',2 );
h=legend('P1','P2','P3','P4','4th Order','6th Order','8th Order','10th Order','Location','SouthEast');
set(h,'Interpreter','latex','Fontsize',14);
axis( [mm3(1,3) mm3(2,3) 1E-15 1E3])

figure(12)
% Gauss temp_L2
c1 = 2E-2;
p1 = 2;
c2 = 1E-5;
p2 = 3;
c3 = 1E-8;
p3 = 4;
c4 = 1E-11;
p4 = 5;

hold on
loglog([mm3(1,4) mm3(2,4)] , [c1 c1*mm3(3,4)^p1],'k-','LineWidth',2 );
hold on
loglog([mm3(1,4) mm3(2,4)] , [c2 c2*mm3(3,4)^p2],'b-','LineWidth',2 );
hold on
loglog([mm3(1,4) mm3(2,4)] , [c3 c3*mm3(3,4)^p3],'r-','LineWidth',2 );
hold on
loglog([mm3(1,4) mm3(2,4)] , [c4 c4*mm3(3,4)^p4],'g-','LineWidth',2 );
h=legend('P1','P2','P3','P4','2nd Order','3rd Order','4th Order','5th Order', 'Location','SouthEast');
set(h,'Interpreter','latex','Fontsize',14);
axis( [mm3(1,4) mm3(2,4) 1E-12 1E3])

% % save all of these lovely plots
if(save_all)
    prob_str = sprintf('Constant_Time');

    for m=1:1:3
        switch m
            case 1
                meth = sprintf('CXS');
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