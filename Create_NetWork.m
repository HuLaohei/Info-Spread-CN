function [vertices,edges,S,params] = Create_NetWork(type,params)
%此函数为字典函数，用于创建复杂网络并计算相应的参数：
%1.vertices，edges：分别为节点集合与边集合
%2.度：S，计算函数为Calculate_S。
%3.聚类程度：C，计算函数为Calculate_C。
%4.度相关性：Q，计算函数为Calculate_Q。

    addpath('Network/');
    %可建立的复杂网络模型如下
    %1.ER:Erdos-Renyi网络,params=[N,S,p],
    %     具体参数介绍请看 'Create_ER_NetWork'.
    %2.SF，SF1，SF2:Scale-free 无标尺网络及其变形,params=[N,S,m_0],
    %     具体参数介绍请看 'Create_SF_NetWork'.
    switch(upper(type))
        case{'ER'}
            N=params(1);S=params(2);p=params(3);
            [vertices,edges]=Create_ER_NetWork(N,S,p);
        case{'SF'}
            N=params(1);S=params(2);m_0=params(3);
            [vertices,edges]=Create_SF_NetWork(N,S,m_0,0);
        case{'SF1'}
            N=params(1);S=params(2);m_0=params(3);
            [vertices,edges]=Create_SF_NetWork(N,S,m_0,1);
        case{'SF2'}
            N=params(1);S=params(2);m_0=params(3);
            [vertices,edges]=Create_SF_NetWork(N,S,m_0,2);
        case{'NetWork_Theory'}
            vertices=xlsread('Network/network/vertices.xlsx',1);
            data=xlsread('Network/network/edges.xlsx');
            edges=sparse(data(:,1),data(:,2),data(:,3),...
                length(vertices),length(vertices));
    end

    %将边矩阵转换为对称阵
    edges=triu(edges)+triu(edges)';

    %计算参数
    S=Caculate_S(edges);
    Q=Caculate_Q(edges,S);
    C=Caculate_C(edges,S);

    params=[C,Q];
end