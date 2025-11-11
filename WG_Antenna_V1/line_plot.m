function line_plot(x_1, y_1, x_2, y_2, line_color, line_width)
x(1) = x_1;
x(2) = x_2;
y(1) = y_1;
y(2) = y_2;
plot(x,y,'Color',line_color,'LineWidth',line_width);