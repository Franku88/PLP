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
sus(X, Y, [H|L], [H|R]):- sus(X, Y, L, R),H \= X.

%f) longitud. Por ejemplo entra [1,2,1,3,4] y sale 5.
long([], 0).
long([_|L], R1):- long(L, R2), R1 is R2 + 1.

%g) prefijo
prefijo([], _).
prefijo([X|L1], [X|L2]):- prefijo(L1, L2).
