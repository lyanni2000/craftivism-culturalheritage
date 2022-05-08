function plotMap(map, title_string)
    sunshine = [255,204,86]/255;
    persimmon = [240,101,54]/255;
    strawberry = [255,120,126]/255;
    orchid = [213,187,245]/255;
    lav_blue = [126,123,207]/255;

    c_1 = lav_blue; c_2 = orchid; c_3 = strawberry; c_4 = persimmon; c_5 = sunshine;
    w = [1 1 1];

    arr_1980 = []; arr_1990 = []; arr_2000 = []; arr_2010 = []; arr_2020 = []; arr_empty = [];   

    for col_ind = (1:41)  
         for row_ind = (1:29)
            if map(row_ind,col_ind) == 73
                arr_1980 = [arr_1980; row_ind, col_ind];
            elseif map(row_ind,col_ind) == 63
                arr_1990 = [arr_1990; row_ind, col_ind];
            elseif map(row_ind,col_ind) == 64
                arr_2000 = [arr_2000; row_ind, col_ind]; 
            elseif map(row_ind,col_ind) == 60
                arr_2010 = [arr_2010; row_ind, col_ind]; 
            elseif map(row_ind,col_ind) == 52
                arr_2020 = [arr_2020; row_ind, col_ind];
            else
                arr_empty = [arr_empty; row_ind, col_ind];
            end
        end
    end
    
    figure
    hold on
    %Plot first element of all arrays  
    x_1980 = [arr_1980(1,1) - 0.5, arr_1980(1,1) - 0.5, arr_1980(1,1) + 0.5, arr_1980(1,1) + 0.5];
    y_1980 = [arr_1980(1,2) - 0.5, arr_1980(1,2) + 0.5, arr_1980(1,2) + 0.5, arr_1980(1,2) - 0.5];
    patch(y_1980,x_1980,c_5,'EdgeColor','none');

    x_1990 = [arr_1990(1,1) - 0.5, arr_1990(1,1) - 0.5, arr_1990(1,1) + 0.5, arr_1990(1,1) + 0.5];
    y_1990 = [arr_1990(1,2) - 0.5, arr_1990(1,2) + 0.5, arr_1990(1,2) + 0.5, arr_1990(1,2) - 0.5];
    patch(y_1990,x_1990,c_4,'EdgeColor','none');

    x_2000 = [arr_2000(1,1) - 0.5, arr_2000(1,1) - 0.5, arr_2000(1,1) + 0.5, arr_2000(1,1) + 0.5];
    y_2000 = [arr_2000(1,2) - 0.5, arr_2000(1,2) + 0.5, arr_2000(1,2) + 0.5, arr_2000(1,2) - 0.5];
    patch(y_2000,x_2000,c_3,'EdgeColor','none');

    x_2010 = [arr_2010(1,1) - 0.5, arr_2010(1,1) - 0.5, arr_2010(1,1) + 0.5, arr_2010(1,1) + 0.5];
    y_2010 = [arr_2010(1,2) - 0.5, arr_2010(1,2) + 0.5, arr_2010(1,2) + 0.5, arr_2010(1,2) - 0.5];
    patch(y_2010,x_2010,c_2,'EdgeColor','none');

    x_2020 = [arr_2020(1,1) - 0.5, arr_2020(1,1) - 0.5, arr_2020(1,1) + 0.5, arr_2020(1,1) + 0.5];
    y_2020 = [arr_2020(1,2) - 0.5, arr_2020(1,2) + 0.5, arr_2020(1,2) + 0.5, arr_2020(1,2) - 0.5];
    patch(y_2020,x_2020,c_1,'EdgeColor','none');

    patches(arr_1980, c_5)
    patches(arr_1990, c_4)
    patches(arr_2000, c_3)
    patches(arr_2010, c_2)
    patches(arr_2020, c_1)

    set(gca, 'YDir','reverse')
    set(gcf, 'Position',  [100, 100, 630, 600])
    set(gca,'TickLabelInterpreter','latex','FontSize',11)
    title_string = '\textbf{' + title_string + '}';
    title(title_string, 'Interpreter', 'latex')
    xlabel('Horizontal Position','Interpreter', 'latex')
    ylabel('Vertical Position','Interpreter', 'latex')

    legend('1980', '1990','2000','2010','2020');

    hold off

    function patches(array, color)
        for i = 2:length(array)
        x_length = 1; y_length = 1;
        x = [array(i,1) - x_length/2, array(i,1) - x_length/2, array(i,1) + x_length/2, array(i,1) + x_length/2];
        y = [array(i,2) - y_length/2, array(i,2) + y_length/2, array(i,2) + y_length/2, array(i,2) - y_length/2];

        patch(y,x,color,'EdgeColor','none');
        end
    end
end