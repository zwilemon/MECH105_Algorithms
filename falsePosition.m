function [root,fx,ea,iter] = falsePosition(func,xl,xu,es,maxiter)
%falsePosition has the purpose of finding the root of a function within
%specified brackets.
%   Zachary Wilemon
%   2/28/19
%   INPUTS
%   func is the function being evaluated
%   xl is the lower bracket
%   xu is the upper bracket
%   es is the desired relative error
%   maxiter is the max iterations
%   OUTPUTS
%   root is the root found
%   fx is the function where the root was evaluated
%   ea is the approximate relative error (%)
%   iter is the number of iterations done
format long
iter = 0;
ea = 100;

%% Checking inputs

if isempty(func) || isempty(xl) || isempty(xu)
    error('Three inputs required.');
end

if nargin == 3
    es = 0.0001;
    maxiter = 200;
end

if nargin == 4
    maxiter = 200;
end

if (func(xl))*(func(xu))>0
    error('No root possible within given brackets');
end

%% Evaluating for the root

while iter < maxiter && ea > es
    root = xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)));
    
    if (func(root)*func(xu))>0
        ea = abs(((root-xu)/root)*100);
        xu = root;
    else
        ea = abs(((root-xl)/root)*100);
        xl = root;
    end
    iter = iter+1;
    
end

fx = func(root);

%% Displaying answers

fprintf('\nThe root plugged into the function is %3.4d', fx);
fprintf('\nThe relative percent error is %3.4d', ea);
fprintf('\nThe number of iterations done to find the root was %3.0f', iter);
fprintf('\nThe root is as follows...');
end