function Su_Olson_Dark_Arts_Plotter_Final( sn_ord )
% plot the radiation and temperature profile corresponding to
% cell_base_CellDataDump.txt , data_base_TemperatureDump_Final.txt ,
% data_base_PhiDump_Final.txt

% we may be plotting multiple profiles on one plot
% check to see if cell_data or data_base are cell_array

% dfem_mat is an n_p * n_el matrix
[quad_pt , w] = lglnodes(2);
p_ord = length(quad_pt) - 1;
[dfem_mat,junk] = feshpln( linspace(-1,1,p_ord +3) , quad_pt , p_ord);

cell_base = {   ...
    sprintf('Su_Olson/Su_Olson_S%i_Tau_01',sn_ord)...
    sprintf('Su_Olson/Su_Olson_S%i_Tau_1',sn_ord)...
    sprintf('Su_Olson/Su_Olson_S%i_Tau_10',sn_ord)...
        };
    
cell_base = {   ...
    sprintf('Su_Olson/Su_Olson_S%i_Tau_01',sn_ord)...
    sprintf('Su_Olson/Su_Olson_S%i_Tau_1',sn_ord)...
    sprintf('Su_Olson/Su_Olson_S%i_Tau_10',sn_ord)...
        };


n_plots = length(data_base);

if(n_plots > 7)
    error('Not enough line strings');
end

color_str = cell(2,6);
color_str(1,1) =  cellstr('-') ;  
color_str(1,2) = cellstr('--' ) ;
color_str(1,3) = cellstr('-.' ) ;   
color_str(1,4) = cellstr(':' );  
color_str(1,5) = cellstr('-.' ) ; 
color_str(1,6) =  cellstr('-') ; 
color_str(2,1) = {[1 0 0] } ;
color_str(2,2) = {[1 0 0]} ;
color_str(2,3) = {[0 0.8 0]} ;
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

if(sn_ord ==2)
    su_x_w_01 = [ 0.01 0.1 0.17783 0.31623 0.45 0.5 0.56234 0.75 1 1.33352 ];
    su_x_w_1 = [ 0.01 0.1 0.17783 0.31623 0.45 0.5 0.56234 0.75 1 1.33352 ];
    su_x_w_10 = [ 0.01 0.1 0.17783 0.31623 0.45 0.5 0.56234 0.75 1 1.33352 ];
    
    su_x_v_01 = [ 0.01 0.1 0.17783 0.31623 0.45 0.5 0.56234 0.75 1 1.33352 ];
    su_x_v_1 = [ 0.01 0.1 0.17783 0.31623 0.45 0.5 0.56234 0.75 1 1.33352 ];
    su_x_v_10 = [ 0.01 0.1 0.17783 0.31623 0.45 0.5 0.56234 0.75 1 1.33352 ];
    
    su_v_plot_01 = [.27126 .26839 .26261 .23978 .18826 .14187 .08838 .03014 .00625 .00017];
    su_v_plot_1 = [.27126 .26839 .26261 .23978 .18826 .14187 .08838 .03014 .00625 .00017];
    su_v_plot_10 = [.27126 .26839 .26261 .23978 .18826 .14187 .08838 .03014 .00625 .00017];
    
    su_w_plot_01 = [.27126 .26839 .26261 .23978 .18826 .14187 .08838 .03014 .00625 .00017];
    su_w_plot_1 = [.27126 .26839 .26261 .23978 .18826 .14187 .08838 .03014 .00625 .00017];
    su_w_plot_10 = [.27126 .26839 .26261 .23978 .18826 .14187 .08838 .03014 .00625 .00017];    
elseif(sn_ord ==8)
    su_x_w_01 = [ 0.01 0.1 0.17783 0.31623 0.45 0.5 0.56234 0.75 1 1.33352 ];
    su_x_w_1 = [ 0.01 0.1 0.17783 0.31623 0.45 0.5 0.56234 0.75 1 1.33352 ];
    su_x_w_10 = [ 0.01 0.1 0.17783 0.31623 0.45 0.5 0.56234 0.75 1 1.33352 ];
    
    su_x_v_01 = [ 0.01 0.1 0.17783 0.31623 0.45 0.5 0.56234 0.75 1 1.33352 ];
    su_x_v_1 = [ 0.01 0.1 0.17783 0.31623 0.45 0.5 0.56234 0.75 1 1.33352 ];
    su_x_v_10 = [ 0.01 0.1 0.17783 0.31623 0.45 0.5 0.56234 0.75 1 1.33352 ];
    
    su_v_plot_01 = [.27126 .26839 .26261 .23978 .18826 .14187 .08838 .03014 .00625 .00017];
    su_v_plot_1 = [.27126 .26839 .26261 .23978 .18826 .14187 .08838 .03014 .00625 .00017];
    su_v_plot_10 = [.27126 .26839 .26261 .23978 .18826 .14187 .08838 .03014 .00625 .00017];
    
    su_w_plot_01 = [.27126 .26839 .26261 .23978 .18826 .14187 .08838 .03014 .00625 .00017];
    su_w_plot_1 = [.27126 .26839 .26261 .23978 .18826 .14187 .08838 .03014 .00625 .00017];
    su_w_plot_10 = [.27126 .26839 .26261 .23978 .18826 .14187 .08838 .03014 .00625 .00017];    
else
   error('Sn order not coded') 
end

% plot one variable at a time to avoit needless, slow, figure switching
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
    if( p_refining )
        [q,w] = fun_handle(n_el_cell);
        [plot_mat,trash] = feshpln( linspace(-1,1, 2*(5-i)^2 + 2) , q , 5-i);
        plot(plot_mat*x,plot_mat*t, char(color_str(1,i)) , 'Color' , color_str{2,i} ,  'LineWidth',2)
    else
        plot(dfem_mat*x,dfem_mat*t, char(color_str(1,i)) , 'Color' , color_str{2,i} ,  'LineWidth',2)
    end
    hold on
    
end
plot(su_x_v_01, su_v_plot_01  , 'kx', su_x_v_1, su_v_plot_1  , 'bo', su_x_v_10, su_v_plot_10  , 'r+','LineWidth' , 2 , 'MarkerSize',12);

for i=1:1:n_plots
    if( p_refining )
        [q,w] = fun_handle(5-i+1);
        [plot_mat,trash] = feshpln( linspace(-1,1, 2*(5-i)^2 +5) , q , 5-i);
    end
    while(~feof(fid_temp(i) ) )
       
        if(p_refining)
             [x,t] = GetOneTempData(fid_cell_t(i) , fid_temp(i) ,6-i );
             t = t.^4;
            plot(plot_mat*x,plot_mat*t, char(color_str(1,i)) , 'Color' , color_str{2,i} , 'LineWidth',2)
        else
             [x,t] = GetOneTempData(fid_cell_t(i) , fid_temp(i) , n_el_cell );
             
            t=t.^4;
             plot(dfem_mat*x,dfem_mat*t, char(color_str(1,i)) , 'Color' , color_str{2,i} , 'LineWidth',2)
        end
         hold on
    end
    fclose(fid_cell_t(i));
    fclose(fid_temp(i));
end

xlabel('Position','FontSize',18,'Interpreter','latex');
ylabel('Material Energy Density, V(x)','FontSize',18,'Interpreter','latex');
axis([0 4 0 0.5])
if(sn_ord==2)
    h = legend('$\tau=0.1$ Num','$\tau=1$ Num','$\tau=10$ Num','$\tau=0.1$ Exact', '$\tau=1$ Exact', '$\tau=10$ Exact');    
    set(h,'Interpreter','latex')
    SavePretty(gcf,'S2_v_Diffusion_Material_Energy')
else
    h = legend('$\tau=0.1$ Num','$\tau=1$ Num','$\tau=10$ Num','$\tau=0.1$ Exact', '$\tau=1$ Exact', '$\tau=10$ Exact');     
    set(h,'Interpreter','latex')
    SavePretty(gcf,'S8_v_Diffusion_Material_Energy')
end

figure(2)
% set the legend entries
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
%     char(color_str(i))
    if( p_refining )
        [q,w] = fun_handle(n_el_cell);
        [plot_mat,trash] = feshpln( linspace(-1,1,2*(5-i)^2 + 2) , q , 5-i);
        plot(plot_mat*x,plot_mat*r, char(color_str(1,i)) , 'Color' , color_str{2,i} ,  'LineWidth',2)
    else
        plot(dfem_mat*x,dfem_mat*r, char(color_str(1,i)) , 'Color' , color_str{2,i} ,  'LineWidth',2)
    end
    
    
    
    
    hold on
end

plot(su_x_w, su_w_plot  , 'kx', 'LineWidth' , 2 , 'MarkerSize',12);
hold on

for i=1:1:n_plots    
    if( p_refining )
        [q,w] = fun_handle( 5-i+1);
        [plot_mat,trash] = feshpln( linspace(-1,1, 2*(5-i)^2 + 3) , q ,5-i);
    end
    while(~feof(fid_rad(i) ) )
        if( p_refining )
            [x,r] = GetOneRadData(fid_cell_r(i) , fid_rad(i) , 5-i+1 );
            plot(plot_mat*x,plot_mat*r, char(color_str(1,i)) , 'Color' , color_str{2,i} , 'LineWidth',2)
        else
            [x,r] = GetOneRadData(fid_cell_r(i) , fid_rad(i) , n_el_cell );
            plot(dfem_mat*x,dfem_mat*r, char(color_str(1,i)) , 'Color' , color_str{2,i} , 'LineWidth',2)
        end
        hold on
    end
    fclose(fid_cell_r(i));
    fclose(fid_rad(i));
end

axis([0 4 0 0.75])
xlabel('Position','FontSize',18,'Interpreter','latex');
ylabel('Radiation Energy Density, W(x)','FontSize',18,'Interpreter','latex');


return
end