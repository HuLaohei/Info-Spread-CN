function [L_T] = Calculate_L_T(vertices,edges,S,theta)
%此函数用于计算理论最短激活时间

%参数解释：
%1.S：各节点的度
%2.theta：计算出的S与tao_i之间的系数

    bar=waitbar(0,'1','name','计算理论最短时间');
    string=sprintf('开始计算理论最短时间');
    waitbar(0,bar,string);
    f=@(k,i) S(i)'.^theta(1);
    L_T=zeros(length(vertices));
    for i=1:length(vertices)
        bili=i/length(vertices);
        string=sprintf('已计算节点%.2f%',100*bili);
        waitbar(bili,bar,[string '%']);
        
        begin_vertice=vertices(i);
        %利用已编写好的Dijkstra函数，并将S^theta设置为权重函数
        L_T(begin_vertice,:)=Dijkstra(vertices,edges,begin_vertice,f,length(edges).^2*max(S.^theta(1)));
    end
    close(bar);
end