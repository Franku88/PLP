fib :: Integer -> Integer
fib 0 = 1
fib 1 = 1
fib x = fib (x-1) + fib(x-2)

square :: Double -> Double
square x = x 
    * x

cube :: Double -> Double
cube x = square x * x

maxi :: Int -> Int -> Int
maxi n m
    | n > m = n
    | otherwise = m

maxi2 :: Int -> Int -> Int
maxi2 n m = if n > m then n else m
     