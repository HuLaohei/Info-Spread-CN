function [C] = Caculate_C(edges,S)
%�����������¹�ʽ�������̶�C
%C_i=sum(A_im*A_in*A_mn)/(k_i*(k_i-1));
%C=sum(C_i)/N;
%k_iʱ�ڵ�i�Ķȣ�N��C_i�ĳ��� 

%�������ͣ�
%1.edges���߼��ϡ�
%2.S��ÿ���ڵ�Ķȡ�

%�������Ƚ���Ԫ���Ϊ�����ڵ㣬���ȱ�����һ�ڵ㣬�õ��ڶ��ڵ㣬�ٶԵڶ��ڵ����
%ȡ�ڶ��ڵ�������һ�ڵ�����Ľ������������������洢�������ɣ��������Դ���ʡʱ��
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