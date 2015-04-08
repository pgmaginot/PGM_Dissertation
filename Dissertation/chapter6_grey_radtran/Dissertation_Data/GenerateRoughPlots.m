function GenerateRoughPlots(width,offset,n,fid)

data = zeros(n,2, 4, 4);
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
    
    % quadratic
    loglog(data(:,1,2,i) , data(:,2,2,i) , 'bx--','LineWidth',2,'MarkerSize',10);
    hold on;
    
    % cubic
    loglog(data(:,1,3,i) , data(:,2,3,i) , 'rs-','LineWidth',2,'MarkerSize',10);
    hold on;
    
    % quartic
    loglog(data(:,1,4,i) , data(:,2,4,i) , 'v-.','Color', [0 0.7 0],  'LineWidth', 2,'MarkerSize',10);
    hold on;
    
    xlabel('Cell size [cm]','Interpreter','latex','FontSize',18);
    ylabel(y_str,'Interpreter','latex','FontSize',18)
    
    legend('P1','P2','P3','P4','Location','NorthWest')
end


return
end