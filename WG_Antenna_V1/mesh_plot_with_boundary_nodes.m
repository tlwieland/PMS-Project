% Plot Mesh

for i=1:N_e
    line_plot(x(emt_nodes(i, 1)), y(emt_nodes(i, 1)), x(emt_nodes(i, 2)), y(emt_nodes(i, 2)), 'b', 1);
    line_plot(x(emt_nodes(i, 2)), y(emt_nodes(i, 2)), x(emt_nodes(i, 3)), y(emt_nodes(i, 3)), 'b', 1);
    line_plot(x(emt_nodes(i, 3)), y(emt_nodes(i, 3)), x(emt_nodes(i, 1)), y(emt_nodes(i, 1)), 'b', 1);
end

hold on;

for i=1:N_n
    if (b_node(i) == 1)
        plot(x(i), y(i), 'or');
    end
end

