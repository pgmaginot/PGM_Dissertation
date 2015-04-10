% % % script to generate spatial constant temporally varying convergence plots

save_all = false;

phi_l2_str = sprintf('Constant_Space/MMS_Constant_Space_Exact_final_space_phi_L2_error.txt');
temp_l2_str = sprintf('Constant_Space/MMS_Constant_Space_Exact_final_space_temperature_L2_error.txt');

fid = zeros(2,1);

fid(1,1) = fopen(phi_l2_str,'r');
fid(2,1) = fopen(temp_l2_str,'r')

% 
t_start = 0;
t_end = 1;
L = t_end - t_start;

close all;

n_data = 27*3;

phi_data = zeros(n_data/3,2,3);
temp_data = phi_data;
cnt_vec = zeros(3,1);
for i=1:1:54
   err_data_phi = ReadErrorFileLine( fid(1,1) ); 
   
   if( strcmp(err_data_phi.time_meth,'EULER'))
       cnt_vec(1,1) = cnt_vec(1,1) + 1;
       
       phi_data(cnt_vec(1,1),1,1) = L/err_data_phi.n_steps;
       phi_data(cnt_vec(1,1),2,1) = err_data_phi.err;
       
   elseif( strcmp(err_data_phi.time_meth,'2_2'))
       cnt_vec(2,1) = cnt_vec(2,1) + 1;
       
       phi_data(cnt_vec(2,1),1,2) = L/err_data_phi.n_steps;
       phi_data(cnt_vec(2,1),2,2) = err_data_phi.err;
   elseif(  strcmp(err_data_phi.time_meth,'3_3') )
       cnt_vec(3,1) = cnt_vec(3,1) + 1;
       
       phi_data(cnt_vec(3,1),1,3) = L/err_data_phi.n_steps;
       phi_data(cnt_vec(3,1),2,3) = err_data_phi.err;
   else
      error('Weird time string read'); 
   end
end

cnt_vec = zeros(3,1);
for i=1:1:54
   err_data_temp = ReadErrorFileLine( fid(2,1) ); 
   
   if( strcmp(err_data_temp.time_meth,'EULER'))
       cnt_vec(1,1) = cnt_vec(1,1) + 1;
       
       temp_data(cnt_vec(1,1),1,1) = L/err_data_temp.n_steps;
       temp_data(cnt_vec(1,1),2,1) = err_data_temp.err;
       
   elseif( strcmp(err_data_temp.time_meth,'2_2'))
       cnt_vec(2,1) = cnt_vec(2,1) + 1;
       
       temp_data(cnt_vec(2,1),1,2) = L/err_data_temp.n_steps;
       temp_data(cnt_vec(2,1),2,2) = err_data_temp.err;
   elseif(  strcmp(err_data_temp.time_meth,'3_3') )
       cnt_vec(3,1) = cnt_vec(3,1) + 1;
       
       temp_data(cnt_vec(3,1),1,3) = L/err_data_temp.n_steps;
       temp_data(cnt_vec(3,1),2,3) = err_data_temp.err;
   else
      error('Weird time string read'); 
   end
end

temp_data(:,:,1) = sortrows(temp_data(:,:,1));
temp_data(:,:,2) = sortrows(temp_data(:,:,2));
temp_data(:,:,3) = sortrows(temp_data(:,:,3));

phi_data(:,:,1) = sortrows(phi_data(:,:,1));
phi_data(:,:,2) = sortrows(phi_data(:,:,2));
phi_data(:,:,3) = sortrows(phi_data(:,:,3));

for i=1:1:2
   fclose(fid(i,1)); 
end

mm1 = zeros(3,1);

% % mm1(1,1) = min( nonzeros( temp_data(:,1,1) ) );
% mm1(1,1) = min( mm1(1,1) , min( nonzeros( temp_data(:,1,2) )) );
% mm1(1,1) = min( mm1(1,1) , min( nonzeros( temp_data(:,1,3) )) );
% 
% % mm1(2,1) = max( nonzeros(temp_data(:,1,1) ));
% mm1(2,1) = max( mm1(2,1) , max(nonzeros(temp_data(:,1,2) )));
% mm1(2,1) = max( mm1(2,1) , max(nonzeros(temp_data(:,1,3) )));

mm1(1,1) = 1/250000;
mm1(2,1) = 1;

mm1(3,1) = mm1(2,1) / mm1(1,1);

figure(1)
% loglog(phi_data(:,1,1) , phi_data(:,2,1) , 'r--o' , ...
loglog(        phi_data(:,1,2) , phi_data(:,2,2) , 'b-x' , ...
        phi_data(:,1,3) , phi_data(:,2,3) , 'k-.v' , 'LineWidth',2,'MarkerSize',10);
xlabel('$\Delta t$','Interpreter','latex','FontSize',18);
ylabel('$E_{\phi}$','Interpreter','latex','FontSize',18);
hold on 
c1 = 1E-2;
p1 = 1;
c2 = 1E-6;
p2 = 2;
c3 = 1E-10;
p3 = 3;
hold on
loglog([mm1(1,1) mm1(2,1)] , [c1 c1*mm1(3,1)^p1],'r-','LineWidth',2 );
hold on
loglog([mm1(1,1) mm1(2,1)] , [c2 c2*mm1(3,1)^p2],'b-','LineWidth',2 );
hold on
loglog([mm1(1,1) mm1(2,1)] , [c3 c3*mm1(3,1)^p3],'k-','LineWidth',2 );
% h = legend('IE','2-2','3-3','1st Order','2nd Order','3rd Order','Location','SouthEast');
% set(h,'Interpreter','latex','Fontsize',14);
% axis([mm1(1,1) mm1(2,1) 1E-7 1E3])

figure(2)
% loglog(temp_data(:,1,1) , temp_data(:,2,1) , 'r--o' , ...
 loglog(       temp_data(:,1,2) , temp_data(:,2,2) , 'b-x' , ...
        temp_data(:,1,3) , temp_data(:,2,3) , 'k-.v' , 'LineWidth',2,'MarkerSize',10);
xlabel('$\Delta t$','Interpreter','latex','FontSize',18);
ylabel('$E_{T}$','Interpreter','latex','FontSize',18);

hold on 
c1 = 3E-6;
p1 = 1;
loglog([mm1(1,1) mm1(2,1)] , [c1 c1*mm1(3,1)^p1],'k-','LineWidth',2 );
% h=legend('IE','2-2','3-3','1st Order','Location','NorthWest');
% set(h,'Interpreter','latex','Fontsize',14);
% axis([mm1(1,1) mm1(2,1) 1E-6 0.1])

% % save all of these lovely plots
if(save_all)
    name_base = sprintf('New_Time_Integrators_Convergence_Phi');    
    SavePretty( figure(1) , name_base);

    name_base = sprintf('Time_Integrators_Convergence_Temperature');    
    SavePretty( figure(2) , name_base);
end