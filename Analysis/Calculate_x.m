function [x_n] = Calculate_x(vertices,edges,M0,M1,M2,tao,epsilon,S)
%此函数用于计算首次平衡的状态
%参数解释：见Analysis.m

%结果解释：
%1.x_n：最终稳定的x值。

    bar=waitbar(0,'1','name','计算稳定状态');
    %用于ode45计算的微分方程
    function [dx] = Calculate_x_stable(t,x)
        dx=zeros(length(vertices),1);
        [from,to,value]=find(edges);
        
        %部分采用向量化处理，加快速度
        ans_dx=value.*M1(x(from)).*M2(x(to));
        for i=1:length(ans_dx)
            dx(from(i))=dx(from(i))+ans_dx(i);
        end
        dx=M0(x)+dx;
    end

    dx=ones(length(vertices),1);
    x_n=rand(length(vertices),1); t_n=0;
    
    %用于判断是否稳定的依据：max(|dx/x|)<epsilon
    %因在模型方程下会出现x_n与dx均很小但是比例为一，因此做出调整
    
    while(max(abs(dx(x_n>epsilon)./x_n(x_n>epsilon)))>epsilon)
        bili=epsilon/max(abs(dx(x_n>epsilon)./x_n(x_n>epsilon)));
        string=sprintf('已计算节点%.2f%',100*bili);
        waitbar(bili,bar,[string '%']);
        
        [t,x]=ode45(@Calculate_x_stable,[t_n,t_n+tao],x_n);
        x_n=x(length(t),:)';t_n=t(length(t));
        dx=Calculate_x_stable(t_n,x_n);
    end
    close(bar);
end