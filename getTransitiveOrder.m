function TransitiveOrder = getTransitiveOrder(A,excluded_nodes)
label_array=1:length(A);
label_array(excluded_nodes)=[];
A(excluded_nodes,:)=[];
A(:,excluded_nodes)=[];
[all_optimalOrders]=findOptimalOrders(A);
TransitiveOrder=label_array(all_optimalOrders);
end
