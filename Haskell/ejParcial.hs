-- Es el ejercicio 5 del tp
funcion :: Int -> Int -> Float
funcion x n = fromIntegral(sum n)/fromIntegral(fact x) 
    where
        sum :: Int -> Int
        sum i
            | i == 1    = (i^n)
            | otherwise = (i^n) + (sum (i-1)) {-Atento a los parentesis cuando mandas parametros-}
        fact :: Int -> Int
        fact x
            | x == 0    = 1
            | otherwise = x * fact(x-1)
