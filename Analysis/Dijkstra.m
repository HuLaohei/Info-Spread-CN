function [L] = Dijkstra(vertices,edges,i,f,MAX_INT)
%实现了经典的Dijkstra算法并加以改进

%参数解释：
%1.vertices，edges：节点集合与边集合。
%2.i：起始的节点
%3.f：用于计算权重的函数
%4.MAX_INT：算法的需求，理论上的最大值

%结果解释：
%1.L：从初始节点至其余节点的最小权重

    L=ones(length(vertices),1)*MAX_INT;L(i)=0;
    
    %state用于记录此节点是否为已计算节点，全部被计算则算法结束
    state=false(length(vertices),1); k=i;
    while(~prod(state))
        state(k)=true;
        edges_to=find(edges(k,:));
        
        %更新权重
        L(edges_to)=min(L(edges_to),L(k)+f(k,edges_to)');
        
        %选取目前权重最小并且未被计算的一个节点
        k_set=vertices(~state);
        index_k=find(min(L(k_set))==L(k_set),1,'first');
        k=k_set(index_k);
    end
end