function [] = Figure_L_T(L,T)
%�˺������ڼ�������������ʵ�ʼ���ʱ��Ĺ�ϵ

%1.L������֮����̾���
%2.T��ʵ�ʼ���ʱ��
%3.theta������ѡ�����ͼ�������

    %��ΪL��Χ�ܴ���˽����Ϊ10�����䣬������ÿ������T��ƽ��ֵ
    unique_L=linspace(min(min(L)),max(max(L)),10);
    
    %��Ϊ�Ǽ������䣬��������һ������㣬�����ȥ��
    unique_L=[unique_L,max(max(L))+1];
    unique_T=zeros(length(unique_L)-1,1);
    for i=1:length(unique_L)-1
        flag=logical((L>=unique_L(i)).*(L<unique_L(i+1)));
        ans_L=T(flag);
        unique_T(i)=sum(ans_L)/length(ans_L);
    end
    
    unique_L=unique_L(1:end-1);
    
    figure,scatter(unique_L,unique_T);
    xlabel('����֮����̾���');
    ylabel('ʵ�ʼ���ʱ��');
    title('����֮����̾�����ʵ�ʼ���ʱ��Ĺ�ϵ');
end

