% Ej01
progenitor(cecilia,gabriel). progenitor(javier,gabriel). progenitor(silvia,carlos).
progenitor(jorge,carlos). progenitor(tomas,pedro). progenitor(jose,juan). 
progenitor(daniel,laura). progenitor(andrea,laura). progenitor(rodolfo,damian). 
progenitor(claudia,damian). 
progenitor(juan,ana). progenitor(juan,luis).
progenitor(maria,ana).  progenitor(maria,pablo). progenitor(maria,luis).
progenitor(pedro,pablo). progenitor(pedro,luciano). progenitor(pedro,ariel).
progenitor(laura,luciano). progenitor(laura,ariel). 
progenitor(eugenia,maria). progenitor(eugenia,rodolfo). progenitor(eugenia,sandra).
progenitor(martin,maria). progenitor(martin,rodolfo).  progenitor(martin,sandra). 
progenitor(norma,andrea). progenitor(norma,cecilia). 
progenitor(carlos,andrea). progenitor(carlos,cecilia). 

femenino(ana). femenino(maria). femenino(laura). femenino(eugenia). 
femenino(andrea). femenino(sandra). femenino(claudia). femenino(norma). 
femenino(cecilia). femenino(silvia).
masculino(juan). masculino(pedro). masculino(ariel). masculino(luciano). 
masculino(luis). masculino(pablo). masculino(tomas). masculino(jose). 
masculino(jorge). masculino(javier). masculino(gabriel). masculino(carlos). 
masculino(damian). masculino(rodolfo). masculino(martin). masculino(daniel).

/* a) Defina e implemente en PROLOG los predicados: */
% padre y madre
padre(X,Y):- progenitor(X,Y),masculino(X).
madre(X,Y):- progenitor(X,Y),femenino(X).
% hermano (genérico, es decir hermano y hermana): tenga en cuenta que Ud. no es su hermano.
hermano(X,Y):- padre(H,X), padre(H,Y), madre(M,X), madre(M,Y),  X\=Y.
% abuelo y bisabuelo
abuelo(X,Y):- progenitor(X,W), progenitor(W,Y).
bisabuelo(X,Y):- progenitor(X,W), abuelo(W,Y).
% tío y primo
tio(X,Y):- hermano(X,W), progenitor(W,Y).
primo(X,Y):- tio(W,X), progenitor(W,Y).
% ancestro
ancestro(X,Y):- progenitor(X,Y).
ancestro(X,Y):- progenitor(X,W),ancestro(W,Y).

/* b) Considere agregar los siguientes hechos: */
casado(juan, maria).
casado(pedro, laura).
casado(eugenia, martin).
casado(daniel, andrea).
casado(cecilia,javier).
casado(rodolfo, claudia).
casado(norma,carlos).

% defino matrimonio para utilizar casado(X,Y) en ambos sentidos
matrimonio(X,Y):- casado(X,Y).
matrimonio(X,Y):- casado(Y,X).

/* c) Defina e implemente en PROLOG los predicados: */
% soltero
soltero(X):- \+matrimonio(X,_).
% amante
amante(X,Y):- matrimonio(X,M),progenitor(X,H),progenitor(Y,H),M\=Y,X\=Y.
amante(X,Y):- matrimonio(Y,M),progenitor(Y,H),progenitor(Y,H),M\=X,X\=Y.
% suegra y suegro
suegra(X,Y):- matrimonio(Y,W), madre(X,W).
suegro(X,Y):- matrimonio(Y,W), padre(X,W).

/* d) Indique la/s respuesta/s de las siguientes consultas:
?- madre(X,laura).
X = andrea.
?- abuelo(tomas,Y)
Y = pablo ;
Y = luciano ;
Y = ariel.
?- ancestro(X,luciano).
X = pedro ;
X = laura ;
X = silvia ;
X = jorge ;
X = tomas ;
X = daniel ;
X = andrea ;
X = norma ;
X = carlos ;
false.
?- ancestro(jorge,Y).
Y = carlos ;
Y = andrea ;
Y = cecilia ;
Y = laura ;
Y = luciano ;
Y = ariel ;
Y = gabriel ;
false.
?- soltero(luis).
true.
?- soltero(jose): ¿es correcta la respuesta?
true.
?- amante(X,Y). 
false. (deberia retornar otra cosa?) */

/* e) Realice las siguientes consultas e indique la respuesta:
Según su definición ¿es Pablo hermano de Luis?
?- hermano(pablo,luis).
false.
Pedro, ¿de quién es padre?
?- padre(pedro,X).
X = pablo ;
X = luciano ;
X = ariel.
¿Quién es suegro de María?
?- suegro(X,maria). 
X = jose.
¿Quiénes son hermanos?
?- hermano(X,Y). 
X = ana, Y = luis ;
X = luis, Y = ana ;
X = luciano, Y = ariel ;
X = ariel, Y = luciano ;
X = maria, Y = rodolfo ;
X = maria, Y = sandra ;
X = rodolfo, Y = maria ;
X = rodolfo, Y = sandra ;
X = sandra, Y = maria ;
X = sandra, Y = rodolfo ;
X = andrea, Y = cecilia ;
X = cecilia, Y = andrea ;
false.
¿De quién es primo Damián?
?- primo(damian,X).
X = ana ;
X = pablo ;
X = luis ;
false.
¿Quiénes son tíos de Pablo?

¿De quién es Luciano bisnieto?

¿Quiénes son descendientes de Silvia?

¿Quiénes son solteros?

*/
