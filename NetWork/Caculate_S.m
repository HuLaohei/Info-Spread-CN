function [S] =Caculate_S(edges)
%我们利用此函数计算每个节点的度

%参数解释：
%1.edges：边集合。

    [from,~,~]=find(edges);
    S=tabulate(from);
    S=fix(S(:,2));
end