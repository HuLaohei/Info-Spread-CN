function [] = Figure_S_tao_i(S_need,tao_i,theta)
%此函数用于绘制S与tao_i之间的关系并且绘制拟合曲线

%参数解释：
%1.S_need：选取的点的度
%2.tao_i：选取的点的局部响应时间
%3.theta：拟合出来的参数

    x=log10(S_need);y=log10(tao_i);
    figure,scatter(x,y);
    hold on;
    axis equal;
    S=linspace(min(x),max(x),1000);
    tao=theta(1).*S+theta(2);
    plot(S,tao);
    xlabel('节点的度');
    ylabel('局部激活时间');
    title('度与局部激活时间关系');
end

