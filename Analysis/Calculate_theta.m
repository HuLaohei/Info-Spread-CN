function [theta] = Calculate_theta(S_need,tao_i)
%�˺������ڼ���S��tao_i֮����������ϵ��
%�������ͣ�
%1.S_need��tao_i���ֱ�Ϊ����������ϵ�x��yֵ��

%�������
%1.theta��Ϊ������ϵ�б���Լ��ؾࡣ

    x=log10(S_need);y=log10(tao_i);
    theta=polyfit(x,y,1);
end