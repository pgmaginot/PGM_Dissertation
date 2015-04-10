function mm = GenerateRoughPlots(width,offset,n,fid)

mm = zeros(3,4);
data = zeros(ceil(n/4),2, 4, 4);
for i=1:1:4
    data = SortByP(fid(offset+i),n,data,i,width);
    
    switch i
        case 1
            y_str = sprintf('$E_{\\phi_A}$');
        case 2
            y_str = sprintf('$E_{\\phi}$');
        case 3
            y_str = sprintf('$E_{T_A}$'); 
        case 4
            y_str = sprintf('$E_{T}$'); 
    end
    
    figure(offset + i)
    % linear
    loglog(data(:,1,1,i) , data(:,2,1,i) , 'ko-.','LineWidth',2,'MarkerSize',10);
    hold on;
    mm(1,i) = min(nonzeros(data(:,1,1,i)));
    mm(2,i) = max(nonzeros(data(:,1,1,i)));
    
    % quadratic
    loglog(data(:,1,2,i) , data(:,2,2,i) , 'bx--','LineWidth',2,'MarkerSize',10);
    hold on;
    mm(1,i) = min( min(nonzeros(data(:,1,2,i))) , mm(1,i) );
    mm(2,i) = max( max(nonzeros(data(:,1,2,i))) , mm(2,i) ) ;
    
    % cubic
    loglog(data(:,1,3,i) , data(:,2,3,i) , 'rs-','LineWidth',2,'MarkerSize',10);
    hold on;
    mm(1,i) = min( min(nonzeros(data(:,1,3,i))) , mm(1,i) );
    mm(2,i) = max( max(nonzeros(data(:,1,3,i))) , mm(2,i) ) ;
    
    % quartic
    loglog(data(:,1,4,i) , data(:,2,4,i) , 'v-.','Color', [0 0.7 0],  'LineWidth', 2,'MarkerSize',10);
    hold on;
    mm(1,i) = min( min(nonzeros(data(:,1,4,i))) , mm(1,i) );
    mm(2,i) = max( max(nonzeros(data(:,1,4,i))) , mm(2,i) ) ;
    
    mm(3,i) = mm(2,i) / mm(1,i);
    
    xlabel('Cell size [cm]','Interpreter','latex','FontSize',18);
    ylabel(y_str,'Interpreter','latex','FontSize',18)
end


return
end