%   [X Y] = rk4 (a,b,f,condicion,h,orden)
%   X : es la ubicacion de los puntos en el eje de las abscisa
%   Y : es la ubicacion de los puntos en el eje de las ordenadas
%   a : es el punto inicial en el eje de las x
%   b : es el punto final en el eje de las x
%   h: es el tamaño de paso
%   condicion: las condiciones iniciales segun la ecuacion diferencial
%   (se pasa como vector columna)
%   ----------------------------------------------------------------------
%   Esta funcion me permite el calcular los puntos por medio del metodo de
%   Runge-Kutta de 4to orden a partir de una ecuacion diferencial de orden 
%   n, de acuerdo a un punto inicial y un punto final, un tamaño de paso y 
%   una condiciones iniciales
%   ----------------------------------------------------------------------
%   Ejemplo:
%   a = 0
%   b = 1
%   h = 0.2
%   condicion = [1;1.4;2.1]
%   f = diff(y,orden)==(x+y^2)/(1+y^2)+y*diff(y)
%
%   Resultado: 
%   
%   X =
%
%        0    0.2000    0.4000    0.6000    0.8000    1.0000 
%   
%   Y =
%
%   1.0000    1.3249    1.7548    2.3232    3.0847    4.1321

function [X Y] = rk4 (f,a,b,condicion,h)
syms y(x);
%f = diff(y,orden)==(x+y^2)/(1+y^2)+y*diff(y);
V = odeToVectorField(f);
M = matlabFunction(V,'vars',{'x','Y'});

xs = a : h : b;
n = ( b - a ) / h;

for i = 1 : n 
    xi = xs(i);
    yi = condicion(:,i);
    k1 = h*M(xi,yi);
    k2 = h*M(xi+h/2,yi+k1/2);
    k3 = h*M(xi+h/2,yi+k2/2);
    k4 = h*M(xi+h,yi+k3);
    
    nextCondicion=yi+(k1+2*k2+2*k3+k4)/6;
    condicion=[condicion nextCondicion];
end
X = xs
Y = condicion(1,:)

