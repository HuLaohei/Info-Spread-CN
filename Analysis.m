function [] = Analysis(x_n,vertices,edges,S,M0,M1,M2,alpha,yita,tao,epsilon)
%�˺���Ϊ���з����Լ���ͼ�ĵ��ú���
%����˵����
%1.vertices��edges���ֱ�Ϊ�㼯���Լ��߼���
%2.S��ÿ��Ķ�
%3.M0��M1��M2�����̵Ĳ���
%4.alpha��yita��tao��epsilon���������ͼ�Demo.m

    addpath('Analysis/');
    %Analysis�ļ����°��������������ã�
    %1.Calculate_T���ֱ��������ÿһ��Ϊ����㣬��������ڵ㼤���ʱ���Լ�ƽ������ʱ�䡣
    %2.Calculate_L���ֱ�����һ�������������·����
    %3.Calculate_L_T���ֱ�����һ����������������̴���ʱ�䡣
    %4.Calculate_T_ji�������Ե�j���ڵ�Ϊ����ڵ�����ڵ㼤���ʱ�䡣
    %5.Calculate_tao_i������ֲ���Ӧʱ�䡣
    %6.Calculate_theta������tao_i��S֮����������ϵ����
    %7.Calculate_x������������е��ȶ�״̬��
    %8.Dijkstra:���·���㷨Dijkstra��ʵ�ֶ��ڸ�����ı��Ρ�
    %9.Delte_x_n_0����Ϊ���ж��ȶ�ʱ�������ƣ�����ȥ������������Ӱ��
    
    addpath('Figure/');
    %Figure�ļ����°��������������ã�
    %1.Figure_L_T�����L_ji��T_ji֮��Ĺ�ϵ��
    %2.Figure_L_T_T�����L_T��T_ji֮��Ĺ�ϵ��
    %3.Figure_S_tao_i�����S��tao_i֮��Ĺ�ϵ��
    
    %�������������̬
    disp('��ʼ�����ȶ�״̬');
    x_n=Calculate_x(x_n,vertices,edges,M0,M1,M2,tao,epsilon);
    disp('����ȶ�״̬����');
    
    %����ֲ���Ӧʱ�䲢��������֮��Ĺ�ϵ
    disp('���ڼ���ֲ���Ӧʱ��');
    [S_need,tao_i]=Calculate_tao_i(x_n,vertices,edges,S,M0,M1,M2,alpha,yita,tao,epsilon);
    disp('��ɾֲ���Ӧʱ�����');
    
    disp('��ʼ�������');
    theta=Calculate_theta(S_need,tao_i);
    fprintf('�����ɣ����б��Ϊ%.2f\n',theta(1));
    
    Figure_S_tao_i(S_need,tao_i,theta);
    
    %ƽ����Ӧʱ��(�˺�����Ҫ�ı�Demo�е�N����������ͼ)
    disp('��ʼ����ƽ����Ӧʱ��');
    [average_T,T]=Calcualte_T(x_n,vertices,edges,M0,M1,M2,alpha,yita,tao,epsilon);
    fprintf('ƽ��ʱ�������ϣ����Ϊ%.3f\n',average_T);
    
    %�������·���Լ����������Ӧʱ�䲢��ͼ
    disp('��ʼ������������·��');
    L=Calculate_L(vertices,edges);
    disp('�����������·������');
    
    disp('��ʼ�������������Ӧʱ��');
    L_T=Calculate_L_T(vertices,edges,S,theta);
    disp('������������Ӧʱ�����');
    
    [T,L,L_T] = Delte_x_n_0(x_n,vertices,T,L,L_T,epsilon);
    
    Figure_L_T(L,T);
    Figure_L_T_T(L_T,T,theta);
end