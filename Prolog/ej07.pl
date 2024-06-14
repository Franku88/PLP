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
miembro(X, [X|L]). % Elemento encontrado
miembro(X, [Y|L]) :- miembro(X, L). % Continua buscando en la lista

%c) cantidad de ocurrencias de un elemento.
ocurrencias(X, [], 0). % lista vacia o recorrido terminado
ocurrencias(X, [Y|L], R):- ocurrencias(X, L, R). % no encontado, siguiente
ocurrencias(X, [X|L], succ(R)):- ocurrencias(X, L, R). % encontrado, siguiente

%d) eliminación de la primera ocurrencia de un elemento.


%e) sustitución de la primera ocurrencia de un elemento por otro.


%f) longitud. Por ejemplo entra [1,2,1,3,4] y sale 5.


%g) prefijo

