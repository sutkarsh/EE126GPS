function [ e ] = vel_err(p,m,b,x,y)
%   Error function that takes into account constant velocity; Minimizing
%   this gives the best estimate for x0,y0, and the velocity of the theif.

%   p contains: starting position x and gap (for velocity)
%   m, b: parameters for eq. of the line: y = mx + b
%   x,y: coordinate vectors of all the MLE estimates
start_x = p(1);
gap = p(2);
new_x = [1:100]'* gap + start_x;
new_y = new_x*m+b;
e = sum((new_x-x).^2 + (new_y-y).^2);
end

