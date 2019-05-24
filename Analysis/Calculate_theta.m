function [theta] = Calculate_theta(S_need,tao_i)
%此函数用于计算S与tao_i之间的线性相关系数
%参数解释：
%1.S_need，tao_i：分别为用于线性拟合的x，y值。

%结果解释
%1.theta：为线性拟合的斜率以及截距。

    x=log10(S_need);y=log10(tao_i);
    theta=polyfit(x,y,1);
end