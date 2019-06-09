clc;
clear;
close all;

%建立复杂网络(具体网络类型以及参数要求见'Create_NetWork')
net='ER';N=200; S_num=10;%复杂网络节点数量
params_net=[N,S_num,0.4];
[vertices,edges,S,params]=Create_NetWork(net,params_net);

%函数的选取(具体函数类型以及参数要求见'Create_Function')
fun='R1'; params_fun=[];
[M0,M1,M2]=Create_Function(fun,params_fun);
x_n=Create_init_x(M0,M1,M2,S);

%参数的设定：
%1.alpha：x值传递影响时设置的浮动比例
%2.yita：激活比例
%3.tao：利用ode45进行求解时设置的时间长度
%4.epsilon：判断是否为稳定状态的临界值
alpha=0.2;yita=0.5;tao=0.05;epsilon=10e-4;

%进行分析
% Analysis(x_n,vertices,edges,S,M0,M1,M2,alpha,yita,tao,epsilon);