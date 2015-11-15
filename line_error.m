function [ e ] = line_error(x,y, m, b)
% Error function for a line fit. Minimizing this gives the trajectory line
e = sum(abs((m*x+b-y)))/(m*m+1); %Used abs here instead of square. IDK why.
end