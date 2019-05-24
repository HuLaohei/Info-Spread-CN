function [T] = Calculate_T_ji(x_n,vertices,edges,active_vertice,M0,M1,M2,yita,tao,epsilon)
%计算设置j为激活点，其余节点的激活时间

%参数解释：
%1.x_n：计算出的稳定状态。
%2.其余参数见Analysis.m。

    %用于ode45的微分方程，并且激活点的导数永久为零
    function [dx] = Calculate_x_stable(t,x)
        dx=zeros(length(vertices),1);
        [from,to,value]=find(edges);

        ans_dx=value.*M1(x(from)).*M2(x(to));
        for j=1:length(ans_dx)
            dx(from(j))=dx(from(j))+ans_dx(j);
        end
        dx=M0(x)+dx; dx(active_vertice)=0;
    end

    dx=ones(length(vertices),1);
    x_stable=x_n; t_n=0; t_stable=[];
    T=zeros(length(vertices),1);
    
    %循环直至满足终止条件，并将每次所求x与t记录
    while(max(abs(dx(x_n>epsilon)./x_n(x_n>epsilon)))>epsilon)
        [t,x]=ode45(@Calculate_x_stable,[t_n,t_n+tao/10],x_n);
        x_n=x(length(t),:)';t_n=t(length(t));
        dx=Calculate_x_stable(t_n,x_n);
        x_stable=[x_stable,x'];
        t_stable=[t_stable;t];
    end
    
    %计算delta_x_ji，将未激活节点时间设为0，并计算每个时间点所达到的程度
    len_x_2=size(x_stable,2);
    delta_x_ji=((x_stable(:,len_x_2)-x_stable(:,1))*ones(1,len_x_2));
    x_stable=(x_stable-x_stable(:,1))./delta_x_ji;
    x_stable(isnan(x_stable))=0;
    
    %计算达到激活水平yita的时间
    for i=1:size(T)
        if(x_stable(i,len_x_2)~=0)
            [~,y]=find(x_stable(i,:)>yita);
            T(i)=t_stable(y(1)-1);
        end
    end
end