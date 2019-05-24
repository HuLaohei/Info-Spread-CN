function [S_need,tao_i] = Calculate_tao_i(x_n,vertices,edges,S,M0,M1,M2,alpha,yita,tao,epsilon)
%此函数用于计算局部响应时间，对于节点j，若i与其有联系，将i设为激活点并求j的平均激活时间

%参数解释：
%1.x_n：计算出的稳定状态。
%2.其余参数见Analysis.m。

    bar=waitbar(0,'1','name','计算局部响应时间');
    
    %对于每一个度，选取一个点
    unique_S=setdiff(unique(S),0);
    tao_i=zeros(length(unique_S),1);
    S_need=tao_i;
    for i=1:length(unique_S)
        
        %若x值很小则不考虑
        centers=find(S==unique_S(i));
        index=find(x_n(centers)==max(x_n(centers)),1,'first');
        if(x_n(index)<epsilon)
            continue;
        end
        
        %设置中心节点，并计算其周围节点对它的激活时间
        center_vertice=centers(index);
        [from,~,~]=find(edges(:,center_vertice));
        T_ij=zeros(length(from),1);
        for k=1:length(from)
            bili=((i-1)/length(unique_S)+k/(length(unique_S)*length(from)));
            string=sprintf('已计算节点%.2f%',100*bili);
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