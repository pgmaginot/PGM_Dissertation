% plot each methd and P as the mesh get refined
% use the finest time step size
close all
for m=3:1:3
    if(m==1)
        cell_meth = 'SL_Lobatto';
        data_meth = 'SL_Lobatto';
        quad_f = @lglnodes;
    elseif(m==2)
        data_meth = 'SL_Gauss';
        cell_meth = 'SL_Gauss';
        quad_f = @GLNodeWt;
    elseif(m==3)
        data_meth = 'Constant_XS' ;
        cell_meth = 'SL_Lobatto';
        quad_f = @lglnodes;
    else
        error('Method not coded')
    end
    for p=1:1:4
        if(m==3)
            if(p~=1)
                continue;
            end
        end
        [quad_pt , w] = quad_f(p+1);
        [dfem_mat,junk] = feshpln( linspace(-1,1, 2*p^2 + 1) , quad_pt ,p);
        
        cell_base = {   sprintf('Marshak_Results/%s_P%i_1280_cell',cell_meth,p) ...
                        sprintf('Marshak_Results/%s_P%i_320_cell',cell_meth,p) ...
                        sprintf('Marshak_Results/%s_P%i_80_cell',cell_meth,p) ...
                        sprintf('Marshak_Results/%s_P%i_20_cell',cell_meth,p)  };
             
        if(m==3)
            cell_base = {   sprintf('Marshak_Results/%s_P%i_320_cell',cell_meth,p) ...
                        sprintf('Marshak_Results/%s_P%i_80_cell',cell_meth,p) ...
                        sprintf('Marshak_Results/%s_P%i_20_cell',cell_meth,p) ...
                         };
                    
            data_base = {   sprintf('Marshak_Results/Marshak_Wave_%s_P%i_Refine_16_Cells_64_Time',data_meth,p) ...                
                            sprintf('Marshak_Results/Marshak_Wave_%s_P%i_Refine_4_Cells_64_Time',data_meth,p) ...
                            sprintf('Marshak_Results/Marshak_Wave_%s_P%i',data_meth,p) ...
                             };
                       
        else
            data_base = {   sprintf('Marshak_Results/Marshak_Wave_%s_P%i_Base_Refine_64_Cells_64_Time',data_meth,p)  ...                
                            sprintf('Marshak_Results/Marshak_Wave_%s_P%i_Base_Refine_16_Cells_64_Time',data_meth,p) ...                            
                            sprintf('Marshak_Results/Marshak_Wave_%s_P%i_Base_Refine_4_Cells_64_Time',data_meth,p) ...
                            sprintf('Marshak_Results/Marshak_Wave_%s_P%i_Base',data_meth,p) ...
                            };
        end
        Dark_Arts_Plotter((m-1)*4 + p,10 + (m-1)*4 + p ,cell_base,data_base,dfem_mat)
        
        temperature_file = sprintf('Reorder_Marshak_Zoom_Temperature_%s_P%i_Cell_Refinement',data_meth,p);
        rad_file = sprintf('Reorder_Marshak_Zoom_Radiation_%s_P%i_Cell_Refinement',data_meth,p);
        
        % Temperature
        figure((m-1)*4 + p)
        h = legend('1280 Cells', '320 Cells' ,'80 Cells' ,'20 Cells'  );
        set(h,'Interpreter','latex','FontSize',14);
        if(m~=3)
            set(gca,'XTick',[0.34 0.36 0.38 0.4 0.42 0.44])
            axis([0.34 0.42 -0.15 0.8])
            
%             SavePretty( figure((m-1)*4 + p) , temperature_file);
        end
        
        


        % Radiation
        figure(10 + (m-1)*4 + p)
%         h = legend('20 Cell' , '80 Cell' , '320 Cell' , '1280 Cell');
        h = legend('1280 Cells', '320 Cells' ,'80 Cells' ,'20 Cells'  );
        set(h,'Interpreter','latex','FontSize',14);
        
        if(m~=3)
            axis([0.34 0.42 -0.1 1.2])
            set(gca,'XTick',[0.36 0.38 0.4])     
            
%             SavePretty( figure((m-1)*4 + p + 10) , rad_file);
        end
        
    end    
end
% 
% blading plots
figure(9)
axis([0 1 -0.1 1.5])
h = legend( '320 Cells','80 Cells', '20 Cells'  );
set(h,'Interpreter','latex','FontSize',14);
SavePretty( figure(9) , 'Reorder_Blading_Temperature_Full_MultiCell');

axis([0.3 0.42 -0.05 1.1])
SavePretty( figure(9) , 'Reorder_Blading_Temperature_Zoom_MultiCell');

figure(19)
axis([0 1 -0.1 2.2])
h = legend( '320 Cells','80 Cells', '20 Cells'  );
set(h,'Interpreter','latex','FontSize',14);
SavePretty( figure(19) , 'Reorder_Blading_Radiation_Full_MultiCell');