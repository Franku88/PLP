--(22) Utilizando las definiciones de tipos de Haskell (type) definir estructuras de datos convenientes para:
--(a) Un directorio telefonico
type Nombre = String
type Edad = Int
type Persona = (Nombre, Edad)
type NumeroTelefono = String
type DirectorioTelefonico = [(Persona, NumeroTelefono)]
--(b) Una base de datos de libros (teniendo en cuenta autores y editoriales)
type Autor = (Persona, Int)
type Direccion = (Nombre, Int)
type Editorial = (Nombre, Direccion)
type BDLibros = [(Libro, Autor, Editorial)]

{-(23) Definir funcion tal que, dados tres pares de enteros, debe devolver en un cuarto
par el menor y el mayor elemento de los pares dados. Por ejemplo para la entrada (2,4) (3,5) (4,1)
la salida debe ser (1,5).-}

{-(24) Definir funcion tal que, dado un numero entero, genere la siguiente salida repitiendo la cantidad
de digitos con una linea para cada digito. Ejemplo : para el numero 1534, la salida debe ser como:
1
55555
333
4444
-}

{-(25) Definir la funcion alinear tal que, a partir de tres palabras y un total de caracteres para
una linea, debe dar como salida las palabras de manera que una quede justificada a la izquierda, otra centrada
y la tercera justificada a la derecha dentro de la misma linea. Por ejemplo:
> alinear "hola" "que" "tal" 50
"hola                                                  que                                                  tal"
-}

{-(26) Definir una funcion tal que, dado un intervalo de anios representado por n m pueda mostrar en 
una tabla los anios y la leyenda “es bisiesto” o “no bisiesto”. Un anio es bisiesto si es multiplo de 4 (por ej. 1984),
pero si el anio es multiplo de 100 solo son bisiestos cuando a su vez son multiplos de 400. 
Por ej 1800 no es bisiesto, mientras que 2000 si. Ej: para el intervalo 2000 2004 la tabla seria:
2000 bisiesto
2001 no bisiesto
2002 no bisiesto
2003 no bisiesto
2004 bisiesto
-}

{-(27) Definir una funcion que dada una tripla (a,b,c), genere una cadena con los numeros comprendidos entre a y b
que cumplan con la propiedad de ser multiplos de c. Ej: para la tripla (3, 20, 6) debe generar “6 12 18”-}

{-(28) Definir una funcion tal que, dado un intervalo expresado como (n,m) genere una tabla con los numeros del 
intervalo que sean cuadrados perfectos y la posicion que ocupan dentro del intervalo. Por ejemplo:
> intervalo (2,18)
4 3
9 8
16 15
-}