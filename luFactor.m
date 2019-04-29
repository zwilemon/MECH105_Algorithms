function [L,U,P] = luFactor(A)
%% Intro of Code
% Zachary Wilemon
% MECH 105: luFactor algorithm
% 3/31/19
% The purpose of the luFactor function is to do the LU factorization of a
% square matrix while keeping track of partial pivoting.

%% Variables and Descriptions
%L is the lower triangular matrix
%U is the upper triangular matrix
%P is the pivot matrix used to keep track of pivoting
%A is the inputted square matrix

%% Code

% Displays an error message if the matrix being used is not a square matrix
[m,n] = size(A);
if m ~= n
    error('Matrix being used is not a square matrix.')
end

% Makes the identity matrix to be used for P to keep track of pivoting
P = eye(n);

% Starts the code off by stating that A and P have yet to change, so they
% are asigned as the base U and L
U = A;
L = P;

% This part of the code determines if/where there needs to be pivoting in
% order to continue with the decomposition
for W = 1:n
    [supercalafragilistic Z] = max(abs(U(W:n,W)));
    Z = Z+W-1;
    %Does the pivoting action
    if Z ~= W
        expialidocious = U(W,:);
        U(W,:) = U(Z,:);
        U(Z,:) = expialidocious;
        % Keeps track of the pivot
        expialidocious = P(W,:);
        P(W,:) = P(Z,:);
        P(Z,:) = expialidocious;
        % Changes L matrix to match with the pivots
        if W >= 2
            expialidocious = L(W,1:W-1);
            L(W,1:W-1) = L(Z,1:W-1);
        end
    end
    % Creates L and U matrices
    for Y = W+1:n
        L(Y,W) = U(Y,W)/U(W,W);
        U(Y,:) = U(Y,:)-L(Y,W)*U(W,:);
    end
end

%These are here so that the answers are displayed at the end
U
P
L
fprintf('L = ')
end

