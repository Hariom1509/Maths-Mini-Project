function [L,U,P]=LU(A,threshold)
     
    [nRow,nCol]=size(A);
    if nRow ~= nCol
        error 'Matrix must be square'
    end
 
   
    function flipRows()        
        [c,I]=max(abs(A(n:end,n)));
        I=I+(n-1);
        tmp=A(n,:);
        A(n,:)=A(I,:);
        A(I,:)=tmp;
         
        %make sure we also flip the L matrix rows to keep in sync
        tmp=L(n,:);
        L(n,:)=L(I,:);
        L(I,:)=tmp;
         
        %now make the elementary matrix for this move
        E(n,:)=0;
        E(n,I)=1;
        E(I,:)=0;
        E(I,n)=1;        
    end
 
    P=diag(ones(nRow,1));
    U=zeros(nRow);
    L=zeros(nRow);
 
    for n=1:nRow-1
        currentPivot=A(n,n);
         
        E=diag(ones(nRow,1));
         
        maxPivot=max(A(n+1:end,n));
        if abs(currentPivot)<eps  %zero, do row exchage always
           if abs(maxPivot)<eps  % not possible to exchange
              error 'unable to complete LU decomposition, A is an ill-matrix'
           else
              flipRows();        
           end
        else %not a zero pivot, but still can exchange, check threshold
          if abs(currentPivot)<abs(maxPivot)
             if abs(currentPivot-maxPivot)>=threshold
                flipRows();                      
             end
          end
        end
         
        P=P*E;  %update the perumtation matrix        
         
        for i=n+1:nRow
            L(i,n)=A(i,n)/A(n,n);
            A(i,n)=0;
            for j=n+1:nRow
                A(i,j)=A(i,j)-L(i,n)*A(n,j);
            end
        end      
    end
    
    L=L+diag(ones(nRow,1));    
    P=P';
    U=A;  % that is all         
end
