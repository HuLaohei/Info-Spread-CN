function [T,L,L_T] = Delte_x_n_0(x_n,vertices,T,L,L_T,epsilon)
%����x_n��ֵ��С���������Ӱ��

%�������ͣ�
%1.x_n���ȶ�״̬
%2.vertices���ڵ㼯��
%3.T��L��T_L����Ҫ���������
%4.epsilon���ж�x_n�Ƿ�Ϊ0�ı�׼

    flag=(x_n(vertices)<epsilon);
    if(sum(flag)~=0)
        T(x_n(vertices)<epsilon,:)=[];
        L(x_n(vertices)<epsilon,:)=[];
        L_T(x_n(vertices)<epsilon,:)=[];
    end
end

