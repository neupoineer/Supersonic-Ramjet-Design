function [] = plot_latex(x,y1,y2,y3,title,x_lab,y_lab,leg,loc)
    
    % Create a new figure
    f = figure;
    f.Position = [0,0,750,450];
    
    % Plot the first data set
    hold on    
    p = plot(x,y1);
    p.Color = 'red';
    
    % Add the second and third in different colors
    q = plot(x,y2);
    q.Color = 'blue';
    
    s = plot(x,y3);
    s.Color = [0 0.5 0];
    
    % Set up the title, axes, labels, and the legend
    r = gca;
    r.TickLabelInterpreter = 'latex';
    r.Title.String = title;
    r.Title.Interpreter = 'latex';
    r.Title.FontSize = 16;
    
    r.XLabel.String = x_lab;
    r.XLabel.Interpreter = 'latex';
    r.XLabel.FontSize = 14;
    
    r.YLabel.String = y_lab;
    r.YLabel.Interpreter = 'latex';
    r.YLabel.FontSize = 14;
    
    legend(leg);
    r.Legend.Location = loc;
    r.Legend.Interpreter = 'latex';
    r.Legend.FontSize = 14;
    
    grid on;
    grid minor;
    
end