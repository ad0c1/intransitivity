function B = makeAdjFromAvgMat(A)
% input should be the adjacency matrix of the population ratio who made the choice for i over j in M(i,l)    
if find(A==0.5)
   error('Error. majority rule needs average other than 0.5');
end

    node_length=size(A,1);
	temp=triu(A,1)>0.5;
    B=temp+tril((temp'-1)*-1,-1);
end
