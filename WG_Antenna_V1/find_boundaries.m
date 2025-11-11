function [x_min_bc, y_min_bc, y_max_bc, x_max_bc] = find_boundaries(N_n, x_nodes, y_nodes)
x_min_bc = x_nodes(1);
x_max_bc = x_nodes(1);
y_min_bc = y_nodes(1);
y_max_bc = y_nodes(1);

for i=1:N_n
    if(x_min_bc > x_nodes(i))
        x_min_bc = x_nodes(i);
    end
    if(x_max_bc < x_nodes(i))
        x_max_bc = x_nodes(i);
    end
    if(y_min_bc>y_nodes(i))
        y_min_bc = y_nodes(i);
    end
    if(y_max_bc < y_nodes(i))
        y_max_bc = y_nodes(i);
    end
end

return;