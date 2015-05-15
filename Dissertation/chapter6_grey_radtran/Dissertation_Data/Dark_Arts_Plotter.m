function Dark_Arts_Plotter( fig_n_temp , fig_n_rad , cell_base , data_base ,dfem_mat, varargin)
% plot the radiation and temperature profile corresponding to
% cell_base_CellDataDump.txt , data_base_TemperatureDump_Final.txt ,
% data_base_PhiDump_Final.txt

% we may be plotting multiple profiles on one plot
% check to see if cell_data or data_base are cell_array

% dfem_mat is an n_p * n_el matrix

n_opt_args = size(varargin,2);

if(n_opt_args == 1)
    offset = varargin{1};
else
   offset = 0;
end

fun_handle = dfem_mat;

if( ~iscellstr(data_base) )
    error('Data must be passed in as cell arrays')
end

if( ~iscellstr(cell_base) )
    error('CellData must be passed in as cell arrays')
end

n_plots = length(data_base);

if( (offset + n_plots) > 6)
    error('Not enough line strings');
end

color_str = cell(2,5);
color_str(1,1) =  cellstr('-') ;  
color_str(1,2) = cellstr('--' ) ;
color_str(1,3) = cellstr('-.' ) ;   
color_str(1,4) = cellstr(':' );  
color_str(1,5) = cellstr('-.' ) ; 
color_str(2,1) = {[0 0 0] } ;
color_str(2,2) = {[1 0 0]} ;
color_str(2,3) = {[0 0.8 0]} ;
color_str(2,4) = {[0 0 1]}  ;
color_str(2,5) = {[0.5 0 0]} ;

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
    fid_temp(i) = fopen(name_temp , 'r' )
end

% plot one variable at a time to avoit needless, slow, figure switching
figure(fig_n_temp)

p_refining = isa(dfem_mat,'function_handle') ;

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
    
    if( p_refining )
        [q,w] = fun_handle(n_el_cell);
        [plot_mat,trash] = feshpln( linspace(-1,1, 2*(5-i)^2 + 2) , q , 5-i);
        plot(plot_mat*x,plot_mat*t, char(color_str(1,i+offset)) , 'Color' , color_str{2,i+offset} ,  'LineWidth',2)
    else
%     char(color_str(i))
        plot(dfem_mat*x,dfem_mat*t, char(color_str(1,i+offset)) , 'Color' , color_str{2,i+offset} ,  'LineWidth',2)
    end
    hold on
end

for i=1:1:n_plots
    if( p_refining )
        [q,w] = fun_handle(5-i+1);
        [plot_mat,trash] = feshpln( linspace(-1,1, 2*(5-i)^2 +5) , q , 5-i);
    end
    while(~feof(fid_temp(i) ) )
       
        if(p_refining)
             [x,t] = GetOneTempData(fid_cell_t(i) , fid_temp(i) ,6-i );
            plot(plot_mat*x,plot_mat*t, char(color_str(1,i+offset)) , 'Color' , color_str{2,i+offset} , 'LineWidth',2)
        else
             [x,t] = GetOneTempData(fid_cell_t(i) , fid_temp(i) , n_el_cell );
            h = plot(dfem_mat*x,dfem_mat*t, char(color_str(1,i+offset)) , 'Color' , color_str{2,i+offset} , 'LineWidth',2);
            hAnnotation = get(h,'Annotation');
            hLegendEntry = get(hAnnotation','LegendInformation');
            set(hLegendEntry,'IconDisplayStyle','off');
        end
         hold on
    end
    fclose(fid_cell_t(i));
    fclose(fid_temp(i));
end

xlabel('Position','FontSize',18,'Interpreter','latex');
ylabel('Material Temperature','FontSize',18,'Interpreter','latex');

figure(fig_n_rad)
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
        plot(plot_mat*x,plot_mat*r, char(color_str(1,i+offset)) , 'Color' , color_str{2,i+offset} ,  'LineWidth',2)
    else
       plot(dfem_mat*x,dfem_mat*r, char(color_str(1,i+offset)) , 'Color' , color_str{2,i+offset} ,  'LineWidth',2);
    end
    hold on
end

for i=1:1:n_plots    
    if( p_refining )
        [q,w] = fun_handle( 5-i+1);
        [plot_mat,trash] = feshpln( linspace(-1,1, 2*(5-i)^2 + 3) , q ,5-i);
    end
    while(~feof(fid_rad(i) ) )
        if( p_refining )
            [x,r] = GetOneRadData(fid_cell_r(i) , fid_rad(i) , 5-i+1 );
            plot(plot_mat*x,plot_mat*r, char(color_str(1,i+offset)) , 'Color' , color_str{2,i+offset} , 'LineWidth',2)
        else
            [x,r] = GetOneRadData(fid_cell_r(i) , fid_rad(i) , n_el_cell );
            h = plot(dfem_mat*x,dfem_mat*r, char(color_str(1,i+offset)) , 'Color' , color_str{2,i+offset} , 'LineWidth',2);
            
            hAnnotation = get(h,'Annotation');
            hLegendEntry = get(hAnnotation','LegendInformation');
            set(hLegendEntry,'IconDisplayStyle','off');
        end
        hold on
    end
    fclose(fid_cell_r(i));
    fclose(fid_rad(i));
end

xlabel('Position','FontSize',18,'Interpreter','latex');
ylabel('Radiation Energy Density','FontSize',18,'Interpreter','latex');


return
end