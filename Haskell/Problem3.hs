--list comp for exactly 3 factors or is divisable by 5  
test1Problem3 n = [x | x <- [1..n], ((findFactors x) == 3) || (x `mod` 5) == 0]
--function to find amount of factors 
findFactors n = length [x | x <- [1..n], n `mod` x == 0]