function [vertices,edges] = Create_SF_NetWork(N,S,m_0,type)
%此函数用于创建Scale-free网络及其变形，根据type不同：
%1.type=0：SF，利用BA算法。
%2.type=1：SF1，在上面基础上权重设为(0.1,0.9)的均匀分布。
%3.type=2：SF2，利用BBV算法。

%参数解释
%1.N:复杂网络节点数量。
%2.m_0:种子的大小。
%3.S:平均每个节点的度。
%需求，S<=m_0。
    
    bar=waitbar(0,'1','name','创建复杂网络');
    
    string=sprintf('复杂网络开始创建种子');
    waitbar(0,bar,string);
    %对于SF与SF1之间的区别
    function [weight] = Create_Weight()
        switch(type)
            case{0,2}
                weight=1;
            case{1}
                weight=rand()*0.8+0.1;
        end
    end
    vertices=1:N;
    edges=zeros(N);

    %初始创建为上三角矩阵.
    edges(1:m_0,1:m_0)=tril(ones(m_0))'-eye(m_0);
    edges=sparse(edges);

    %具有更大度的节点有更高的连接可能性，我们针对BA算法做出改进 ：
    %1.将节点的度乘上均匀随机数
    %2.取数最大的节点
    %此算法遵守以上原则并且创建时间短
    
    for i=m_0+1:N
        bili=(i-m_0-1)/(N-m_0);
        string=sprintf('复杂网络已创建%.2f%',100*bili);
        waitbar(bili,bar,[string '%']);
        S_i=0;
        while(S_i<S)
            %在未连接的节点中选取一个并连接
            adj=[i,find(edges(i,:))];
            non_adj=setdiff(vertices,adj);
            non_adj=non_adj(non_adj<i);

            %计算连接到其余节点的概率并选取数值最大的节点
            ans_edges=edges(non_adj,non_adj);
            [~,~,b]=find(sum(ans_edges,1)+sum(ans_edges,2)');
            p=b.*rand(size(b));
            edge_to=non_adj(find(max(p)==p,1));

            %确保矩阵为上三角矩阵
            edge=sort([i,edge_to]);
            edges(edge(1),edge(2))=Create_Weight();

            %更新节点的度
            [~,~,S_i]=find(sum(edges(i,:))+sum(edges(:,i)));
            
            %针对于SF与SF2之间的权重变化
            if(type==2)
                [~,to,~]=find(edges(i,:));
                edges(i,to)=edges(i,to)*(1+1/S_i);

                [from,~,~]=find(edges(:,i));
                edges(from,i)=edges(from,i)*(1+1/S_i);
            end
        end
    end
    close(bar);
end