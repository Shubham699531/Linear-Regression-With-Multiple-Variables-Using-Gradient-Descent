function [k,cost_history]= gradientDescent(X,y,theta,iterations,alpha)
%     theta(0)=theta(0)-alpha*error*x0
%     theta(1)=theta(1)-alpha*error*x1;
%     theta[n+1,1]=theta[n+1,1]-alpha*(X[m,n+1]*theta[n+1,1])'*X(:,1))
% alpha=0.01;
cost_historyg= zeros(iterations,1);
temp=zeros(size(theta,1),1);
for j=1:iterations
    for i=1:size(X,2)
        temp(i,1)=theta(i,1)-(alpha/size(X,1))*(X*theta-y)'*X(:,i);
    end
    theta=temp;
    cost_historyg(j,1)=costFunction(X,y,theta);
end
cost_history=cost_historyg;
k=theta;
end