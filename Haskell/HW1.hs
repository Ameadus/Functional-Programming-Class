multiples maxNumber = [x | x <- [1..maxNumber], (x `mod` 5 == 0) && (x `mod` 7 == 0)]
doubleAll maxNumber = [x*2 | x <- [1..maxNumber]]
squareEvens maxNumber = [x*x | x <- [1..maxNumber], x `mod` 2 == 0]
