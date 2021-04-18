clc;
clear;
format long;
A = [ 40+3i -10 -30; -10 30 -5; -30 -5 65 ];
B = [10; 0 ; 0];

MAX_LIMIT_ITERATIONS = 5000; % Make Note, if there are problems taking more number of iterations then we can increase limit for those
tolerance_Required = 0.0001;

tempValues(length(A),MAX_LIMIT_ITERATIONS) = 0;
tolerance(length(A),MAX_LIMIT_ITERATIONS) = 0;
%disp(tempValues)

last_column = 0;

for times = 1:MAX_LIMIT_ITERATIONS
    flag = 0;
    last_column = times;
    for i  = 1:length(A)
        tsum = 0;
        for j = 1:length(A)
            if(i~=j)
                
                tsum = tsum + A(i,j)*tempValues(j,times);
            end
        end
        tempValues(i,times+1) = (B(i)-tsum)/A(i,i);
        
        
        absoluteError = abs(tempValues(i,times) - tempValues(i,times+1));
        tolerance(i,times) = absoluteError;
        
    end
    maxtol = max(tolerance(1:length(A),times));
    if(maxtol <= tolerance_Required)
        flag = 1;
        break;
    end
    
    if(flag == 1)
        break;
    end
end
fprintf('Tolerance at each Iterations ( %d) : ',last_column);
disp(tolerance(1:length(A),last_column));
disp(' Final Calculated Answers: ');
disp(tempValues(1:length(A),last_column));
disp(' Correct Answer ( inv(A) * B ): ');
disp(A\B);