function [Q] = Caculate_Q(edges,S)
%�����������¹�ʽ����ȹ����̶�Q
%Q=[sum_i(j_i k_i)/M-[sum(j_i+k_i)/(2M)]^2]/
%              [sum(j_i^2+k_i^2)/(2M)-[sum(j_i+k_i)/(2M)]^2]

%�������ͣ�
%1.edges���߼��ϡ�
%2.S��ÿ���ڵ�Ķȡ�

    [vertice1,vertice2,~]=find(edges);
    j=S(vertice1); k=S(vertice2);
    M=nnz(edges);
    sum_jk=(sum(j+k)).^2/(4*M^2);
    residual=sum(j.*k)/M-sum_jk;
    sigma_q=sum(j.^2+k.^2)/(2*M)-sum_jk;
    Q=residual/sigma_q;
end