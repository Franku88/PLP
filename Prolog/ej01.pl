% Ej01
progenitor(cecilia,gabriel). progenitor(javier,gabriel). progenitor(silvia,carlos).
progenitor(jorge,carlos). progenitor(tomas,pedro). progenitor(jose,juan). 
progenitor(daniel,laura). progenitor(andrea,laura). progenitor(rodolfo,damian). 
progenitor(claudia,damian). 
progenitor(juan,ana). progenitor(juan,luis).
progenitor(maria, ana).  progenitor(maria,pablo). progenitor(maria,luis).
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
casado(eugenia, martin).
casado(daniel, andrea).
casado(cecilia,javier).
casado(pedro, laura).
casado(rodolfo, claudia).
casado(norma,carlos).

/* c) Defina e implemente en PROLOG los predicados: */
% soltero
soltero(X):- not(casado(X,_)).
% amante
amante(X,Y):- soltero(X), casado(Y,_).
amante(X,Y):- soltero(Y), casado(X,_).
% suegra y suegro
suegra(X,Y):- casado(X,W), madre(Y,W).
suegro(X,Y):- casado(X,W), padre(Y,W),
