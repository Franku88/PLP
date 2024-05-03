{-
import Data.Char (ord)
import Data.Char (chr)
-}

{-(12) Definir una funcion tal que dado un Char que contenga un digito,
devuelva el valor numerico de dicho digito-}
aDigito :: Char -> Int
aDigito x = case x of
    '0' -> 0
    '1' -> 1
    '2' -> 2
    '3' -> 3
    '4' -> 4
    '5' -> 5
    '6' -> 6
    '7' -> 7
    '8' -> 8
    '9' -> 9
    _   -> -1

{-(13) Defina una funcion la cual convierte un digito a su representacion en numeros romanos -}
digitoRomano :: Char -> String
digitoRomano x = case x of
    '1' -> "I"
    '2' -> "II"
    '3' -> "III"
    '4' -> "IV"
    '5' -> "V"
    '6' -> "VI"
    '7' -> "VII"
    '8' -> "VIII"
    '9' -> "IX"
    _   -> "-"

{-(14) Defina una funcion la cual tome tres Strings y retorne un String que cuando se 
imprima muestre los tres Strings en lineas separadas. (Debe usar putStr al result para ver saltos)-}
entreLineas :: String -> String -> String -> String
entreLineas x y z = x ++"\n"++ y ++"\n"++ z ++ "\n"

{-(15) Defina una funcion la cual tome un String y un numero natural n. 
El resultado son n copias de un String concatenado. (Si n=0 debe devolver un String vacio). -}
duplicar :: String -> Int -> String
duplicar cad n 
    | n > 0     = cad ++ (duplicar cad (n-1))
    | otherwise = ""

{-(16) Defina una funcion tal que hacerEspacios n 
devuelva un String de n espacios. -}
hacerEspacios :: Int -> String
hacerEspacios n
    | n > 0     = " " ++ (hacerEspacios (n-1))
    | otherwise = ""

{-(17) Dar una definicion para la funcion de forma que factorialTable m n tabule los valores
de los factoriales desde m hasta n inclusive. Validar los datos de entrada. -}
fact :: Int -> Int
fact 0 = 1
fact n = n * fact (n-1)
factorialTable :: Int -> Int -> String
factorialTable m n
    | m <= n    = "|"++ show(fact m) ++ (factorialTable (m+1) n)
    | otherwise = "|"

{-(18) Definir una funcion de forma que justificarCentro n st nos devuelva un String de 
longitud n en el cual se le han agregado espacios en ambos extremos de st de modo que 
quede centrado. Validar todos los casos. Dar una solucion utilizando la clausula where y otra sin ella. -}
justificarCentro :: Int -> String -> String
justificarCentro n st = esp ++ st ++ esp
    where
        esp = hacerEspacios n
justificarCentro2 :: Int -> String -> String
justificarCentro2 n st = (hacerEspacios n) ++ st ++ (hacerEspacios n)

{-(19) Definir una funcion minMax la cual retorne el minimo y el maximo de una tupla.-}
minMax :: (Double, Double) -> (Double, Double)
minMax(a,b)
        | a < b     = (a,b)
        | otherwise = (b,a)

{-(20) Dar una definicion de una funcion la cual retorna el maximo de dos numeros, 
junto con el numero de veces que aparece. Usando esta u otra funcion defina una 
que haga lo mismo pero con tres argumentos. -}
maxOcurrDos :: Int -> Int -> (String, String)
maxOcurrDos x y = ("Maximo: "++show(max), "Veces: "++ show(veces))
    where
        max   = maxDeTupla (x, y)
        veces = cuentaVecesEnTupla max (x,y)
        --Calcula mayor de (x,y)
        maxDeTupla :: (Int, Int) -> Int
        maxDeTupla (x, y) 
            | x > y = x
            | otherwise = y
        --Cuenta apariciones de z en (x,y)
        cuentaVecesEnTupla :: Int -> (Int, Int) -> Int
        cuentaVecesEnTupla z (x,y) 
            | x == z && y == z = 2
            | x == z || y == z = 1
            | otherwise        = 0

maxOcurrTres :: Int -> Int -> Int -> (String, String)
maxOcurrTres x y z = ("Maximo: "++ show(max), "Veces: "++ show(veces))
    where
        max   = maxDeTupla (x,y,z) --
        veces = cuentaVecesEnTupla max (x,y,z)
        --Calcula mayor de (x,y,z)
        maxDeTupla :: (Int, Int, Int) -> Int
        maxDeTupla (x, y, z) 
            | x > y && x > z = x
            | y > z          = y
            | otherwise      = z
        --Cuenta apariciones de w en (x,y,z)
        cuentaVecesEnTupla :: Int -> (Int, Int, Int) -> Int
        cuentaVecesEnTupla w (x,y,z) 
            | x == w && y == w && z == w = 3
            | (x == w && y == w) || 
                (x == w && z == w) || 
                (y == w && z == w)       = 2
            | x == w || y == w || z == w = 1
            | otherwise                  = 0

{-(21) Dar una definicion para una funcion la cual ordena los tres elementos en orden ascendente.-}
ordenTriple :: (Int,Int,Int) -> (Int, Int,Int)
ordenTriple (x,y,z)
    | y > z     = ordenTriple(x,z,y)
    | x > y     = ordenTriple(y,x,z)
    | x > z     = ordenTriple(z,y,x)
    | otherwise = (x,y,z)