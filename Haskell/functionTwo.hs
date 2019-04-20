import Data.List

{- call fib (num) for solution -}
fib n = go (fib' n) 0 1
  where
  go n f s
    | (f + s) > n = []
    | otherwise = if isPart(f+s) then (f+s) : go n s (f + s) else go n s (f + s)

fib' 0 = 0
fib' 1 = 1
fib' n = fib' (n-1) + fib' (n-2)

factorial 0 = 1
factorial n = n * factorial (n - 1)

factorialList n = [(factorial x) | x <- [1..n], (factorial x) <= n]

isPart n = n `elem` (factorialList n)
