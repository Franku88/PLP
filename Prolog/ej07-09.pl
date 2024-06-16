/* 7. Escribir programas para implementar las siguientes operaciones sobre listas: */
%a) concatenación
% Caso base: adjuntar una lista vacía a una lista L.
concat([],L,L).
/* Paso recursivo: adjuntar la cabeza de la primer lista a la cabeza
de la lista resultante concatenado con el resultado de adjuntar la cola
de la primer lista con la segunda lista.*/
concat([H|L1], L2, [H|L3]) :- concat(L1, L2, L3).
/*Si o si arrancar con el caso base donde L1 se desapila de a uno sobre izquierda de L2*/

%b) pertenencia de un elemento.
miembro(X, [X|_]). % Elemento encontrado
miembro(X, [_|L]) :- miembro(X, L). % Continua buscando en la lista

%c) cantidad de ocurrencias de un elemento.
ocurrencias(_, [], 0). % lista vacia o recorrido terminado
ocurrencias(X, [X|L], R1):- ocurrencias(X, L, R2), R1 is R2 + 1. % encontrado, siguiente
ocurrencias(X, [_|L], R):- ocurrencias(X, L, R). % no encontado, siguiente

%d) eliminación de la primera ocurrencia de un elemento.
quitar(_, [], []).
quitar(X, [X|L], L).
quitar(X, [H|L], [H|R]):- quitar(X, L, R),H \= X.

%e) sustitución de la primera ocurrencia de un elemento por otro.
sus(_, _, [], []).
sus(X, Y, [Y|L], [X|L]). % reemplaza Y por X
sus(X, Y, [H|L], [H|R]):- sus(X, Y, L, R),H \= Y.

%f) longitud. Por ejemplo entra [1,2,1,3,4] y sale 5.
long([], 0).
long([_|L], R1):- long(L, R2), R1 is R2 + 1.

%g) prefijo
prefijo([], _).
prefijo([X|L1], [X|L2]):- prefijo(L1, L2).

/*8. Escribir programas para implementar las siguientes operaciones sobre listas:*/
%a) rotación a la izquierda. Ej. entra [1,2,3,4] y sale [2,3,4,1]
rotIzq([], []).
rotIzq([X|L], R):- concat(L, [X], R).

%b) rotación a la derecha. Ej. entra [1,2,3,4] y sale [4,1,2,3]
rotDer([], []).  % Rotar una lista vacía da como resultado una lista vacía.
rotDer([X|L], R) :-
    concat(P, [U], [X|L]),  % Descomponemos la lista en Prefijo y Ultimo
    concat([U], P, R).    % Rotamos moviendo Ultimo al frente de Prefijo
% Utilizado el predicado concat, realizando que la lista a rotar, sea resultado de otra lista y su elemento final
% (descomponiendolo y cambiando posiciones)

%c) eliminación de todas las ocurrencias de un elemento.
quitarTodos(_, [], []).
quitarTodos(X, [X|L], R):- quitarTodos(X, L, R).
quitarTodos(X, [H|L], [H|R]):- quitarTodos(X, L, R),H \= X.

%d) sustitución de todas las ocurrencias de un elemento por otro.
susTodos(_, _, [], []).
susTodos(X, Y, [Y|L], [X|R]):- susTodos(X, Y, L, R).
susTodos(X, Y, [H|L], [H|R]):- susTodos(X, Y, L, R), H \= Y.

%e) cardinalidad (cantidad de elementos no repetidos) Ej. entra [1,2,1,3,4] y sale 4.
card(L, C):- cardAux(L, [], C). %llamado con listado vacio
cardAux([], _, 0). %lista vacia no tiene elementos listados
cardAux([X|L], R, C):- not(existe(X, R)), cardAux(L, [X|R], K), C is K+1. % lo agrega y aumenta el contador
cardAux([X|L], R, C):- existe(X, R), cardAux(L, R, C). % no lo agrega y no aumenta el contador

existe(X, [X|_]).
existe(X, [H|L]):- existe(X, L), H \= X.

%f) inversión. Ej. entra [1,2,3,4] y sale [4,3,2,1].
invertir([], []).
invertir([X|L], R1):- invertir(L, R2), concat(R2, [X], R1).

%g) sufijo
/*Invierto lista y sufijo, compruebo invertidos si es prefijo*/
sufijo(S, L):- invertir(S, SI), invertir(L, LI), prefijo(SI, LI).

/*h) generar a partir de una lista el palíndromo correpondiente. Por ejemplo, a partir de
abcd se genera el palíndromo abcddcba. */
palindromo(L, P):- invertir(L, LI), concat(L, LI, P).

% i) duplicar los elementos de una lista. Por ejemplo, el resultado de doblar [1,2,3] es [1,1,2,2,3,3].
doblar([], []).
doblar([X|L], [X|[X|D]]):- doblar(L, D).

% 9. Suponga que representamos conjuntos mediante listas. Implementar las siguientes operaciones sobre conjuntos:
% a) inclusión
inclusion(L1, L2):- inclusionAux(L1, [], L2).
inclusionAux([], _, _).
inclusionAux([H|T], A, L) :- not(existe(H, A)), existe(H, L), inclusionAux(T, [H|A], L).
inclusionAux([H|T], A, L) :- existe(H, A), inclusionAux(T, A, L).

% b) igualdad
igualdad(L1, L2):- inclusion(L1, L2), inclusion(L2, L1).

% c) unión
union(L1, L2, U):- unionAux(L1, L2, [], U).

unionAux([], [], _, []).
unionAux([], [H|T], A, [H|U]):- not(existe(H, A)), unionAux([], T, [H|A], U).
unionAux([], [H|T], A, U):- existe(H, A), unionAux([], T, A, U).
unionAux([H|T], L, A, [H|U]):- not(existe(H, A)), unionAux(T, L, [H|A], U).
unionAux([H|T], L, A, U):- existe(H, A), unionAux(T, L, A, U).

% d) intersección
interseccion(L1, L2, I):- interseccionAux(L1, L2, [], I).

interseccionAux([], _, _, []).
interseccionAux([H|T], L, A, I):- existe(H, A), interseccionAux(T, L, A, I).
interseccionAux([H|T], L, A, [H|I]):- existe(H, L), interseccionAux(T, L, [H|A], I).
interseccionAux([H|T], L, A, I):- not(existe(H, L)), interseccionAux(T, L, A, I).

% e) diferencia
diferencia(L1, L2, D):- diferenciaAux(L1, L2, [], D).

diferenciaAux([], _, _, []).
diferenciaAux([H|T], L, A, D):- existe(H, A), diferenciaAux(T, L, A, D).
diferenciaAux([H|T], L, A, D):- existe(H, L), diferenciaAux(T, L, A, D).
diferenciaAux([H|T], L, A, [H|D]):- not(existe(H, L)), diferenciaAux(T, L, [H|A], D).
