function [average_T,T] = Calcualte_T(x_n,vertices,edges,M0,M1,M2,alpha,yita,tao,epsilon)
%�˺������ڼ���ÿ���ڵ���Ϊ����㣬����ڵ�ļ���ʱ���Լ�ƽ������ʱ��

%�������ͣ�
%1.x_n����������ȶ�״̬��
%2.���������Analysis.m��

    bar=waitbar(0,'1','name','����ƽ����Ӧʱ��');
    string=sprintf('��ʼ����ƽ����Ӧʱ��');
    waitbar(0,bar,string);
    T=zeros(length(vertices));
    for i=1:length(vertices)
        bili=i/length(vertices);
        string=sprintf('�Ѽ���ڵ�%.2f%',100*bili);
        waitbar(bili,bar,[string '%']);
        
        active_vertice=vertices(i);
        if(x_n(active_vertice)<epsilon)
            continue;
        end
        
        %�ֱ�����ÿ���ڵ�Ϊ����㲢����xֵ�ı�alpha
        x=x_n;x(active_vertice)=x(active_vertice)*(1+alpha);
        ans_T=Calculate_T_ji(x,vertices,edges,active_vertice,M0,M1,M2,yita,tao,epsilon);
        T(i,:)=ans_T;
    end
    
    %����ƽ������ʱ��
    average_T=sum(sum(T))/nnz(T);
    close(bar);
end

