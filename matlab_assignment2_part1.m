% Matlab Assignment 2

% Part I: Dynamical Systems - Fish Population in a Lake System

%Question 2
A=[0.7      0      0    0.2    0.1
   0.1    0.5      0    0.2    0.1
     0    0.2    0.8      0      0
   0.1    0.2    0.2    0.6    0.1
     0    0.1    0.1      0    0.9];

 x0 = [200
     0
     0
     100
     0]
 %Made a loop to make a matrix for the population of each week from 0 to 20
 %weeks
for i=1:20
    X(:,i) = (A^i)*x0;
end
 
X1 = horzcat(x0,X)
%Concatonated x0 with X 

Y = (0:20)
X2 = sum(X1)
%Plotting the populations of each lake against eachother
% plot(Y,X1(1,:),'-')
% hold on
% 
% plot(Y,X1(2,:),':')
% hold on
% 
% plot(Y,X1(3,:),'-.')
% hold on
% 
% plot(Y,X1(4,:),'--')
% hold on
% 
% plot(Y,X1(5,:),'.')
% hold on
% 
% plot(Y,X2,'+');

%Question 3
%Calculate eigenvalues and eigenvectors of A
[V,D]=eig(A)

%Augment V and x0,and reduce
Vaug = [V,x0]
rref(Vaug)

%Calculate x(20) using closed form
-77.33*(.5424^20)*(V(:,1))+77.84*(1.039^20)*(V(:,2))+294.43*(.7187^20)*(V(:,3))-180*(.8^20)*(V(:,4))+97.53*(.4^20)*(V(:,5))

%Plot x-3 vs x-4

x3 = X1(3,:)
x4 = X1(4,:)

plot(x3,x4)
hold on
%plot dominant vector


% v4 = V(:,4)
% 
% for i = 1:50
%    Z(1,:) = v4*i
% end
% 
% Y2 = (:49)
% plot(Y,Z)
