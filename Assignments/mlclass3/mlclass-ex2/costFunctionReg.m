function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

z= X*theta;
h = ones(size(z))./(1+exp(-z));
Je = (log(h')*(-y)-((log(1-h'))*(1-y)))/m;
J = Je + ((lambda/(2*m))*sum(theta(2:end).^2));


grad = ((X(:,2:end)'*(h-y))/m)+(lambda/m)*theta(2:end);

grad1 = ((X(:,1)'*(h-y))/m);

grad = [grad1 ; grad];
% =============================================================

end
