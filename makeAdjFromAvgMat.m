function B = makeAdjFromAvgMat(A)
% make 0.5 a number other than 0.5
if find(A==0.5)
   error('Error. majority rule needs average other than 0.5');
end

    node_length=size(A,1);
	temp=triu(A,1)>0.5;
    B=temp+tril((temp'-1)*-1,-1);
end