function [vertices,edges] = Create_ER_NetWork(N,S,p)
%此函数用于创建Erdos-Renyi网络，我们假设初始时只连接至邻居节点，有p的概率连接非邻居节点

%参数解释：
%1.N:复杂网络结点的数量
%2.S:平均每个节点的度.
%3.p:连接非邻居节点的概率.

    bar=waitbar(0,'1','name','创建复杂网络');
    string=sprintf('复杂网络开始创建对角矩阵');
    waitbar(0,bar,string);
    vertices=1:N;
    edges=sparse(N,N);

    %我们在开始处理时便将其作为上三角处理
    S=abs(S)/2;decimal_S=S-fix(S);
    S=fix(S);S=(S<1)+S;

    %'decimal_vector' 是为了保证设置的S不被改变
    decimal_vector=(rand(1,length(diag(edges,1)))<decimal_S);
    edges=sparse(edges+diag(decimal_vector,1));

    %我们认为1到N是一个循环,所以N+1至2N与1至N等价.
    for i=2:S+1
        within_section=diag(ones(1,length(diag(edges,i))),i);
        crossing_section=diag(ones(1,length(diag(edges,N-i))),N-i);
        edges=sparse(edges+within_section+crossing_section);
    end

    %设置连接外部的节点
    [vertice1,vertice2]=find(edges);
    out=(rand(1,length(vertice1))<p);
    edges(vertice1(out),vertice2(out))=0;
    num_out=sum(out);
    out_pairs=[vertice1(out),vertice2(out)];


    for i =1:num_out
        bili=i/num_out;
        string=sprintf('复杂网络已创建%.2f%',100*bili);
        waitbar(bili,bar,[string '%']);
        %随机决定起点或终点的一个作为新边的端点
        index=(rand>0.5)+1;
        out_edge_from=out_pairs(i,index);

        %重新连接被断开的边
        adj=[out_edge_from;find(edges(:,out_edge_from));...
            find(edges(out_edge_from,:))'];
        non_adj=setdiff(vertices,adj);
        out_edge_to=non_adj(ceil(rand*length(non_adj)));

        %确保为上三角矩阵
        out_edge=sort([out_edge_from,out_edge_to]);
        edges(out_edge(1),out_edge(2))=1;
    end
    close(bar);
end
