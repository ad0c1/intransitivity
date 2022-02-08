function AllTransitiveOrder = getAllTransitiveOffspring(A)
% A: adjacent matrix of individual choices
% AllTransitiveOrder: all possible arrays of transitive offspring
[gen_nodes, Min]=Generator(A);
AllTransitiveOrder={};
if ~isempty(gen_nodes)

     for i=1:size(gen_nodes,1)
           TransitiveOrder = getTransitiveOrder(A,gen_nodes(i,:));
           AllTransitiveOrder{i}=TransitiveOrder;
     end

else
    [all_optimalOrders]=findOptimalOrders(A);
    AllTransitiveOrder{1}=all_optimalOrders;
end
