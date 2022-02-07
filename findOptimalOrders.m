function [all_optimalOrders, Min, all_lengthDSs, numberOfOptimalNodes ]=findOptimalOrders(Mat)
% all_optimalOrders: set of the optimal order that makes the minimal number of preference reversals resolve all of the intransitivities
% Min: the minimal number of preference reversals (singular)
% all_lengthDSs: the lengths of preference reversals in each optimal order(plural) 
% numberOfOptimalNodes: the number of optimal orders(singular)
numberNode=size(Mat,1);
nodes = numberNode:-1:1;
P = perms(nodes);

subj_numberOfDownstream=[] ;
subj_new_node_order=nan(size(P,1),numberNode);
for perm_num=1:size(P,1)
new_node_order= P(perm_num,:);
shuffled_Mat=Mat(new_node_order,new_node_order);
subj_numberOfDownstream=[subj_numberOfDownstream sum(sum(tril(shuffled_Mat,-1)>0))];
subj_new_node_order(perm_num,:)=new_node_order;
end
[Min, ~]=min(subj_numberOfDownstream);
numberOfOptimalNodes=sum(subj_numberOfDownstream==Min);
all_optimalOrders=subj_new_node_order(subj_numberOfDownstream==Min,:);
if Min==0
temp=nan(size(all_optimalOrders,1),1);
else
temp=nan(size(all_optimalOrders,1),Min);
end

for numOpt=1:numberOfOptimalNodes
[row, col]=find(tril(Mat(all_optimalOrders(numOpt,:),all_optimalOrders(numOpt,:)),-1)>0);
if ~isempty(row)
temp(numOpt,:)=(abs(row-col)+1)';
else
   temp(numOpt,:)=0;
end
end
all_lengthDSs=temp;