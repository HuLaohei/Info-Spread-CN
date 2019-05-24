function [S_need,tao_i] = Calculate_tao_i(x_n,vertices,edges,S,M0,M1,M2,alpha,yita,tao,epsilon)
%�˺������ڼ���ֲ���Ӧʱ�䣬���ڽڵ�j����i��������ϵ����i��Ϊ����㲢��j��ƽ������ʱ��

%�������ͣ�
%1.x_n����������ȶ�״̬��
%2.���������Analysis.m��

    bar=waitbar(0,'1','name','����ֲ���Ӧʱ��');
    
    %����ÿһ���ȣ�ѡȡһ����
    unique_S=setdiff(unique(S),0);
    tao_i=zeros(length(unique_S),1);
    S_need=tao_i;
    for i=1:length(unique_S)
        
        %��xֵ��С�򲻿���
        centers=find(S==unique_S(i));
        index=find(x_n(centers)==max(x_n(centers)),1,'first');
        if(x_n(index)<epsilon)
            continue;
        end
        
        %�������Ľڵ㣬����������Χ�ڵ�����ļ���ʱ��
        center_vertice=centers(index);
        [from,~,~]=find(edges(:,center_vertice));
        T_ij=zeros(length(from),1);
        for k=1:length(from)
            bili=((i-1)/length(unique_S)+k/(length(unique_S)*length(from)));
            string=sprintf('�Ѽ���ڵ�%.2f%',100*bili);
            waitbar(bili,bar,[string '%']);
            
            active_vertice=from(k);
            x=x_n; x(active_vertice)=x(active_vertice)*(1+alpha);
            ans_T=Calculate_T_ji(x,vertices,edges,active_vertice,M0,M1,M2,yita,tao,epsilon);
            T_ij(k)=ans_T(center_vertice);
        end
        T_ij(T_ij==0)=[];
        tao_i(i)=sum(T_ij)/length(from);
        S_need(i)=unique_S(i);
    end
    tao_i(S_need==0)=[]; S_need(S_need==0)=[];
    close(bar);
end