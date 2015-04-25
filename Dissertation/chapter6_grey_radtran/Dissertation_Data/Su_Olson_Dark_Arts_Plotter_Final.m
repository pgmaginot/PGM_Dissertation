function Su_Olson_Dark_Arts_Plotter_Final( sn_ord )
% plot the radiation and temperature profile corresponding to
% cell_base_CellDataDump.txt , data_base_TemperatureDump_Final.txt ,
% data_base_PhiDump_Final.txt

% we may be plotting multiple profiles on one plot
% check to see if cell_data or data_base are cell_array
close all
% dfem_mat is an n_p * n_el matrix
[quad_pt , w] = lglnodes(2);
p_ord = length(quad_pt) - 1;
[dfem_mat,junk] = feshpln( linspace(-1,1,p_ord +3) , quad_pt , p_ord);

cell_base = {   ...
  ...  sprintf('Su_Olson/Su_Olson_S%i_Tau_01',sn_ord)...
    sprintf('Su_Olson/Su_Olson_S%i_Tau_1',sn_ord)...
    sprintf('Su_Olson/Su_Olson_S%i_Tau_10',sn_ord)...
        };
    
data_base = {   ...
   ... sprintf('Su_Olson/Su_Olson_S%i_Tau_01',sn_ord)...
    sprintf('Su_Olson/Su_Olson_S%i_Tau_1',sn_ord)...
    sprintf('Su_Olson/Su_Olson_S%i_Tau_10',sn_ord)...
        };


n_plots = length(data_base);

if(n_plots > 7)
    error('Not enough line strings');
end

color_str = cell(2,6);
color_str(1,1) =  cellstr('-') ;  
color_str(1,2) = cellstr('-.' ) ;
color_str(1,3) = cellstr('--' ) ;   
color_str(1,4) = cellstr(':' );  
color_str(1,5) = cellstr('-.' ) ; 
color_str(1,6) =  cellstr('-') ; 
color_str(2,1) = {[0 0 1] } ;
color_str(2,2) = {[0 0.8 0]} ;
color_str(2,4) = {[0 0 1]}  ;
color_str(2,5) = {[0.5 0 0]} ;
color_str(2,6) = {[0 0.8 0.8]} ;

if( length(cell_base) == 1 )
    cell_str_look = ones(n_plots,1);
else
    cell_str_look = 1:1:n_plots';
    cell_str_look = cell_str_look';
end

fid_cell_r = zeros(1,n_plots);
fid_cell_t = fid_cell_r;
fid_rad = fid_cell_r;
fid_temp = fid_cell_r;

% open all data sources
for i=1:1:n_plots
    name_cell = sprintf('%s_CellDataDump.txt' , char(cell_base(cell_str_look(i,1))) );
    name_rad = sprintf('%s_PhiDump_Final.txt',char(data_base(i) ) );
    name_temp = sprintf( '%s_TemperatureDump_Final.txt' , char(data_base(i)) );

    fid_cell_r(i) = fopen(name_cell , 'r' );
    fid_cell_t(i) = fopen(name_cell , 'r' );
    fid_rad(i) = fopen(name_rad , 'r' );
    fid_temp(i) = fopen(name_temp , 'r' );
end

% % this is copied from the su olson article
su_x_w_diff_01 = [ 0.01 0.1 0.17783 0.31623 0.45 0.5 0.56234 0.75 1];
su_x_w_diff_1 = [ 0.01 0.1 0.17783 0.31623 0.45 0.5 0.56234 0.75 1 1.33352 1.77828 3.16228];
su_x_w_diff_10 = [ 0.01 0.1 0.17783 0.31623 0.45 0.5 0.56234 0.75 1 1.33352 1.77828 3.16228 5.62341];

su_w_diff_01 = [.09403 .09326 .09128 .08230 .06086 .04766 .03171 .00755 0.00064];
su_w_diff_1 = [.50359 .49716 .48302 .43743 .36656 .33271 .29029 .18879 .10150 .04060 .01011 .00003];
su_w_diff_10 = [1.86585 1.85424 1.82889 1.74866 1.62824 1.57237 1.50024 1.29758 1.06011 0.79696 0.52980 0.12187 0.00445];    

su_x_v_diff_01 = [ 0.01 0.1 0.17783 0.31623 0.45 0.5 0.56234 0.75];
su_x_v_diff_1 = [ 0.01 0.1 0.17783 0.31623 0.45 0.5 0.56234 0.75 1 1.33352 1.77828];
su_x_v_diff_10 = [ 0.01 0.1 0.17783 0.31623 0.45 0.5 0.56234 0.75 1 1.33352 1.77828 3.163228 5.62341];

su_v_diff_01 = [.00466 .00464 .00458 .00424 .00315 .00234 .00137 .00023];
su_v_diff_1 = [.21859 .21565 .20913 .18765 .15298 .13590 .11468 .06746 .03173 .01063 .00210];
su_v_diff_10 = [1.75359 1.74218 1.71726 1.63837 1.51991 1.46494 1.39405 1.19584 0.96571 0.71412 0.46369 .09834 .00306];


su_x_w_trans_01 = [ 0.01 0.1 0.17783 0.31623 0.45 0.5 0.56234];
su_x_w_trans_1 = [ 0.01 0.1 0.17783 0.31623 0.45 0.5 0.56234 0.75 1 1.33352 ];
su_x_w_trans_10 = [ 0.01 0.1 0.17783 0.31623 0.45 0.5 0.56234 0.75 1 1.33352 1.77828 3.16228 5.62341];

su_w_trans_01 = [0.09531 0.09531 0.09532 0.09529 0.08823 0.04765 0.00375];
su_w_trans_1 = [0.64308 0.63585 0.61958 0.56187 0.44711 0.35801 0.25374 0.11430 0.03648 0.00291];
su_w_trans_10 = [2.23575 2.21944 2.18344 2.06448 1.86072 1.73178 1.57496 1.27398 0.98782 0.70822 0.45016 0.09673 0.00375];    

su_x_v_trans_01 = [ 0.01 0.1 0.17783 0.31623 0.45 0.5 0.56234];
su_x_v_trans_1 = [ 0.01 0.1 0.17783 0.31623 0.45 0.5 0.56234 0.75 1 1.33352];
su_x_v_trans_10 = [ 0.01 0.1 0.17783 0.31623 0.45 0.5 0.56234 0.75 1 1.33352 1.77828 3.16228 5.62341];

su_v_trans_01 = [.00468 .00468 .00468 .00468 .00455 .00234 .00005];
su_v_trans_1 = [.27126 .26839 .26261 .23978 .18826 .14187 .08838 .03014 .00625 .00017];
su_v_trans_10 = [2.11186 2.09585 2.06052 1.94365 1.74291 1.61536 1.46027 1.16591 0.88992 0.62521 0.3688 0.07642 0.00253];


% plot one variable at a time to avoit needless, slow, figure switching
% % % % % % % % % % % % % % % % % % % % % % % % % %  % 
% Material energy, V(x)
% % % % % % % % % % % % % % % % % % % % % % % % % %  % 
figure(1)
for i=1:1:n_plots
    % determine number of elements per cell
    
    % read the comment line, '#Cell'
    junk = fscanf(fid_cell_t(i) , '%s' , 1);
    n_el_cell  = determine_n_el(fid_cell_t(i));
    
    junk = fscanf(fid_temp(i) , '%s' , 1);
    n_el_temp = determine_n_el(fid_temp(i) );
   
    if(n_el_cell == n_el_temp)
        
    else
       error('Temperature data and cell data do not match'); 
    end
    
    [x,t] = GetOneTempData(fid_cell_t(i) , fid_temp(i) , n_el_cell );
    t=t.^4;

    plot(dfem_mat*x,dfem_mat*t, char(color_str(1,i)) , 'Color' , color_str{2,i} ,  'LineWidth',2)
    hold on   
end

if(sn_ord ==2)
    plot( ... su_x_v_diff_01 , su_v_diff_01 , 'kx' , su_x_v_trans_01 , su_v_trans_01 , 'r+' , ...
        su_x_v_diff_1 , su_v_diff_1 , 'kx' , su_x_v_trans_1 , su_v_trans_1 , 'r+' , ...
        su_x_v_diff_10 , su_v_diff_10 , 'kx' , su_x_v_trans_10 , su_v_trans_10 , 'r+' , 'LineWidth', 2 , 'MarkerSize' , 12)
    hold on
elseif(sn_ord ==8)
    plot( ... su_x_v_trans_01 , su_v_trans_01 , 'r+' , ...
        su_x_v_trans_1 , su_v_trans_1 , 'r+' , ...
        su_x_v_trans_10 , su_v_trans_10 , 'r+' , 'LineWidth', 2 , 'MarkerSize' , 12)
    hold on
else
   error('Sn order not coded') 
end

for i=1:1:n_plots
    while(~feof(fid_temp(i) ) )
        [x,t] = GetOneTempData(fid_cell_t(i) , fid_temp(i) , n_el_cell );             
        t=t.^4;
        plot(dfem_mat*x,dfem_mat*t, char(color_str(1,i)) , 'Color' , color_str{2,i} , 'LineWidth',2)
        hold on
    end
    fclose(fid_cell_t(i));
    fclose(fid_temp(i));
end

if(sn_ord==2)
    xlabel('Position','FontSize',18,'Interpreter','latex');
    ylabel('Material Energy Density, V(x)','FontSize',18,'Interpreter','latex');
    text(0.25 , 0.4 , '$\tau=1$' , 'Interpreter','latex','FontSize',18 )
    text(1.6 , 0.75 , '$\tau=10$' , 'Interpreter','latex','FontSize',18 )
    axis([0 4 0 2.5])
    h=legend('$S_2~\tau=1$' , '$S_2~\tau=10$' , 'Diffusion' , 'Transport');
    set(h, 'Interpreter','latex','FontSize',18)
    
    SavePretty(gcf , 'Su_Olson_S2_Material_Energy')
elseif(sn_ord ==8)
    xlabel('Position','FontSize',18,'Interpreter','latex');
    ylabel('Material Energy Density, V(x)','FontSize',18,'Interpreter','latex');
    text(0.25 , 0.4 , '$\tau=1$' , 'Interpreter','latex','FontSize',18 )
    text(1.6 , 0.75 , '$\tau=10$' , 'Interpreter','latex','FontSize',18 )
    axis([0 4 0 2.5])
    h=legend('$S_8~\tau=1$' , '$S_8~\tau=10$' , 'Transport');
    set(h, 'Interpreter','latex','FontSize',18)
    
    SavePretty(gcf , 'Su_Olson_S8_Material_Energy')
end


% % % % % % % % % % % % % % % % % % % % % % % % % %  % 
% Radiation energy, W(x)
% % % % % % % % % % % % % % % % % % % % % % % % % %  % 
figure(2)
for i=1:1:n_plots
    % read the comment line, '#Cell'
    junk = fscanf(fid_cell_r(i) , '%s' , 1);
    n_el_cell  = determine_n_el(fid_cell_r(i));
    
    for j=1:1:3
        junk = fscanf(fid_rad(i) , '%s' , 1);
    end
    n_el_rad = determine_n_el(fid_rad(i) );
   
    if(n_el_cell == n_el_rad)
        
    else
       error('Radiation data and cell data do not match'); 
    end
    
    [x,r] = GetOneRadData(fid_cell_r(i) , fid_rad(i) , n_el_cell );

    plot(dfem_mat*x,dfem_mat*r, char(color_str(1,i)) , 'Color' , color_str{2,i} ,  'LineWidth',2)
    
    hold on
end

if(sn_ord ==2)
    plot( ... su_x_v_diff_01 , su_v_diff_01 , 'kx' , su_x_v_trans_01 , su_v_trans_01 , 'r+' , ...
        su_x_w_diff_1 , su_w_diff_1 , 'kx' , su_x_w_trans_1 , su_w_trans_1 , 'r+' , ...
        su_x_w_diff_10 , su_w_diff_10 , 'kx' , su_x_w_trans_10 , su_w_trans_10 , 'r+' , 'LineWidth', 2 , 'MarkerSize' , 12)
    hold on
elseif(sn_ord ==8)
    plot( ... su_x_v_trans_01 , su_v_trans_01 , 'r+' , ...
        su_x_w_trans_1 , su_w_trans_1 , 'r+' , ...
        su_x_w_trans_10 , su_w_trans_10 , 'r+' , 'LineWidth', 2 , 'MarkerSize' , 12)
    hold on
else
   error('Sn order not coded') 
end

for i=1:1:n_plots    
    while(~feof(fid_rad(i) ) )

            [x,r] = GetOneRadData(fid_cell_r(i) , fid_rad(i) , n_el_cell );
            plot(dfem_mat*x,dfem_mat*r, char(color_str(1,i)) , 'Color' , color_str{2,i} , 'LineWidth',2)
        hold on
    end
    fclose(fid_cell_r(i));
    fclose(fid_rad(i));
end

axis([0 4 0 0.75])
xlabel('Position','FontSize',18,'Interpreter','latex');
ylabel('Radiation Energy Density, W(x)','FontSize',18,'Interpreter','latex');
if(sn_ord==2)
    xlabel('Position','FontSize',18,'Interpreter','latex');
    ylabel('Radiation Energy Density, W(x)','FontSize',18,'Interpreter','latex');
    text(0.55 , 0.55 , '$\tau=1$' , 'Interpreter','latex','FontSize',18 )
    text(2.1 , 0.5 , '$\tau=10$' , 'Interpreter','latex','FontSize',18 )
    axis([0 4 0 2.5])
    h=legend('$S_2~\tau=1$' , '$S_2~\tau=10$' , 'Diffusion' , 'Transport');
    set(h, 'Interpreter','latex','FontSize',18)
    
    SavePretty(gcf , 'Su_Olson_S2_Radiation_Energy')
elseif(sn_ord ==8)
    xlabel('Position','FontSize',18,'Interpreter','latex');
    ylabel('Radiation Energy Density, W(x)','FontSize',18,'Interpreter','latex');
    text(1 , 0.2 , '$\tau=1$' , 'Interpreter','latex','FontSize',18 )
    text(1 , 1.3 , '$\tau=10$' , 'Interpreter','latex','FontSize',18 )
    axis([0 4 0 2.5])
    h=legend('$S_8~\tau=1$' , '$S_8~\tau=10$' , 'Transport');
    set(h, 'Interpreter','latex','FontSize',18)
    
    SavePretty(gcf , 'Su_Olson_S8_Radiation_Energy')
end

return
end