multipleOf5 n = [n | n <- [1..n], n `mod` 5 == 0]

multipleOf7Or11 n = [n | n <- [1..n], n `mod` 7 == 0 || n `mod` 11 == 0]

multipleOf3And7 n = [n | n <- [1..n], n `mod` 7 == 0 && n `mod` 3 == 0]