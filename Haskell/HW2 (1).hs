fib' n = go n 0 1
  where
  go n f s
    | (f + s) > n = []
    | otherwise = if even(f+s) then (f+s) : go n s (f + s) else go n s (f + s)

fib n = sum(fib' n)

oddMulti n = sum [x | x <- [1..n], (x `mod` 2 == 1) && (x `mod` 21 == 0)]

findDiv n =  length [x | x <- [1..n], (findDiv' x) == 8]

findDiv' n = length [x | x <- [1..n], n `mod` x == 0]
