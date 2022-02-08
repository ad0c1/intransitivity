
function [gen_nodes, Min]=Generator(M)
% M: adjacent matrix of individual choices
% gen_dones: all possible combinations of tricksters
% Min: the number of tricksters
nNode=size(M,1);
V=nNode:-1:1;
P=perms(V);
V=1:nNode;
subj_numberOfGenerator=[] ;
subj_whereGenerator=nan(size(P,1),nNode);
subj_new_node_order=nan(size(P,1),nNode);
for perm_num=1:size(P,1)
new_node_order= P(perm_num,:);
shuffled_Mat=M(new_node_order,new_node_order);
subj_numberOfGenerator=[subj_numberOfGenerator sum(sum(tril(shuffled_Mat,-1)>0)>0)];
subj_new_node_order(perm_num,:)=new_node_order;
subj_whereGenerator(perm_num,:)=sum(tril(shuffled_Mat,-1)>0)>0;
end

Min=min(subj_numberOfGenerator);
all_OrdersWithGenerators=subj_new_node_order(subj_numberOfGenerator==Min,:);
all_Generators=subj_whereGenerator(subj_numberOfGenerator==Min,:);
Generators=all_OrdersWithGenerators.*all_Generators;
temp_generator=Generators';
temp_generator=temp_generator(temp_generator~=0);
Generators=reshape(temp_generator',[Min size(Generators,1)]);
Generators=Generators';
B = unique(Generators,'rows');
gen_nodes = unique(sort(B,2),'rows');
if isempty(Min)
Min=0;
gen_nodes=[];
end
