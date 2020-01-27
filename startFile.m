% Data coming in maybe of any dimensions

dataSet = load('testDataSet.txt');

% So, first we need to extract dimensions after loading

rows_dim=size(dataSet,1); %number of training examples=m
cols_dim=size(dataSet,2);  %number of features


X=dataSet(:,1:cols_dim-1); %extracting design matrix, Dim=[m,n]
y=dataSet(:,cols_dim); %extracting outputs, Dim=[m,1]

X=[ones(rows_dim,1), X(:,1:cols_dim-1)]; % adding ones to left side of design matrix, Dim[m,n+1]

max_value_per_column=zeros(size(X,2),1);
min_value_per_column=zeros(size(X,2),1);
range_per_column=zeros(size(X,2),1);
mean_per_column=zeros(size(X,2),1);
max(X)
for c=1:cols_dim
max_value_per_column(c,1)=max(X(:,c));
min_value_per_column(c,1)=min(X(:,c));
range_per_column(c,1)=max_value_per_column(c,1)-min_value_per_column(c,1);
mean_per_column(c,1)=(sum(X(:,c)))/rows_dim;
end

max_value_per_column
min_value_per_column
range_per_column
mean_per_column
subplot(2,1,1)
plot(X(:,2:size(X,2)),y,'bx');
xlim([0 15]);
ylim([0 16]);
xlabel('training data');
ylabel('actual output');
hold on;
iterations=100;

% theta=zeros(cols_dim,1);
theta=[1;2];
k=costFunction(X,y,theta);
[l,n]=gradientDescent(X,y,theta,100,0.02);
subplot(2,1,2)
plot(1:iterations,n,'-b');
l;
n;

