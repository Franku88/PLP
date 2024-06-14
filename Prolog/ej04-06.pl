/*4. ¿Cuáles de los siguientes términos unifican exitosamente?
point(A,B)  point(1,s(2)) (posible instanciar A y B como 1 y s(2) 
respectivamente) SI UNIFICAN

pre(A,B)    pre(X,Y,Z) (mismo functor, pero distinta aridad) NO UNIFICAN

6   3+3 (un termino es complejo, el otro no) NO UNIFICAN

esquina(X+Y)    esquina(corrientes+cordoba) (mismo functor, misma aridad, y es 
posible instanciar X=corrientes, Y=cordoba) SI UNIFICAN

Diana    diana (terminos simples pero diferentes, 
unifican si Diana se instancia como diana) NO UNIFICAN

‘Diana’     _diana (terminos simples pero diferentes,
unifican si _diana se instancia como 'Diana') NO UNIFICAN

_   ‘Diana goes south’ (_ es variable (anonima)), 
instancia a 'Diana goes south') SI UNIFICAN

X+1-Y*2     (X+1)-(Y*2) (por precedencia de operadores, 
X+1-Y*2 = (X+1)-(Y*2)) SI UNIFICAN

long(X, punto(A,2))     long(Y, punto(2+1, ))) (el segundo termino,
tiene un parametro faltante en su segundo parametro) NO UNIFICAN

plus(2,2)   4 (una es termino complejo y otra es constante numerica) NO UNIFICAN

admira(X,padre(X))      admira(padre(U),V) (X se instancia como padre(U),
y V con padre(X)=padre(padre(U))) SI UNIFICAN

p(q(-1,0),P2,P3)    p(P1,q(1,0),q(0,Y)) (con P1 = q(-1,0), P2 = q(1,0)
y P3 = q(0,Y)) SI UNIFICAN */

/* 5. Encontrar la unificación de los siguientes pares de fórmulas atómicas:
a) ?- append([b], [c, d], L) = append([X|Xs], Ys, [X|Zs]). 
X = b,
Xs = [],
Ys = [c, d],
L = [b|Zs].

b) ?- plus(X, s(s(Y)), s(X)) = plus(s(0), s(s(s(s(Z)))), Z).  
X = s(0),
Y = s(s(s(s(0)))),
Z = s(s(0)).

c) ?- sort([X, c, [Z]|[[a], Z]], W) = sort([[3, 4, L|Y], M, N, L, 3], [3, 5|N]).
X = [3, 4, [a]|Y],
Z = 3,
W = [3, 5, 3],
L = [a],
M = c,
N = [3].

d) ?- hanoi(s(N), A, B, C, Ms) = hanoi(s(s(0)), a, b, c, Xs).
N = s(0),
A = a,
B = b,
C = c,
Ms = Xs. */

/* 6. Indique cuáles de las siguientes listas son equivalentes a [1,2,3,4,5,6,7]:
a) [1|2, 3, 4, 5, 6, 7] = [1,2,3,4,5,6,7].              false
b) [1, 2, 3, 4, 5, 6, 7|[]] = [1,2,3,4,5,6,7].          true
c) [1|[2, 3, 4, 5, 6, 7]] = [1,2,3,4,5,6,7].            true
d) [1, 2, 3|[4|[5, 6, 7]]] = [1,2,3,4,5,6,7].           true
e) [1|[2, 3, [4, 5, 6, 7]]] = [1,2,3,4,5,6,7].          false
f) [1, 2|[3, 4, 5, 6, 7, []]] = [1,2,3,4,5,6,7].        false
g) [1, 2|[3, 4, 5, 6, 7|[]]] = [1,2,3,4,5,6,7].         true
h) [1, 2, [3, 4[5, 6, [7]]]] = [1,2,3,4,5,6,7].         false    
i) [1|[2|[3|[4|[5|[6|[7|[]]]]]]]] = [1,2,3,4,5,6,7].    true
*/