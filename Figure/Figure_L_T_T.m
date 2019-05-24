function [] = Figure_L_T_T(L_T,T,theta)
%此函数用于绘制理论激活最短时间与实际激活时间的关系

%参数解释：
%1.L_T：理论激活最短时间
%2.T：实际激活时间
%3.theta：用于选择绘制图表的类型

    %因为L_T范围很大，因此将其分为10个区间，并计算每个区间T的平均值
    unique_L_T=linspace(min(min(L_T)),max(max(L_T)),10);
    
    %因为是计算区间，所以增加一个虚拟点，最后将其去掉
    unique_L_T=[unique_L_T,max(max(L_T))+1];
    unique_T=zeros(length(unique_L_T)-1,1);
    for i=1:length(unique_L_T)-1
        flag=logical((L_T>=unique_L_T(i)).*(L_T<unique_L_T(i+1)));
        ans_L_T=T(flag);
        unique_T(i)=sum(ans_L_T)/length(ans_L_T);
    end
    
    unique_L_T=unique_L_T(1:end-1);
    %针对于不同的theta选择不同的拟合方式
    if(theta(1)>0)
        x=log10(unique_L_T);y=log10(unique_T);
    else
        if(theta(1)<0)
            x=-1*log10(unique_L_T);y=-1*log10(unique_T);
        else
            x=unique_L_T;y=unique_T;
        end
    end
    figure,scatter(x,y);
    axis equal;
    xlabel('理论激活最短时间');
    ylabel('实际激活时间');
    title('理论激活最短时间与实际激活时间的关系');
end

