function [] = Figure_L_T_T(L_T,T,theta)
%�˺������ڻ������ۼ������ʱ����ʵ�ʼ���ʱ��Ĺ�ϵ

%�������ͣ�
%1.L_T�����ۼ������ʱ��
%2.T��ʵ�ʼ���ʱ��
%3.theta������ѡ�����ͼ�������

    %��ΪL_T��Χ�ܴ���˽����Ϊ10�����䣬������ÿ������T��ƽ��ֵ
    unique_L_T=linspace(min(min(L_T)),max(max(L_T)),10);
    
    %��Ϊ�Ǽ������䣬��������һ������㣬�����ȥ��
    unique_L_T=[unique_L_T,max(max(L_T))+1];
    unique_T=zeros(length(unique_L_T)-1,1);
    for i=1:length(unique_L_T)-1
        flag=logical((L_T>=unique_L_T(i)).*(L_T<unique_L_T(i+1)));
        ans_L_T=T(flag);
        unique_T(i)=sum(ans_L_T)/length(ans_L_T);
    end
    
    unique_L_T=unique_L_T(1:end-1);
    %����ڲ�ͬ��thetaѡ��ͬ����Ϸ�ʽ
    if(theta(1)>0)
        x=log10(unique_L_T);y=log10(unique_T);
    else
        if(theta(1)<0)
            x=-1*log10(unique_L_T);y=-1*log10(unique_T);
        else
            x=unique_L_T;y=unique_T;
        end
    end
    figure,scatter(x,y);
    axis equal;
    xlabel('���ۼ������ʱ��');
    ylabel('ʵ�ʼ���ʱ��');
    title('���ۼ������ʱ����ʵ�ʼ���ʱ��Ĺ�ϵ');
end

