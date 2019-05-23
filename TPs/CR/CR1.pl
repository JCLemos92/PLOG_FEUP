r(a,b). 
r(a,c). 
r(b,a). 
r(a,d).
s(b,c).
s(b,d). 
s(c,c). 
s(d,e). 

a(X,Y):- 
    r(X,Y),
    s(Y,Z),
    \+(r(Y,X)),
    \+(s(Y,Y)).

% X=a, Y=d