function k = costFunction(X,y,theta)
m=size(X,1);
predictions=X*theta;
plot(X(:,2:size(X,2)),predictions,'--r');
hold on;%Dim of X=[m,n+1] Dim of theta=[n+1,1]
k=(1/(2*m))*sum((predictions-y).^2);
end

