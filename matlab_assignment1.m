%%% Math 547 - Matlab Assignment #1

% Will Flowers


% Part I: Fundamentals of Vector Projections onto Subspaces of R^n

v1=[1 5 7 9]';  v2=[2 1 4 0]';  v3=[1 -1 -1 2]'; % The 3 column vectors v1, v2, v3

% Question 1 
B=[v1,v2,v3]
C = rank(B)

% Since the rank of the matrix is 3, which is equal to "m" (4X3), the
% column vectors are linearly independent, thm 3.2.8

%Question 2 
D=norm(v1)
E=norm(v2)
F=norm(v3)
%Firstly, the length of all vectors in an orthonormal basis must be 1,
%which they aren't here.  Furthermore
G=dot(v1,v2)
H=dot(v1,v3)
I=dot(v2,v3)
%These vectors are not perpindicular to each other, or their dot product
%would equal 0, which it is not. 

%Question 3-Gram-Schmidt, use procedure learned in class to make an orthonormal basis.
u1 = (1/norm(v1))*(v1) %Making v1 a unit vector
J = norm(u1) %It is indeed a unit vector

v2perp = v2-(dot(u1,v2))*u1
u2 = (1/norm(v2perp))*v2perp
K = norm(u2) %It is indeed a unit vector

v3perp = v3-dot(u1,v3)*u1-dot(u2,v3)*u2
u3 = (1/norm(v3perp))*v3perp
L = norm(u3) %It is indeed a unit vector
 
%Check whether they are perpindicular to one another
M = dot(u1,u2)
N = dot(u1, u3)
O = dot(u2,u3)
%Since these are decimal approximations, this is good enough

%The Q-R Factorization
[Q,R]=qr(B,0)
P = [u1,u2,u3]

% Q and P are the same (Except for a few negatives, which you said to
% ignore, so this checks out


%Question 4 - P-Matrix
Pmatrix = P*P'
%According with thm 5.3.10, the p matrix is q*q', where q is the
%orthonormal matrix

%Question 5
b1=[1,2,3,4]'
b2=[0,3,-2,26]'

Tb1=Pmatrix*b1
Tb2=Pmatrix*b2

%Tb2 returns b2.  This is because b2 is redundant with the original vectors
%that we used to make the orthonormal basis
% Part II: Fitting a Parabola to the Height of a Projectile

%Question 6
%Time in seconds
v4 = [0.0125, 0.0250, 0.0375, 0.0625, 0.0875, 0.2625, 0.2875, 0.3125, 0.3250]'
%Height in cm
v5 = [17, 19.1, 21.2, 24.5, 27.3, 26.8, 24.6, 19.9, 17.6]'

%Question 7
%v4 squared
column1 = [0.000156,0.000625,0.00141,0.00391,0.00766,0.0689,0.0826,0.0977,0.1056]'
column2 = v4
column3 = [1,1,1,1,1,1,1,1,1]'

matrixA = [column1,column2,column3] %Make the matrix A
Aaug = [matrixA,v5]
Q = rref(Aaug)

%There is no solution here because the 4th row says 0 = 1, which is
%impossible
 
%Question 8,
% Since there is no solution to the equation, and vectors of matrix A are linearly independent, we can use thm. 5.4.6 to find
% x*, the unique least squares solution

xstar = (inv(((matrixA')*(matrixA))))*(matrixA')*(v5)

%Question 9-graph
 t = linspace(0,.5,1000);
 y = -.5*(585)*(t.^2)+201*(t)+14.4
 plot (t,y,'b-') 
 hold on
 plot(v4,v5,'r.')

%Something went wrong, can't tell what it was.  

%Part III: Fitting an Exponential Curve to Global Human Population Growth

population=[500 795 1265 1656 2516 5760 6477]';  %in millions of people, data from Population Reference Bureau
year=[1650 1750 1850 1900 1950 1995 2005]'; 

%Question 10

ystar = log(a) + r*t;

column4 = [1,1,1,1,1,1,1]'
column5 = year
matrixB = [column4,column5]

%Question 11
ystar = inv((matrixB')*(matrixB))*matrixB'*population
ystar1 = ystar'

%Question 12

t2 = linspace(1500,2020,520)
y2 = exp(exp(-10.3)) + exp(0.0015*t2)

plot(t2,y2, 'b-')
hold on
plot(year,population,'r.')

% Again something happened, and I can't tell what it is, but this equation
% is not a good model for the data

%Question 13 squared error

vector1 = exp(exp(-10.3)) + exp(0.0015*population)

squarederror = (population - vector1).^2

plot(squarederror, year,'g.');
