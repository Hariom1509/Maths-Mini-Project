function y=forwardSub(L,w)
 
    [nRow,nCol]=size(L);
    if nRow ~= nCol
        error 'Matrix L must be square'
    end      
     
    if length(w) ~= nRow
        error 'w length does not match L matrix dimension'       
    end
 
    y=zeros(nRow,1);
    y(1)=w(1)/L(1,1);
     
    w=w(:);
     
    for n=2:nRow
        y(n)=( w(n) - L(n,1:n-1)*y(1:n-1) ) / L(n,n);
    end
    
end
