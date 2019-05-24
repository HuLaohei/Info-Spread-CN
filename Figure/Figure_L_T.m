function [] = Figure_L_T(L,T)
%此函数用于计算两点间距离与实际激活时间的关系

%1.L：两点之间最短距离
%2.T：实际激活时间
%3.theta：用于选择绘制图表的类型

    %因为L范围很大，因此将其分为10个区间，并计算每个区间T的平均值
    unique_L=linspace(min(min(L)),max(max(L)),10);
    
    %因为是计算区间，所以增加一个虚拟点，最后将其去掉
    unique_L=[unique_L,max(max(L))+1];
    unique_T=zeros(length(unique_L)-1,1);
    for i=1:length(unique_L)-1
        flag=logical((L>=unique_L(i)).*(L<unique_L(i+1)));
        ans_L=T(flag);
        unique_T(i)=sum(ans_L)/length(ans_L);
    end
    
    unique_L=unique_L(1:end-1);
    
    figure,scatter(unique_L,unique_T);
    xlabel('两点之间最短距离');
    ylabel('实际激活时间');
    title('两点之间最短距离与实际激活时间的关系');
end

