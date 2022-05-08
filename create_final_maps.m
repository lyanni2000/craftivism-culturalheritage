conflict_factors = master_map(88:116,:);
agricultural_factors = master_map(30:58,:); 

industrial_factors = zeros(29,41);

for col_ind = (1:41)  
     for row_ind = (1:29)
        if master_map(row_ind,col_ind) == 73 || master_map(58+row_ind,col_ind) == 73 || master_map(116+row_ind,col_ind) == 73 || master_map(145+row_ind,col_ind) == 73
            industrial_factors(row_ind,col_ind) = 73;
        elseif master_map(row_ind,col_ind) == 63 || master_map(58+row_ind,col_ind) == 63 || master_map(116+row_ind,col_ind) == 63 || master_map(145+row_ind,col_ind) == 63
            industrial_factors(row_ind,col_ind) = 63;
        elseif master_map(row_ind,col_ind) == 64 || master_map(58+row_ind,col_ind) == 64 || master_map(116+row_ind,col_ind) == 64 || master_map(145+row_ind,col_ind) == 64
            industrial_factors(row_ind,col_ind) = 64;
        elseif master_map(row_ind,col_ind) == 60 || master_map(58+row_ind,col_ind) == 60 || master_map(116+row_ind,col_ind) == 60 || master_map(145+row_ind,col_ind) == 60
            industrial_factors(row_ind,col_ind) = 60;
        elseif master_map(row_ind,col_ind) == 52 || master_map(58+row_ind,col_ind) == 52 || master_map(116+row_ind,col_ind) == 52 || master_map(145+row_ind,col_ind) == 52
            industrial_factors(row_ind,col_ind) = 52;
        end
    end
end
