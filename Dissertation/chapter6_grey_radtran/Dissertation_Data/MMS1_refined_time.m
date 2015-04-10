% % % script to generate steady state spatial convergence plots

save_all = true;

prob_str = 'MMS1_extra_time/MMS1';
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
n_data_lobatto = 32; 
offset = 0;
mm2 = GenerateRoughPlots(L,offset,n_data_lobatto,fid);

% load data for SLXS Gauss
n_data_gauss = 32; 
offset = 4;
mm3 = GenerateRoughPlots(L,offset,n_data_gauss,fid);


for i=1:1:8
   fclose(fid(i,1)); 
end


% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(2)
% Lobaato phi_L2
hold on
c1 = 1E-4;
p1 = 2;
c2 = 8E-9;
p2 = 3;
c3 = 5E-13;
p3 = 4;
c4 = 2E-16;
p4 = 5;

hold on
loglog([mm2(1,2) mm2(2,2)] , [c1 c1*mm2(3,2)^p1],'k-','LineWidth',2 );
hold on
loglog([mm2(1,2) mm2(2,2)] , [c2 c2*mm2(3,2)^p2],'b-','LineWidth',2 );
hold on
loglog([mm2(1,2) mm2(2,2)] , [c3 c3*mm2(3,2)^p3],'r-','LineWidth',2 );
hold on
loglog([mm2(1,2) mm2(2,2)] , [c4 c4*mm2(3,2)^p4],'g-','LineWidth',2 );
h=legend('P1','P2','P3','P4','2nd Order','3rd Order','4th Order', '5th Order', 'Location','NorthWest');
set(h,'Interpreter','latex','Fontsize',14);
axis( [mm2(1,2) mm2(2,2) 1E-10 10])

figure(3)
c1 = 1E-4;
p1 = 2;
c2 = 5E-11;
p2 = 4;
hold on
loglog([mm2(1,3) mm2(2,3)] , [c1 c1*mm2(3,3)^p1],'k-','LineWidth',2 );
hold on
loglog([mm2(1,3) mm2(2,3)] , [c2 c2*mm2(3,3)^p2],'b-','LineWidth',2 );

h=legend('P1','P2','P3','P4','2nd Order','4th Order', 'Location','SouthWest');
set(h,'Interpreter','latex','Fontsize',14);
axis( [mm2(1,3) mm2(2,3) 1E-10 3])

figure(4)
% Lobaato temp_L2
hold on
c1 = 2E-1;
p1 = 1;
c2 = 1E-5;
p2 = 2;
c3 = 1E-8;
p3 = 3;
c4 = 8E-13;
p4 = 4;

hold on
loglog([mm2(1,4) mm2(2,4)] , [c1 c1*mm2(3,4)^p1],'k-','LineWidth',2 );
hold on
loglog([mm2(1,4) mm2(2,4)] , [c2 c2*mm2(3,4)^p2],'b-','LineWidth',2 );
hold on
loglog([mm2(1,4) mm2(2,4)] , [c3 c3*mm2(3,4)^p3],'r-','LineWidth',2 );
hold on
loglog([mm2(1,4) mm2(2,4)] , [c4 c4*mm2(3,4)^p4],'g-','LineWidth',2 );
h=legend('P1','P2','P3','P4','1st Order','2nd Order','3rd Order','4th Order','Location','SouthWest');
set(h,'Interpreter','latex','Fontsize',14);
axis( [mm2(1,4) mm2(2,4) 1E-10 1E2])

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(6)
% Gauss phi_L2

c1 = 1e-12;
p1 = 4;
hold on
loglog([mm3(1,2) mm3(2,2)] , [c1 c1*mm3(3,2)^p1] , 'k-', 'LineWidth' , 2);
h=legend('P1','P2','P3','P4','4th Order','Location','NorthWest');
set(h,'Interpreter','latex','Fontsize',14);
axis( [mm3(1,2) mm3(2,2) 1E-10 1E-3])    

figure(8)
% Gauss temp_L2
c1 = 1E-8;
p1 = 3;
c2 = 5E-14;
p2 = 4;

hold on
loglog([mm3(1,4) mm2(2,4)] , [c1 c1*mm3(3,4)^p1],'k-','LineWidth',2 );
hold on
loglog([mm3(1,4) mm2(2,4)] , [c2 c2*mm3(3,4)^p2],'b-','LineWidth',2 );

h=legend('P1','P2','P3','P4','3rd Order','4th Order','Location','NorthWest');
set(h,'Interpreter','latex','Fontsize',14);
axis( [mm3(1,4) mm3(2,4) 1E-10 1E-2])

% % save all of these lovely plots
if(save_all)
    prob_str = sprintf('MMS1_refined_time');

    meth = sprintf('SLXS_Lobatto');
    err_type = sprintf('phi_L2');
    name_base = sprintf('%s_%s_%s',prob_str,meth,err_type);
    SavePretty( figure(2) , name_base);
    
    err_type = sprintf('temp_A');
    name_base = sprintf('%s_%s_%s',prob_str,meth,err_type);
    SavePretty( figure(3) , name_base);
    
    err_type = sprintf('temp_L2');
    name_base = sprintf('%s_%s_%s',prob_str,meth,err_type);
    SavePretty( figure(4) , name_base);
                    
    
    meth = sprintf('SLXS_Gauss');
    err_type = sprintf('phi_L2');
    name_base = sprintf('%s_%s_%s',prob_str,meth,err_type);
    SavePretty( figure(6) , name_base);
    
    err_type = sprintf('temp_L2');
    name_base = sprintf('%s_%s_%s',prob_str,meth,err_type);
    SavePretty( figure(8) , name_base);
end