test1Problem1 :: Int -> [Integer]
--make sure to take only every other 
test1Problem1 n = [x | x <-take n $ skips primes]

--gets first then skips every other 
skips (x:y:xs) = x : skips xs
skips _ = []

-- list of primes
primes = 2 : filter (null . tail . isPrime) [3,5..]

isPrime n = factor n primes
    where
        factor n (p:ps)
            | p*p > n        = [n]
            | n `mod` p == 0 = p : factor (n `div` p) (p:ps)
            | otherwise      = factor n ps
