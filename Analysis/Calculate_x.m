function [x_n] = Calculate_x(vertices,edges,M0,M1,M2,tao,epsilon,S)
%�˺������ڼ����״�ƽ���״̬
%�������ͣ���Analysis.m

%������ͣ�
%1.x_n�������ȶ���xֵ��

    bar=waitbar(0,'1','name','�����ȶ�״̬');
    %����ode45�����΢�ַ���
    function [dx] = Calculate_x_stable(t,x)
        dx=zeros(length(vertices),1);
        [from,to,value]=find(edges);
        
        %���ֲ��������������ӿ��ٶ�
        ans_dx=value.*M1(x(from)).*M2(x(to));
        for i=1:length(ans_dx)
            dx(from(i))=dx(from(i))+ans_dx(i);
        end
        dx=M0(x)+dx;
    end

    dx=ones(length(vertices),1);
    x_n=rand(length(vertices),1); t_n=0;
    
    %�����ж��Ƿ��ȶ������ݣ�max(|dx/x|)<epsilon
    %����ģ�ͷ����»����x_n��dx����С���Ǳ���Ϊһ�������������
    
    while(max(abs(dx(x_n>epsilon)./x_n(x_n>epsilon)))>epsilon)
        bili=epsilon/max(abs(dx(x_n>epsilon)./x_n(x_n>epsilon)));
        string=sprintf('�Ѽ���ڵ�%.2f%',100*bili);
        waitbar(bili,bar,[string '%']);
        
        [t,x]=ode45(@Calculate_x_stable,[t_n,t_n+tao],x_n);
        x_n=x(length(t),:)';t_n=t(length(t));
        dx=Calculate_x_stable(t_n,x_n);
    end
    close(bar);
end