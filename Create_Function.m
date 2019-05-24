function [M0,M1,M2] = Create_Function(type,parmas)
%此函数用于创建微分方程。
%可创建的方程如下：
%1.R1:regulatory dynamics。
%2.N:neuronal activation，params=[B,C]。
%3.R2:regulatory dynamics。
%4.P:population dynamics。
%5.M:ecological interactions。
%6.E:epidemic spreading。

    switch(upper(type))
        case{'R1'}
            M0=@(x) -x; M1=@(x) 1; M2=@(x) x./(1+x);
        case{'N'}
            B=params(1);C=params(2);
            M0=@(x) B*x; M1=@(x) C*tanh(x); M2=@(x) tanh(x);
        case{'R2'}
            M0=@(x) -1*x.^0.4; M1=@(x) 1; M2=@(x) x.^0.2./(1+x.^0.2);
        case{'P'}
            M0=@(x) -1*x.^0.5; M1=@(x) 1; M2=@(x) x.^0.2;
        case{'M'}
            M0=@(x) x.*(1-x.^2); M1=@(x) x; M2=@(x) x./(1+x);
        case{'E'}
            M0=@(x) -x; M1=@(x) 1-x; M2=@(x) x;
    end
end

