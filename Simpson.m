function I = Simpson(x,y)
%% Intro of Code
% Zachary Wilemon 831794762
% MECH 105 : Simpson's 1/3 Rule Algorithm
% 4/15/19
% The purpose of this code is to solve an integral by using the Simpson's
% 1/3 rule (and trapezoidal rule if necessary)

%% Variables
% x and y are input arrays 
% I is the resulting integral
% simpArray is the variable used to determine if trap rule needs to be used
% work is used as a holder to tell the function to use trap rule
% simpcalc is the calculations done by the simpsons rule

%% Code
% The following determines if the given inputs are correctly done, if not
% it tells the user what to fix
if nargin > 2
    error('Must input x and y')
elseif size(y) ~= size(x)
    error('The lengths of the intervals being used must be equal')
elseif isequal(diff(x),circshift(diff(x),1)) ~= 1
    error('x must be equally spaced')
end

% The following determines if the trapezoidal rule will be used and tells
% the user if it is
if floor(length(x)/2) == length(x)/2
   work = 0;
   warning('The trapezoidal is going to be used to calculate the last interval')
else
    work = 1;
end

if work == 1

    % Calculate the integral with only simpson's method
    for iteration = 1 : length(x)/2
        simpArray = [1 2 3];
        simpArray = simpArray+2*(iteration-1);
        simpcalc(iteration) = 1/6*(x(simpArray(3))-x(simpArray(1)))*(y(simpArray(2))+4*y(simpArray(2))+y(simpArray(3)));
    end
    
else
    % Calculates all of the intervals except the last with simpson's method
    for iteration = 1 : floor(length(x)/2)-1
        simpArray = [1 2 3];
        simpArray = simpArray+2*(iteration-1);
        simpcalc(iteration) = 1/6*(x(simpArray(3))-x(simpArray(1)))*(y(simpArray(2))+4*y(simpArray(2))+y(simpArray(3)));
    end
    
    % Calculates the rest of the integral (the last interval) with trap rule
    simpcalc(iteration+1) = (x(length(x))-x(length(x)-1))*(y(length(y))+y(length(y)-1))/2;

end

I = sum(simpcalc);

if work == 1
    fprintf('The integral using Simpsons method is %3.4f',I)

else
    fprintf('The integral using Simpsons method and the trapezoidal rule is %3.4f',I)
end

end

