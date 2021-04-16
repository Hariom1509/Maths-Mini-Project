function x=linearSolve(A,b)
 
    [nRow,nCol]=size(A);
    if nRow ~= nCol
        error 'Matrix A must be square'
    end
     
    if length(b) ~= nRow
       error 'b length does not match A matrix dimension'       
    end
     
    b=b(:);
     
    [L,U,P] = LU(A,0);
    y       = forwardSub(L,P*b);
    x       = backSub(U,y);
        
end
