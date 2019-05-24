clc;
clear;
close all;

%建立复杂网络(具体网络类型以及参数要求见'Create_NetWork')
N=600;%复杂网络节点数量
[vertices,edges,S,params]=Create_NetWork('ER',[N,40,0.5]);

%函数的选取(具体函数类型以及参数要求见'Create_Function')
[M0,M1,M2]=Create_Function('M',[]);

%参数的设定：
%1.alpha：x值传递影响时设置的浮动比例
%2.yita：激活比例
%3.tao：利用ode45进行求解时设置的时间长度
%4.epsilon：判断是否为稳定状态的临界值
alpha=0.2;yita=0.5;tao=0.5;epsilon=10e-4;

%进行分析
Analysis(vertices,edges,S,M0,M1,M2,alpha,yita,tao,epsilon);