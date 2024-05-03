-- (6) Devuelve True excepto cuando sus dos argumentos son ambos True.
nAnd :: Bool -> Bool -> Bool
nAnd b1 b2
    | b1 && b2 = False
    | otherwise = True

-- (7) Simplificar:
funny x y z
    | x > z = True
    | x >= y = False
    | otherwise = True
--Simplificado:
funny2 x y z = x < y

-- (8)
{- Se podria utilizar la funcion “/=” con la propiedad que m /= n es True si m y n no son iguales.
Probar la funci´on allDiferent con diferentes valores.-}
allDifferent :: Int -> Int -> Int -> Bool
allDifferent x y z = (x /= y) && (y /= z) && (x /= z)

-- (9)
{- ¿Que encuentra incorrecto en el siguiente codigo?
Probar esta definicion con los valores probados en el punto 8 -}
allDiferent :: Int -> Int -> Int -> Bool
allDiferent n m p = (n /= m) && (m /= p)
-- Falta comparar n con p, ya que estos podrian ser iguales

-- (10)
-- Dar la definicion de la funcion cuartaPotencia :: Int -> Int
cuartaPotencia :: Int -> Int
cuartaPotencia x = x*x*x*x
-- Dar otra definicion que use alCuadrado
cuartaPotencia2 :: Int -> Int
cuartaPotencia2 x = alCuadrado (alCuadrado x)
alCuadrado :: Int -> Int
alCuadrado x = x*x
