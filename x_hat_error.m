function [e] = x_hat_error(v, D)
% Returns the error of a position vector v from the MLE position.
% Argmin of this function corresponds to the MLE position
S = [[37.7,-122.3]; [37.9,-122.15]; [37.83,-122.15]; [37.91, -122.4]; [37.9, -122.21]]; %satellite coordinates
x = v'*[1 1 1 1 1]; % replicate v
W = (S' - x).^2; 
d = ([1 1]*W).^0.5; %Distances to satellites
n = d-D; % Ni = Di - di
e = n*n'; % ideally should have taken the square root, but it doesn't change anything
end