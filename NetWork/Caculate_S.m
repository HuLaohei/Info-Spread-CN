function [S] =Caculate_S(edges)
%�������ô˺�������ÿ���ڵ�Ķ�

%�������ͣ�
%1.edges���߼��ϡ�

    [from,~,~]=find(edges);
    S=tabulate(from);
    S=fix(S(:,2));
end