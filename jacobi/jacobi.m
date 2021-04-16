clc;
close all;
A = [ 1 -1 0 0; 1 -2-4i 4i 1; 0 4i -3-4i 1; 0 1 1 -2+0.25j ];
b = [10; 0; 0; 0];
x=[0; 0; 0; 0];
 
n=size(x,1);
normVal=Inf; 

tol=1e-5; itr=0;

while normVal>tol
    xold=x;
 
    for i=1:n
        sigma=0;
 
        for j=1:n
 
            if j~=i
                sigma=sigma+A(i,j)*x(j);
            end
 
        end
 
        x(i)=(1/A(i,i))*(b(i)-sigma);
    end
 
    itr=itr+1;
    normVal=abs(xold-x);
end

fprintf('Solution of the system is : \n%f\n%f\n%f\n%f in %d iterations',x,itr);
