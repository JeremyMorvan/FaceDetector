function [C,e] = wcov(R,w)
% [C,e]  = wcov(R,w);
%    produces a weighted covariance matrix using a specified half-life
%    also produces standard deviations, correlations and expected values
%    variables:
%          R: n*HW matrix of s observations (states) on n variables
%          w: n*1weigth vector
%          C: HW*HW covariance matrix 
%          e: HW*1 vector of expected returns   

%  copyright 2014, Jérémy Morvan
%  this version Apr. 28, 2014

    % get dimensions
        s = size(R,1);

    % compute expected values
        e = w'*R;

    % compute matrix of deviations
        d = R - ones(s,1)*e;

    % compute weighted covariances
        C = d'*diag(w)*d;
    

        