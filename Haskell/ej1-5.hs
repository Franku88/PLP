--(1)
a = (2+3)       -- Realiza suma
-- b = $$-1^1   -- Primero potencia, luego signo -. No compila, parse error on input '$$-'
c = (+)58 2      -- Calcula operacion entre () con el parametro de entrada sin definir tipos
d = 5-4-3       -- OK
e = 7/3
f = 7 `div` 3    -- Calcula div 7 3, como si div fuera operador, usar tildes graves
-- g = 7 `div` $$   -- No compila, $$ no es un parametro aceptable para `div`
h = 7 `mod` 3    -- funcion mod como operador, resto de division entera
i = True || False -- True, disyuncion de True y False. Con resultado Bool True
j = even 9
k = succ 9
l = succ (pred 6)
m = gcd 21 27

--(2)
losCuatroIguales :: Int -> Int -> Int -> Int -> Bool
losCuatroIguales x y z w = losTresIguales x y z && z == w
losTresIguales :: Int -> Int -> Int -> Bool
losTresIguales x y z = x == y && y == z 

--(4)
cuantosIguales:: Int -> Int -> Int -> Int
cuantosIguales x y z 
    | x == y && y == z = 3 
    | x == y || x == z || y == z = 2
    | otherwise = 0
cuantosIgualesDeDos :: Int -> Int -> Int
cuantosIgualesDeDos x y 
    | x == y = 2
    | otherwise = 0

--(5)
-- (a)
fib ::  Integer -> Integer
fib 0 = 1
fib 1 = 1
fib x = fib (x-1) + fib(x-2)
-- (b)
fact :: Integer -> Integer
fact 0 = 1
fact n = n * fact (n-1)
-- (c)
f :: (Integer, Integer) -> Double
f (x, n) = fromInteger(sum (n, n)) / fromInteger(fact x)
    where
        sum :: (Integer, Integer) -> Integer
        sum (n, 1) = 1
        sum (n, i) = (i^n) + sum (n, (i-1))