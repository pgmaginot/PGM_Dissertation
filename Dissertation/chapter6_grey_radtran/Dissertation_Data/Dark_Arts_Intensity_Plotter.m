function Dark_Arts_Intensity_Plotter( fig_num , cell_base , data_base ,dfem_mat , n_skip , n_dir, n_groups)
% plot the radiation and temperature profile corresponding to
% cell_base_CellDataDump.txt , data_base_TemperatureDump_Final.txt ,
% data_base_PhiDump_Final.txt

% we may be plotting multiple profiles on one plot
% check to see if cell_data or data_base are cell_array

% dfem_mat is an n_p * n_el matrix

fun_handle = dfem_mat;

if( ~iscellstr(data_base) )
    error('Data must be passed in as cell arrays')
end

if( ~iscellstr(cell_base) )
    error('CellData must be passed in as cell arrays')
end

[n_plots,n] = size(data_base);

if(n_dir*n_groups > 8)
    error('Need more plot strings for this many groups / directions')
end

if(n_plots > 8)
    error('Not enough line plot format strings');
end

color_str = cell(2,8);
color_str(1,1) =  cellstr('-') ;  
color_str(1,2) = cellstr('--' ) ;
color_str(1,3) = cellstr('-.' ) ;   
color_str(1,4) = cellstr(':' );  
color_str(1,5) =  cellstr('-' );  
color_str(1,6) = cellstr('--' ) ;  
color_str(1,7) =  cellstr('-.' ) ;
color_str(1,8) = cellstr(':') ;  

color_str(2,1) = {[0 0 0] } ;
color_str(2,2) = {[1 0 0]} ;
color_str(2,3) = {[0 0.8 0]} ;
color_str(2,4) = {[0 0 1]} ;
color_str(2,5) = {[1 0 1] } ;
color_str(2,6) = {[0 0.5 0.5]} ;
color_str(2,7) = {[0 1 1]} ;
color_str(2,8) = {[0.5 0 0]} ;


if( length(cell_base) == 1 )
    cell_str_look = ones(n_plots,1);
else
    cell_str_look = 1:1:n_plots';
    cell_str_look = cell_str_look';
end

fid_cell = zeros(1,n_plots);
fid_rad = fid_cell;
% open all data sources

for i=1:1:n_plots
    if(n==1)
        name_cell = sprintf('%s_CellDataDump.txt' , char(cell_base(cell_str_look(i,1))) )
        name_rad = sprintf( '%s_IntensityDump_Final.txt' , char(data_base(i)) )
    elseif(n==2)
        name_cell = sprintf('%s_CellDataDump.txt' , char(cell_base(cell_str_look(i,1))) )
        name_rad = sprintf( '%s_IntensityDump_%s.txt' , char(data_base(i,1)) , char(data_base(i,2))  )
    end

    fid_cell(i) = fopen(name_cell , 'r' )
    fid_rad(i) = fopen(name_rad , 'r' )
end

% multiple lines per file now
% each direction is a differnt line type
% different runs have different symbols?

figure(fig_num)

p_refining = isa(dfem_mat,'function_handle') ;

for i=1:1:n_plots
    % determine number of elements per cell
    
    % read the comment line, '#Cell'
    junk = fscanf(fid_cell(i) , '%s' , 1);
    n_el_cell  = determine_n_el(fid_cell(i));
    
    % '#Cell Group Direction'
    junk = fscanf(fid_rad(i) , '%s' , 1);
    junk = fscanf(fid_rad(i) , '%s' , 1);    
    junk = fscanf(fid_rad(i) , '%s' , 1);
    
    n_el_rad = determine_n_el(fid_rad(i) );
   
    if(n_el_cell == n_el_rad)
        
    else
       error('Intensity data and cell data do not match'); 
    end
    
    % return a single x vector and a cell array of for all groups and
    % directions
    [x,r] = GetOneIntensityData(fid_cell(i) , fid_rad(i) , n_el_cell , n_dir, n_groups);
    
    if( p_refining )
        [q,w] = fun_handle(n_el_cell);
        [plot_mat,trash] = feshpln( linspace(-1,1, 2*(5-i)^2 + 2) , q , 5-i);
        for g=1:1:n_groups
            for d=1:1:n_dir                
                plot(plot_mat*x,plot_mat*r{d,g}, sprintf('%s',char(color_str(1,d+(g-1)*n_dir)) ) ...
                    , 'Color' , color_str{2,d+(g-1)*n_groups+ (i-1)*n_dir*n_groups} ,  'LineWidth',2);
                hold on
            end
        end
    else
        for g=1:1:n_groups
            for d=1:1:n_dir                
                plot(dfem_mat*x,dfem_mat*r{d,g}, sprintf('%s',char(color_str{1,d+(g-1)*n_dir}) ) ...
                    , 'Color' , color_str{2,d+(g-1)*n_groups+ (i-1)*n_dir*n_groups} ,  'LineWidth',2);
                hold on
            end
        end
    end
        
end
% 
for i=1:1:n_plots
    if( p_refining )
        [q,w] = fun_handle(5-i+1);
        [plot_mat,trash] = feshpln( linspace(-1,1, 2*(5-i)^2 +5) , q , 5-i);
    end
    plot_cnt = 0;
    while(~feof(fid_rad(i) ) )
        [x,r] = GetOneIntensityData(fid_cell(i) , fid_rad(i) , n_el_cell , n_dir, n_groups);
        if(mod(plot_cnt,n_skip) == 0)
            % % plot markers
            if( p_refining )
                [q,w] = fun_handle(n_el_cell);
                [plot_mat,trash] = feshpln( linspace(-1,1, 2*(5-i)^2 + 2) , q , 5-i);
                for g=1:1:n_groups
                    for d=1:1:n_dir                
                        plot(plot_mat*x,plot_mat*r{d,g}, sprintf('%s',char(color_str{1,d+(g-1)*n_dir}) ) ...
                            , 'Color' , color_str{2,d+(g-1)*n_groups+ (i-1)*n_dir*n_groups} ,  'LineWidth',2);
                        hold on
                    end
                end
            else
                for g=1:1:n_groups
                    for d=1:1:n_dir                
                        plot(dfem_mat*x,dfem_mat*r{d,g}, sprintf('%s',char(color_str{1,d+(g-1)*n_dir}) ) ...
                            , 'Color' , color_str{2,d+(g-1)*n_groups+ (i-1)*n_dir*n_groups} ,  'LineWidth',2);
                        hold on
                    end
                end
            end
        else
            % % don't plot the markers
            if( p_refining )
                for g=1:1:n_groups
                    for d=1:1:n_dir                
                        plot(plot_mat*x,plot_mat*r{d,g}, sprintf('%s',char(color_str(1,d+(g-1)*n_groups)) ) ...
                            , 'Color' , color_str{2,d+(g-1)*n_groups+ (i-1)*n_dir*n_groups} ,  'LineWidth',2);
                        hold on
                    end
                end
            else
                for g=1:1:n_groups
                    for d=1:1:n_dir                
                        plot(dfem_mat*x,dfem_mat*r{d,g}, sprintf('%s',char(color_str(1,d+(g-1)*n_groups)) ) ...
                            , 'Color' , color_str{2,d+(g-1)*n_groups+ (i-1)*n_dir*n_groups} ,  'LineWidth',2);
                        hold on
                    end
                end
            end
        end
        
        plot_cnt  = plot_cnt + 1;
    end
    fclose(fid_cell(i));
    fclose(fid_rad(i));
end

xlabel('Position','FontSize',18,'Interpreter','latex');
ylabel('Intensity','FontSize',18,'Interpreter','latex');


return
end