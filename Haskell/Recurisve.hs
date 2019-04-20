--recursive function

fibonacci 0 = 0
fibonacci 1 = 1
fibonacci n = fibonacci (n - 1) + fibonacci(n - 2)

factorial 0 = 1
factorial n = n * factorial(n - 1)

isPrime 1 = False 
isPrime 2 = True
isPrime n = isPrimeRec n (n-1)
isPrimeRec _ 1 = True
isPrimeRec n t = if ( n `rem` t) == 0 then False else isPrimeRec n (t-1)