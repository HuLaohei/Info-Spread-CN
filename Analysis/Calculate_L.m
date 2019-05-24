function [L] = Calculate_L(vertices,edges)
%�˺������ڼ���ÿ����֮������·��

%�������ͣ���
    bar=waitbar(0,'1','name','�������·��');
    string=sprintf('��ʼ�������·��');
    waitbar(0,bar,string);
    L=zeros(length(vertices));
    for i=1:length(vertices)
        bili=i/length(vertices);
        string=sprintf('�Ѽ���ڵ�%.2f%',100*bili);
        waitbar(bili,bar,[string '%']);
        begin_vertice=vertices(i);
        
        %������д����Dijkstra�㷨������Ȩ�غ�������Ϊ�߼��ϼ���
        L(begin_vertice,:)=Dijkstra(vertices,edges,begin_vertice,edges,length(vertices)^2);
    end
    close(bar);
end