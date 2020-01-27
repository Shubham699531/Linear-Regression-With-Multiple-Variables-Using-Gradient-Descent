% Loading the dataset
dataSet = load('TestDataSet.txt');

% Storing the values in seperate vectors 
m = length(dataSet);
n=size(dataSet,2)-1;

X = dataSet(:, 1);
y = dataSet(:, 2);
X=[ones(m,1),X(:,1)];

theta=zeros(n+1,1);
k=costFunction(X,y,theta);
plot(X(:,2),y,'rx');
xlim([0 20]);
ylim([0 20]);
xlabel('training data');
ylabel('actual output');

