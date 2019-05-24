function [vertices,edges,S,params] = Create_NetWork(type,params)
%�˺���Ϊ�ֵ亯�������ڴ����������粢������Ӧ�Ĳ�����
%1.vertices��edges���ֱ�Ϊ�ڵ㼯����߼���
%2.�ȣ�S�����㺯��ΪCalculate_S��
%3.����̶ȣ�C�����㺯��ΪCalculate_C��
%4.������ԣ�Q�����㺯��ΪCalculate_Q��

    addpath('Network/');
    %�ɽ����ĸ�������ģ������
    %1.ER:Erdos-Renyi����,params=[N,S,p],
    %     ������������뿴 'Create_ER_NetWork'.
    %2.SF��SF1��SF2:Scale-free �ޱ�����缰�����,params=[N,S,m_0],
    %     ������������뿴 'Create_SF_NetWork'.
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

    %���߾���ת��Ϊ�Գ���
    edges=triu(edges)+triu(edges)';

    %�������
    S=Caculate_S(edges);
    Q=Caculate_Q(edges,S);
    C=Caculate_C(edges,S);

    params=[C,Q];
end