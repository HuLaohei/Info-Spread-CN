function [] = Figure_S_tao_i(S_need,tao_i,theta)
%�˺������ڻ���S��tao_i֮��Ĺ�ϵ���һ����������

%�������ͣ�
%1.S_need��ѡȡ�ĵ�Ķ�
%2.tao_i��ѡȡ�ĵ�ľֲ���Ӧʱ��
%3.theta����ϳ����Ĳ���

    x=log10(S_need);y=log10(tao_i);
    figure,scatter(x,y);
    hold on;
    axis equal;
    S=linspace(min(x),max(x),1000);
    tao=theta(1).*S+theta(2);
    plot(S,tao);
    xlabel('�ڵ�Ķ�');
    ylabel('�ֲ�����ʱ��');
    title('����ֲ�����ʱ���ϵ');
end

