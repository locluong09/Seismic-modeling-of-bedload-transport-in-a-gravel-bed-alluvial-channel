function ax = multiplot( m, n, varargin)
% MYTILEDLAYOUT Create a grid of axes with equal spacing.
%
%   AX = MYTILEDLAYOUT(M, N) creates an M-by-N tiled layout of axes
%   and returns an array of handles to the axes.
%
%   AX = MYTILEDLAYOUT(M, N, NAME, VALUE) specifies additional options for
%   the layout using one or more name-value pair arguments. Specify the 
%   options after all other input arguments. 
%
%   NAME-VALUE PAIRS (CASE-INSENSITIVE):
%
%       GAPSIZE specifies the size of the gap between adjacent axes in
%       points. the default value is 10 points.
%
%       MARGINSIZE specifies the size of the margins between the axes and
%       the figure edges in points. The default value is 10 points
%
%       LABELSIZE specifies the size of the x and y axis labels. The
%       default value is 16 points.
%
%       TITLESIZE specifies the size of the tile. The default value is 16
%       points.
%
%       FONTSIZE specifies the font size of the tick labels. The default
%       value is 16 points.
%
%       LINEWIDTH specifies the line width of the axes. The default value
%       is 1.5 points.
%
%       BOXSWITCH specifies the display of the box outline around the
%       current axes by setting their Box property to 'on' or 'off'. The
%       default value is 'on'.
%
%       MINORTICKSWITCH specifies if minor tickmarks are 'on' or 'off'. The
%       default value is 'on'.
%       
%       INSIDETICKLABELS specifies if yticklabels outside of the first 
%       column of plots and xticklabls outside of the bottom row of plots 
%       are on or off. The default value is 'off'. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % default parameter values
    gapSize          =    20;    
    marginSize       =    20;   
    labelSize        =    12;   
    titleSize        =    30;  
    fontSize         =    16;  
    lineWidth        =   1.5;  
    boxSwitch        =  'on'; 
    minorTickSwitch  =  'on';  
    insideTickLabels = 'off';
    xaxislabel = '';
    yaxislabel = '';
    
    % Parse optional parameter name-value pairs
    %disp(length(varargin))
    for i = 1 : 2 : length(varargin)
        varargin{i} = lower(varargin{i});
        switch varargin{ i}
            case 'gapsize'
                gapSize    = varargin{i + 1};
            case 'marginsize'
                marginSize = varargin{i + 1};
            case 'labelsize'
                labelSize  = varargin{i + 1};
            case 'titlesize'
                titleSize  = varargin{i + 1};
            case 'fontsize'
                fontSize   = varargin{i + 1};
            case 'linewidth'
                lineWidth  = varargin{i + 1};
            case 'boxswitch'
                boxSwitch  = varargin{i + 1};
            case 'minortickswitch'
                minorTickSwitch = varargin{i + 1};
            case 'insideticklabels'
                insideTickLabels = varargin{i + 1};
            case 'xaxislabel'
                xaxislabel = varargin{i + 1};
            case 'yaxislabel'
                yaxislabel = varargin{i + 1};
            otherwise
                error('Invalid parameter name: %s', varargin{ i});                       
        end
    end
    
    % Compute the size of each axis based on the figure size and the specified
    % gap and margin sizes.
    figPos = get( gcf, 'Position'); % left bottom width height
    
    figWidth  = figPos(3) - 2 * marginSize - (n - 1) * gapSize - 2 * labelSize;
    figHeight = figPos(4) - 2 * marginSize - (m - 1) * gapSize - 2 * labelSize - titleSize;
    axWidth  = figWidth  / n;
    axHeight = figHeight / m;

    % Create the axes and position them in a grid.
    ax = gobjects( m, n);
    for i = 1 : m
        for j = 1 : n

            x = marginSize + (j - 1) * (axWidth  + gapSize) + labelSize;
            y = marginSize + (m - i) * (axHeight + gapSize) + labelSize + titleSize;
            ax(i, j) = axes( 'Position', [x / figPos( 3), y / figPos( 4), ...
                axWidth / figPos( 3), axHeight / figPos( 4)]);
            
            set( gca, 'FontSize', fontSize)
            set( gca, 'LineWidth', lineWidth)
            set( gca, 'Box', boxSwitch)
%             set( gca, 'XMinorTick', minorTickSwitch, 'YMinorTick', minorTickSwitch)
            
%             if i == m
%                 xlabel( ax(i, j), sprintf( xaxislabel, j), 'FontSize', labelSize);
%             else
%                 if isequal( insideTickLabels, 'off')
%                     set(gca, 'XTickLabel', []);
%                 end
%             end
% 
%             if j == 1
%                 ylabel(ax(i, j), sprintf( yaxislabel, i), 'FontSize', labelSize);
%             else
%                 if isequal( insideTickLabels, 'off')
%                     set( gca, 'YTickLabel', []);
%                 end
%             end
            
            %if i == 1
                %title( ax(i, j), 'Power spectral density', 'FontSize', titleSize);
            %end 

%             grid on
%             grid minor
        end
    end
end
