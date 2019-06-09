function [x_n] = Create_init_x(M0,M1,M2,S)
    syms x;
    M0=M0(x); M1=M1(x); M2=M2(x);
    M=eval(-1*M0/(M1*M2));

    [up,down]=numden(M);
    [~,ma_up]=Calculate_frequency(up);
    [mi_down,ma_down]=Calculate_frequency(down);
    
    beta=eval(ma_up-mi_down);
    coeff=eval(subs(M,'x',10e6))/(10e6)^beta;

    beta=eval(ma_up>ma_down)/(beta+realmin);
    x_n=power(S*coeff,beta);
end

function [mi,ma] = Calculate_frequency(p)
    mi=0; ma=0;
    [~,t]=coeffs(p);
    d=diff(t)*ones(length(t),1);
    [a,~]=coeffs(d);
    if(d~=0)
        mi=min(a); ma=max(a);
    end
    if(length(a)~=length(t))
        mi=min(mi,0); ma=max(ma,0);
    end
end