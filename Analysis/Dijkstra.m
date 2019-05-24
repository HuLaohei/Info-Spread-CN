function [L] = Dijkstra(vertices,edges,i,f,MAX_INT)
%ʵ���˾����Dijkstra�㷨�����ԸĽ�

%�������ͣ�
%1.vertices��edges���ڵ㼯����߼��ϡ�
%2.i����ʼ�Ľڵ�
%3.f�����ڼ���Ȩ�صĺ���
%4.MAX_INT���㷨�����������ϵ����ֵ

%������ͣ�
%1.L���ӳ�ʼ�ڵ�������ڵ����СȨ��

    L=ones(length(vertices),1)*MAX_INT;L(i)=0;
    
    %state���ڼ�¼�˽ڵ��Ƿ�Ϊ�Ѽ���ڵ㣬ȫ�����������㷨����
    state=false(length(vertices),1); k=i;
    while(~prod(state))
        state(k)=true;
        edges_to=find(edges(k,:));
        
        %����Ȩ��
        L(edges_to)=min(L(edges_to),L(k)+f(k,edges_to)');
        
        %ѡȡĿǰȨ����С����δ�������һ���ڵ�
        k_set=vertices(~state);
        index_k=find(min(L(k_set))==L(k_set),1,'first');
        k=k_set(index_k);
    end
end