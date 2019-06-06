function A = getMatrixA(f,xs)
    syms x
    a = subs(f,transpose(xs))
A=a;