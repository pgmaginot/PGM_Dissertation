function Dark_Arts_Plotter_Two_Lines( fig_n_temp , fig_n_rad , cell_base , data_base ,dfem_mat , dfem_mat_2)
% plot the radiation and temperature profile corresponding to
% cell_base_CellDataDump.txt , data_base_TemperatureDump_Final.txt ,
% data_base_PhiDump_Final.txt

% we may be plotting multiple profiles on one plot
% check to see if cell_data or data_base are cell_array

if( ~iscellstr(data_base) )
    error('Data must be passed in as cell arrays')
end

if( ~iscellstr(cell_base) )
    error('CellData must be passed in as cell arrays')
end

n_plots = length(data_base);

if(n_plots ~= 2)
    error('Wrong plot routine');
end

color_str = cell(2,2);
color_str(1,1) =  cellstr('-') ;  
color_str(1,2) = cellstr('--' ) ;
color_str(2,1) = {[0 0 0] } ;
color_str(2,2) = {[1 0 0]} ;

cell_str_look = 1:1:n_plots';
cell_str_look = cell_str_look';

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

i=1;
junk = fscanf(fid_cell_t(i) , '%s' , 1);
n_el_cell  = determine_n_el(fid_cell_t(i));

junk = fscanf(fid_temp(i) , '%s' , 1);
n_el_temp = determine_n_el(fid_temp(i) );

if(n_el_cell == n_el_temp)

else
   error('Temperature data and cell data do not match'); 
end

[x,t] = GetOneTempData(fid_cell_t(i) , fid_temp(i) , n_el_cell );

plot(dfem_mat*x,dfem_mat*t, char(color_str(1,i)) , 'Color' , color_str{2,i} ,  'LineWidth',2)

hold on
    
i=2;
junk = fscanf(fid_cell_t(i) , '%s' , 1);
n_el_cell_2  = determine_n_el(fid_cell_t(i));

junk = fscanf(fid_temp(i) , '%s' , 1);
n_el_temp_2 = determine_n_el(fid_temp(i) );

if(n_el_cell_2 == n_el_temp_2)

else
   error('Temperature data and cell data do not match'); 
end

[x,t] = GetOneTempData(fid_cell_t(i) , fid_temp(i) , n_el_cell_2 );

plot(dfem_mat_2*x,dfem_mat_2*t, char(color_str(1,i)) , 'Color' , color_str{2,i} ,  'LineWidth',2)

hold on

i=1;
while(~feof(fid_temp(i) ) )
    [x,t] = GetOneTempData(fid_cell_t(i) , fid_temp(i) , n_el_cell );
    plot(dfem_mat*x,dfem_mat*t, char(color_str(1,i)) , 'Color' , color_str{2,i} , 'LineWidth',2)
    
    hold on
end
fclose(fid_cell_t(i));
fclose(fid_temp(i));

i=2;
while(~feof(fid_temp(i) ) )
    [x,t] = GetOneTempData(fid_cell_t(i) , fid_temp(i) , n_el_cell_2 );
    plot(dfem_mat_2*x,dfem_mat_2*t, char(color_str(1,i)) , 'Color' , color_str{2,i} , 'LineWidth',2)
    hold on     
end
fclose(fid_cell_t(i));
fclose(fid_temp(i));

xlabel('Position','FontSize',18,'Interpreter','latex');
ylabel('Material Temperature','FontSize',18,'Interpreter','latex');


figure(fig_n_rad)
i=1;
% set the legend entries
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

i=2;
junk = fscanf(fid_cell_r(i) , '%s' , 1);
n_el_cell_2  = determine_n_el(fid_cell_r(i));

for j=1:1:3
    junk = fscanf(fid_rad(i) , '%s' , 1);
end
n_el_rad_2 = determine_n_el(fid_rad(i) );

if(n_el_cell_2 == n_el_rad_2)

else
   error('Radiation data and cell data do not match'); 
end

[x,r] = GetOneRadData(fid_cell_r(i) , fid_rad(i) , n_el_cell_2 );

plot(dfem_mat_2*x,dfem_mat_2*r, char(color_str(1,i)) , 'Color' , color_str{2,i} ,  'LineWidth',2)

hold on

i=1;
while(~feof(fid_rad(i) ) )
        [x,r] = GetOneRadData(fid_cell_r(i) , fid_rad(i) , n_el_cell );
        plot(dfem_mat*x,dfem_mat*r, char(color_str(1,i)) , 'Color' , color_str{2,i} , 'LineWidth',2)

    hold on
end
fclose(fid_cell_r(i));
fclose(fid_rad(i));

i=2;
while(~feof(fid_rad(i) ) )
        [x,r] = GetOneRadData(fid_cell_r(i) , fid_rad(i) , n_el_cell_2 );
        plot(dfem_mat_2*x,dfem_mat_2*r, char(color_str(1,i)) , 'Color' , color_str{2,i} , 'LineWidth',2)

    hold on
end
fclose(fid_cell_r(i));
fclose(fid_rad(i));

xlabel('Position','FontSize',18,'Interpreter','latex');
ylabel('Radiation Energy Density','FontSize',18,'Interpreter','latex');


return
end