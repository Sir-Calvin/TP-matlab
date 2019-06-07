function res = aproxDiscreta (A,Y)
syms x;
    AtA=transpose(A)*A;
    aux=((inv(AtA))*(transpose(A)*transpose(Y)));
    f=aux(1)+aux(2)*x+aux(3)*x^2;
res=f;
