%Convert information from image into MATLAB array 
%Each map is 29 rows by 41 columns

%new = input('start new map? > ', 's');
%if strcmp(new, 'y')
%    map = zeros(29,41);
%end
map = ploughing_demo;
row_num = 1;
row_type = 'e';

while strcmp(row_type, 'q') == 0 %Input q to exit and stop entering types
    disp(' ')
    str = ['Current row number is: ', num2str(row_num)]; disp(str)
    row_type = input('Input row type or index of first color > ', 's'); %empty, split
    
    if strcmp(row_type, 'e') %an empty row/skip a row
        %No action is needed since all rows are already zeros
    elseif strcmp(row_type, 'b') %go back a row
        row_num = row_num - 2;
    elseif strcmp(row_type, 'j') %jump to a specific row number
        row_num_input = input('Enter row number destination > ');
        row_num = row_num_input - 1;
    elseif strcmp(row_type, 'o') %overwrite row with zeros
        for col_ind = 1:41
            map(row_num,col_ind) = 0;
        end
    elseif strcmp(row_type, 's') %Split row - loops until 0 is entered
        start_ind = input('Enter index of first color or 0 to go to next row > ');
        while start_ind ~= 0 
            middle = cell2mat(transpose(split(input('Enter array of values > ', 's'), ' ')));
            middle_ind = 1;

            for col_ind = (start_ind:start_ind+length(middle)-1)
                map(row_num, col_ind) = middle(middle_ind) - 48;
                middle_ind = middle_ind + 1;
            end
            start_ind = input('Enter index of first color or 0 to go to next row > ');
        end
    elseif strcmp(row_type, 'h') %help
        disp('Options:')
        disp("Enter 'e' if a row is empty")
        disp("Enter 'b' to go back one row")
        disp("Enter 'j' to jump to a specific row number")
        disp("Enter 'o' to overwrite a row with zeros")
        disp("Enter 's' for a split row - if a row has a large section of empty squares, pick this option")
        disp("Otherwise, a 'normal' row is selected")
        disp("Enter 'q' to quit the program")
        disp(' ')
        disp("How to enter arrays:")
        disp("When prompted, enter the 'index', aka the column value, of the first color value.")
        disp("Simply type in the color characters that you see, or 0 if the square is white. Each value should be separated with a space. ")
        disp("For example, if a row starts with one yellow square, is followed by three white squares, and then one pink square, you would type in 'y 0 0 0 p'")
        disp("'Split' rows are for rows with large sections of white squares in between colored sections. For example, a row might have one yellow square, 16 white squares, and then one pink square.")
        disp("If you select a 's' row type, you can avoid typing sixteen zeros! You will instead type in the column number of the yellow square, the 'y' character, the column of the pink square, and then the 'p' character.")
        disp(' ')
        disp("Color characters:")
        disp("Yellow/1980: 'y', Orange/1990: 'o', Pink/2000: 'p', Light purple/2010: 'l', Dark purple/2020: 'd'")
        row_num = row_num - 1;
    elseif strcmp(row_type, 'q') == 0 %Normal entering row, no loop
        start_ind = str2double(row_type);
        middle = cell2mat(transpose(split(input('Enter array of values > ', 's'), ' ')));
        middle_ind = 1;
        
        for col_ind = (start_ind:start_ind+length(middle)-1)
            map(row_num, col_ind) = middle(middle_ind) - 48;
            middle_ind = middle_ind + 1;
        end
    end
    row_num = row_num + 1; 
end

ploughing_demo = map;