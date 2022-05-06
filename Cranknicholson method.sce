//Crank Nicolson
clc;clear;clf;
a = input("starting value of x = ")
b = input("starting value of x = ")
n = input("number of steps = ")
h = (b-a)/n
A(1:n+1,1:n+1) = 0
A = 1*eye(A)
for i = 2:1:n
    A(i,i) = -1
    A(i,i+1) = 4
    if (i+2) <= n+1 then
        A(i,i+2) = -1
    end 
end
disp("Coefficient matrix is : ")
disp(A)
for j = 1:1:n+1
        u(1,j) = input("The value of u(t=0,"+string(j)+") is = ")
    end
for m = 1:1:n+1
    u(:,1) = 0
    u(:,n+1) = 0
    for k = 2:1:n
        B(k,1) = u(m,k-1) + u(m,k+1)
    end
    B(n+1,1) = 0
    B(1,1) = 0
    Y(1,:) = u(1,:)
    Y(m+1,:) = A\B
    u(m+1,:) = Y(m+1,:)
end
disp("Solution Matrix is : ")
disp(Y)
