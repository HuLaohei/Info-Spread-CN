clc;
clear;
close all;

%������������(�������������Լ�����Ҫ���'Create_NetWork')
N=600;%��������ڵ�����
[vertices,edges,S,params]=Create_NetWork('ER',[N,40,0.5]);

%������ѡȡ(���庯�������Լ�����Ҫ���'Create_Function')
[M0,M1,M2]=Create_Function('M',[]);

%�������趨��
%1.alpha��xֵ����Ӱ��ʱ���õĸ�������
%2.yita���������
%3.tao������ode45�������ʱ���õ�ʱ�䳤��
%4.epsilon���ж��Ƿ�Ϊ�ȶ�״̬���ٽ�ֵ
alpha=0.2;yita=0.5;tao=0.5;epsilon=10e-4;

%���з���
Analysis(vertices,edges,S,M0,M1,M2,alpha,yita,tao,epsilon);