function [L_T] = Calculate_L_T(vertices,edges,S,theta)
%�˺������ڼ���������̼���ʱ��

%�������ͣ�
%1.S�����ڵ�Ķ�
%2.theta���������S��tao_i֮���ϵ��

    bar=waitbar(0,'1','name','�����������ʱ��');
    string=sprintf('��ʼ�����������ʱ��');
    waitbar(0,bar,string);
    f=@(k,i) S(i)'.^theta(1);
    L_T=zeros(length(vertices));
    for i=1:length(vertices)
        bili=i/length(vertices);
        string=sprintf('�Ѽ���ڵ�%.2f%',100*bili);
        waitbar(bili,bar,[string '%']);
        
        begin_vertice=vertices(i);
        %�����ѱ�д�õ�Dijkstra����������S^theta����ΪȨ�غ���
        L_T(begin_vertice,:)=Dijkstra(vertices,edges,begin_vertice,f,length(edges).^2*max(S.^theta(1)));
    end
    close(bar);
end