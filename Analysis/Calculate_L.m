function [L] = Calculate_L(vertices,edges)
%此函数用于计算每两点之间的最短路径

%参数解释：略
    bar=waitbar(0,'1','name','计算最短路径');
    string=sprintf('开始计算最短路径');
    waitbar(0,bar,string);
    L=zeros(length(vertices));
    for i=1:length(vertices)
        bili=i/length(vertices);
        string=sprintf('已计算节点%.2f%',100*bili);
        waitbar(bili,bar,[string '%']);
        begin_vertice=vertices(i);
        
        %利用已写出的Dijkstra算法，并将权重函数设置为边集合即可
        L(begin_vertice,:)=Dijkstra(vertices,edges,begin_vertice,edges,length(vertices)^2);
    end
    close(bar);
end