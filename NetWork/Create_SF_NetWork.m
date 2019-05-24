function [vertices,edges] = Create_SF_NetWork(N,S,m_0,type)
%�˺������ڴ���Scale-free���缰����Σ�����type��ͬ��
%1.type=0��SF������BA�㷨��
%2.type=1��SF1�������������Ȩ����Ϊ(0.1,0.9)�ľ��ȷֲ���
%3.type=2��SF2������BBV�㷨��

%��������
%1.N:��������ڵ�������
%2.m_0:���ӵĴ�С��
%3.S:ƽ��ÿ���ڵ�Ķȡ�
%����S<=m_0��
    
    bar=waitbar(0,'1','name','������������');
    
    string=sprintf('�������翪ʼ��������');
    waitbar(0,bar,string);
    %����SF��SF1֮�������
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

    %��ʼ����Ϊ�����Ǿ���.
    edges(1:m_0,1:m_0)=tril(ones(m_0))'-eye(m_0);
    edges=sparse(edges);

    %���и���ȵĽڵ��и��ߵ����ӿ����ԣ��������BA�㷨�����Ľ� ��
    %1.���ڵ�Ķȳ��Ͼ��������
    %2.ȡ�����Ľڵ�
    %���㷨��������ԭ���Ҵ���ʱ���
    
    for i=m_0+1:N
        bili=(i-m_0-1)/(N-m_0);
        string=sprintf('���������Ѵ���%.2f%',100*bili);
        waitbar(bili,bar,[string '%']);
        S_i=0;
        while(S_i<S)
            %��δ���ӵĽڵ���ѡȡһ��������
            adj=[i,find(edges(i,:))];
            non_adj=setdiff(vertices,adj);
            non_adj=non_adj(non_adj<i);

            %�������ӵ�����ڵ�ĸ��ʲ�ѡȡ��ֵ���Ľڵ�
            ans_edges=edges(non_adj,non_adj);
            [~,~,b]=find(sum(ans_edges,1)+sum(ans_edges,2)');
            p=b.*rand(size(b));
            edge_to=non_adj(find(max(p)==p,1));

            %ȷ������Ϊ�����Ǿ���
            edge=sort([i,edge_to]);
            edges(edge(1),edge(2))=Create_Weight();

            %���½ڵ�Ķ�
            [~,~,S_i]=find(sum(edges(i,:))+sum(edges(:,i)));
            
            %�����SF��SF2֮���Ȩ�ر仯
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