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


