clc;
clear;
close all;

%������������(�������������Լ�����Ҫ���'Create_NetWork')
net='ER';N=200; S_num=10;%��������ڵ�����
params_net=[N,S_num,0.4];
[vertices,edges,S,params]=Create_NetWork(net,params_net);

%������ѡȡ(���庯�������Լ�����Ҫ���'Create_Function')
fun='R1'; params_fun=[];
[M0,M1,M2]=Create_Function(fun,params_fun);
x_n=Create_init_x(M0,M1,M2,S);

%�������趨��
%1.alpha��xֵ����Ӱ��ʱ���õĸ�������
%2.yita���������
%3.tao������ode45�������ʱ���õ�ʱ�䳤��
%4.epsilon���ж��Ƿ�Ϊ�ȶ�״̬���ٽ�ֵ
alpha=0.2;yita=0.5;tao=0.05;epsilon=10e-4;

%���з���
% Analysis(x_n,vertices,edges,S,M0,M1,M2,alpha,yita,tao,epsilon);