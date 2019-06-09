function [] = Analysis(x_n,vertices,edges,S,M0,M1,M2,alpha,yita,tao,epsilon)
%此函数为所有分析以及制图的调用函数
%参数说明：
%1.vertices，edges：分别为点集合以及边集合
%2.S：每点的度
%3.M0，M1，M2：方程的参数
%4.alpha，yita，tao，epsilon：参数解释见Demo.m

    addpath('Analysis/');
    %Analysis文件夹下包括函数及其作用：
    %1.Calculate_T：分别计算设置每一点为激活点，返回其余节点激活的时间以及平均激活时间。
    %2.Calculate_L：分别计算从一点至其余点的最短路径。
    %3.Calculate_L_T：分别计算从一点至其余点的理论最短传播时间。
    %4.Calculate_T_ji：计算以第j个节点为激活节点其余节点激活的时间。
    %5.Calculate_tao_i：计算局部响应时间。
    %6.Calculate_theta：计算tao_i与S之间的线性拟合系数。
    %7.Calculate_x：计算初次运行的稳定状态。
    %8.Dijkstra:最短路径算法Dijkstra的实现对于该问题的变形。
    %9.Delte_x_n_0：因为在判断稳定时有所限制，所以去除对求出结果的影响
    
    addpath('Figure/');
    %Figure文件夹下包括函数及其作用：
    %1.Figure_L_T：描绘L_ji与T_ji之间的关系。
    %2.Figure_L_T_T：描绘L_T与T_ji之间的关系。
    %3.Figure_S_tao_i：描绘S与tao_i之间的关系。
    
    %计算初次运行稳态
    disp('开始计算稳定状态');
    x_n=Calculate_x(x_n,vertices,edges,M0,M1,M2,tao,epsilon);
    disp('完成稳定状态计算');
    
    %计算局部响应时间并计算出与度之间的关系
    disp('正在计算局部响应时间');
    [S_need,tao_i]=Calculate_tao_i(x_n,vertices,edges,S,M0,M1,M2,alpha,yita,tao,epsilon);
    disp('完成局部响应时间计算');
    
    disp('开始进行拟合');
    theta=Calculate_theta(S_need,tao_i);
    fprintf('拟合完成，结果斜率为%.2f\n',theta(1));
    
    Figure_S_tao_i(S_need,tao_i,theta);
    
    %平均响应时间(此函数需要改变Demo中的N的数量来绘图)
    disp('开始计算平均响应时间');
    [average_T,T]=Calcualte_T(x_n,vertices,edges,M0,M1,M2,alpha,yita,tao,epsilon);
    fprintf('平均时间计算完毕，结果为%.3f\n',average_T);
    
    %计算最短路径以及理论最短响应时间并绘图
    disp('开始计算两点间最短路径');
    L=Calculate_L(vertices,edges);
    disp('完成两点间最短路径计算');
    
    disp('开始计算理论最短响应时间');
    L_T=Calculate_L_T(vertices,edges,S,theta);
    disp('完成理论最短响应时间计算');
    
    [T,L,L_T] = Delte_x_n_0(x_n,vertices,T,L,L_T,epsilon);
    
    Figure_L_T(L,T);
    Figure_L_T_T(L_T,T,theta);
end