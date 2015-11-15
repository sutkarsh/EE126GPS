H = x_hats(); %Calculating all the individual MLE estimates
x = H(:,1);
y = H(:,2);
line_vector = fminsearch(@(v)(line_error(x,y,v(1),v(2))),[-3,-10]);
m = line_vector(1);
b = line_vector(2);
scatter(x,y);
hold on;
plot(x, m*x+b);
x0_est = X(1);
new_est = fminsearch(@(v)vel_err(v, m, b, x, y), [x(1), 0.001]);
new_x = [1:100]'* new_est(2) + new_est(1);
new_y = new_x*m + b;
plot(new_x, new_y, 'r.');
[new_x(1), new_y(1)] % Actual Coordinates for the treasure are: 37.8754 -122.2566