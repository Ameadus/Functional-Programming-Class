functionOne n = [x | x <- [1..n], (((findDiv x) <= 3) && ((findDiv x) >= 1)) || (x `mod` 5) == 0]

findDiv n = length [x | x <- [1..n], n `mod` x == 0]
