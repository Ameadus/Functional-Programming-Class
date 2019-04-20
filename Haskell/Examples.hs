isPalindrome n = (show n) == (reverse (show n))
reverseNumber n = 0 + (read (reverse(show n)))
maxPalVal = maximum [x*y | x<-[100..999],y<-[100..999], isPalindrome (x*y) ] 

--succ 9 * 10 = 100
doubleMe x = x + x

--triangles 
triangles = [ (a,b,c) | c <- [1..10], b <- [1..10], a <- [1..10] ]
rightTriangles = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2 ]
rightTriangles' = [ (a,b,c) | c <- [1..10], b <- [1..c], a <- [1..b], a^2 + b^2 == c^2, a+b+c == 24 ]

--association patter recongition 
lucky 13 = "Unlucky for you"
lucky 7  = "This is your lucky day!"
lucky x = "Better luck next time"

--
findDiv n =  length [x | x <- [1..n], (findDiv' x) == 8]

findDiv' n = length [x | x <- [1..n], n `mod` x == 0]

--slow fib 
fib 0 = 1
fib 1 = 1
fib x = fib(x-1) + fib(x-2)

--diff fibanochii way 
fib' n = go n 0 1
  where
  go n f s
    | (f + s) > n = []
    | otherwise = if even(f+s) then (f+s) : go n s (f + s) else go n s (f + s)

fibbo n = sum(fib' n)

--black magic fib way 
fibs = 1 : 1 : zipWith (+) fibs (tail fibs)

--even fib only 
evenFib n = go n 1 2
    where 
    go n f s
      | (f+s) > n = []
      | otherwise = if (f+s) `mod` 2 == 0 then (f+s) : go n s (f+s) else go n s (f+s)

--isPrime function Lincker way 
isPrime 0 = False
isPrime 1 = False
isPrime n = ip n [2..(n `div` 2)]

ip _ [] = True
ip n (x:xs)
    | n `mod` x == 0 = False
    | otherwise = ip n xs

--isPrime my way 
isPrime' 1 = False 
isPrime' 2 = True
isPrime' n = isPrimeRec n (n-1)
isPrimeRec _ 1 = True
isPrimeRec n t = if ( n `rem` t) == 0 then False else isPrimeRec n (t-1)

nextPrime :: Int -> Int
nextPrime n | isPrime n = n  
            | otherwise = nextPrime (n+1)

--factorial methods 
factorialIter x = product [1..x]

factorial 0 = 1
factorial n = n * factorial(n-1)

factorial' n = go n 1
  where
  go n ret
   | n > 1     = go (n - 1) (ret * n)
   | otherwise = ret

--recursive count 
counter x y = if x > 0 then counter (x-1) (y+1) else y

--recurisve sum 
sum' :: (Num a) => [a] -> a 
sum' [] = 0  
sum' (x:xs) = x + sum' xs

--max with guards 
max' a b   
    | a > b     = a  
    | otherwise = b

replicate' n x  
    | n <= 0    = []  
    | otherwise = x:replicate' (n-1) x

reverse' [] = []  
reverse' (x:xs) = reverse' xs ++ [x] 

take' n _  
      | n <= 0   = []  
take' _ []     = []  
take' n (x:xs) = x : take' (n-1) xs 

zip' :: [a] -> [b] -> [(a,b)]  
zip' _ [] = []  
zip' [] _ = []  
zip' (x:xs) (y:ys) = (x,y):zip' xs ys 

--two quick sort 
quicksort (x:xs) = quicksort [y | y <- xs, y <= x] ++ [x] ++ quicksort [y | y <- xs, y > x]

quicksort' :: (Ord a) => [a] -> [a]  
quicksort' [] = []  
quicksort' (x:xs) =   
    let smallerSorted = quicksort' [a | a <- xs, a <= x]  
        biggerSorted = quicksort' [a | a <- xs, a > x]  
    in  smallerSorted ++ [x] ++ biggerSorted

isqrt :: Integral i => i -> i
isqrt = floor . sqrt . fromIntegral

elementAt :: [a] -> Int -> a
elementAt list i    = list !! (i-1)

dupli list = concat [[x,x] | x <- list]

dropEvery :: [a] -> Int -> [a]
dropEvery [] _ = []
dropEvery (x:xs) n = dropEvery' (x:xs) n 1 where
    dropEvery' (x:xs) n i = (if (n `divides` i) then
        [] else
        [x])
        ++ (dropEvery' xs n (i+1))
    dropEvery' [] _ _ = []
    divides x y = y `mod` x == 0

decompose x
     | x == 0 = []

--bubble sort 
bubbleSort'' (x:y:xs)
    | x > y = y : bubbleSort'' (x:xs) -- : means concate op 
    | otherwise = x : bubbleSort'' (y:xs)
bubbleSort'' (x) = (x)

bubbleSort' xs z
    | z == (length xs) = xs
    | otherwise = bubbleSort' (bubbleSort'' xs) (z + 1)

bubbleSort xs = bubbleSort' xs 0

--merge sort 
mergesort'merge :: (Ord a) => [a] -> [a] -> [a]
mergesort'merge [] xs = xs
mergesort'merge xs [] = xs
mergesort'merge (x:xs) (y:ys)
    | (x < y) = x:mergesort'merge xs (y:ys)
    | otherwise = y:mergesort'merge (x:xs) ys
 
mergesort'splitinhalf :: [a] -> ([a], [a])
mergesort'splitinhalf xs = (take n xs, drop n xs)
    where n = (length xs) `div` 2 
 
mergesort :: (Ord a) => [a] -> [a]
mergesort xs 
    | (length xs) > 1 = mergesort'merge (mergesort ls) (mergesort rs)
    | otherwise = xs
    where (ls, rs) = mergesort'splitinhalf xs

isSumOfConsecutiveSquares n s = isocs n s 0
    where
    isocs n s t
      | t == n = True
      | t > n = False
      | otherwise = isocs n (s+1) (t+(s*s))
