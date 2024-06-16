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
card(L, C):- cardAux(L, [], C). %llamado con ninguno listado
cardAux([], _, 0). %lista vacia no tiene elementos listados
%si no puede agregar a la lista de elementos, entonces se encontro en la lista original (0)
cardAux([X|L], R, C):- agregaNuevo(X, R, 0, R), cardAux(L, R, C).
%si puede agregar a la lista de elementos, entonces no se encontro en la lista original (1)
cardAux([X|L], R1, C1):- agregaNuevo(X, R1, 1, R2), cardAux(L, R2, C2), C1 is C2+1.
agregaNuevo(X, [], 1, [X]). % Agrega si no esta, retorna 1
agregaNuevo(X, [X|L], 0, [X|L]). % No agrega si esta, retorna 0
agregaNuevo(X, [H|L], E, [H|R]):- agregaNuevo(X, L, E, R), H \= X. % Si no encontrado, busca en el resto de la lista
/*DEBERIA HACERLO SOLO CON buscar EN LUGAR DE agregaNuevo*/
/* buscar(X, [], 0). % retorna 0 si no es encontrado
buscar(X, [X|L], 1). % retorna 1 si es encontrado
buscar(X, [H|L], R):- buscar(X, L, R), H \= X. */

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

% b) igualdad

% c) unión

% d) intersección

% e) diferencia
