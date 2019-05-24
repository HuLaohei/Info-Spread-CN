function [average_T,T] = Calcualte_T(x_n,vertices,edges,M0,M1,M2,alpha,yita,tao,epsilon)
%此函数用于计算每个节点设为激活点，其余节点的激活时间以及平均激活时间

%参数解释：
%1.x_n：计算出的稳定状态。
%2.其余参数见Analysis.m。

    bar=waitbar(0,'1','name','计算平均响应时间');
    string=sprintf('开始计算平均响应时间');
    waitbar(0,bar,string);
    T=zeros(length(vertices));
    for i=1:length(vertices)
        bili=i/length(vertices);
        string=sprintf('已计算节点%.2f%',100*bili);
        waitbar(bili,bar,[string '%']);
        
        active_vertice=vertices(i);
        if(x_n(active_vertice)<epsilon)
            continue;
        end
        
        %分别设置每个节点为激活点并将其x值改变alpha
        x=x_n;x(active_vertice)=x(active_vertice)*(1+alpha);
        ans_T=Calculate_T_ji(x,vertices,edges,active_vertice,M0,M1,M2,yita,tao,epsilon);
        T(i,:)=ans_T;
    end
    
    %计算平均激活时间
    average_T=sum(sum(T))/nnz(T);
    close(bar);
end

