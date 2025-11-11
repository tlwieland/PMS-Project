% Plot Geometry

for i=1:N_b % Loop over Boundary Line Elements
    n_s=b_edge(i,1);
    n_t=b_edge(i,2);
    x_1 = x(n_s); x_2 = x(n_t);
    y_1 = y(n_s); y_2 = y(n_t);
    line_plot(x_1, y_1, x_2, y_2, 'k', 4); % 
end