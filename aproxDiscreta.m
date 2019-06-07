function res = aproxDiscreta (A,Y)
syms x;
    AtA=transpose(A)*A;
    aux=((inv(AtA))*(transpose(A)*transpose(Y)));
    f=0;
    for i=1:length(aux)
        f = f + aux(i)*x^(i-1);
        %f=aux(1)+aux(2)*x+aux(3)*x^2;
    end
res=f;
