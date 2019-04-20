--mod 10 == 3 returns 3 to rightmost 
test1Problem2 n = [ (fib' x) | x <- [1..n], ((fib' x) <= n) && ((fib' x) `mod` 10) == 3 && ((fib' x) >= 0)]

--fast fib 
fibs = 1 : 2 : zipWith (+) fibs (tail fibs)
--select nth val 
fib' n = fibs !! n