/*2. Una pila de bloques puede ser descripta por una colección de hechos:
    on(Bloque1,Bloque2).
el cual es verdadero si Bloque1 está directamente encima del Bloque2. 
Defina el predicado arriba(Bloque1,Bloque2) que es verdadero si Bloque1 está 
en la pila sobre el Bloque2, ya sea directamente o indirectamente.
Ayuda: la relación ‘‘arriba’’ es la clausura transitiva sobre la relación ‘‘on’’.*/
on(h, g).
on(g, f).
on(f, e).
on(e, d).
on(d, c).
on(c, b).
on(b, a).
arriba(X,Y):- on(X,Y).
arriba(X,Y):- on(X,W),arriba(W,Y).

/*3. Usando la definición de números naturales a través de la función sucesor,
implemente las siguientes operaciones sobre N: */
%a) suma
suma(0,Y,Y).
suma(succ(X),Y,succ(R)):- suma(X,Y,R).
%b) resta (para los casos en que es posible)
resta(X,0,X).
resta(succ(X),succ(Y),R):- resta(X,Y,R).
%c) multiplicación
% (succ(X) por Y), es lo mismo que sumar Y a (X por Y)
multiplicacion(0,_,0). 
multiplicacion(succ(X),Y,R):- multiplicacion(X,Y,P),suma(Y,P,R).
%d) división 
menor(0,succ(_)).
menor(succ(X),succ(Y)):- menor(X,Y).
% (X/Y) = succ(R), % (X-Y)/Y = R (resta hasta llegar a 0, luego realiza succ)
division(_,0,_):- fail.
division(0,_,0).
division(X,Y,0):- menor(X,Y).
division(X,Y,succ(R)):- resta(X,Y,W),division(W,Y,R).
%e) potenciación [ X^succ(Y) = (X^Y)*X <=> X^(Y+1) = (X^Y)*X ]
potencia(_,0,succ(0)).
potencia(X,succ(Y),R):- potencia(X,Y,W), multiplicacion(X,W,R).
/* Traza ejemplo de potencia
2^3=R
    2^2=W1 (W1=4)
        2^1=W2 (W2=2)
            2^0=W3 (W3=1)
            2*W3=W2 (W2=2)
        2*W2=W1 (W1=4)
    2*W1=R (R=8) */
%f) orden ≥ (agregado el hecho (0,0) convierto > en >=, idem con < y <=)
mayor_igual(0,0).
mayor_igual(succ(_),0).
mayor_igual(succ(X),succ(Y)):- mayor_igual(X,Y).

%g) realice el árbol SLD con al menos una consulta para cada predicado 
%hecho en papel

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

