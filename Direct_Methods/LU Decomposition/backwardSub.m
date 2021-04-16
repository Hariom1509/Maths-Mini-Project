function x=backSub(U,v)
 
    [nRow,nCol]=size(v);
    if nRow>1 & nCol>1
        error 'v must be a vector not a matrix'
    end
     
    [nRow,nCol]=size(U);
    if nRow ~= nCol
        error 'Matrix U must be square'
    end
 
    if length(v) ~= nRow
       error 'v length does not match U matrix dimension'       
    end
     
    x=zeros(nRow,1);
    x(nRow)=v(nRow)/U(nRow,nRow);
     
    v=v(:);
     
    for n=(nRow-1):-1:1
        x(n)=(v(n)-(U(n,n+1:end)*x(n+1:end))) / U(n,n);
    end
    
end
