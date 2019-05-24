function [C] = Caculate_C(edges,S)
%我们利用以下公式计算聚类程度C
%C_i=sum(A_im*A_in*A_mn)/(k_i*(k_i-1));
%C=sum(C_i)/N;
%k_i时节点i的度，N是C_i的长度 

%参数解释：
%1.edges：边集合。
%2.S：每个节点的度。

%我们首先将三元组分为三个节点，首先遍历第一节点，得到第二节点，再对第二节点遍历
%取第二节点遍历与第一节点遍历的交集，并将数量加至存储变量即可，这样可以大大节省时间
    C=zeros(length(edges),1);
    for i=1:length(edges)
        edges_mid=find(edges(i,:));
        for j=1:nnz(edges_mid)
            edges_to=find(edges(edges_mid(j),:));
            avil_edges_to=intersect(edges_to,edges_mid);
            C(i)=C(i)+length(avil_edges_to);
        end
    end
    C=C./(S.*(S-1));
    C(isnan(C))=0;
    C=sum(C)/length(C);
end