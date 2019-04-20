bubbleSort'' (x:y:xs)
    | x > y = y : bubbleSort'' (x:xs)
    | otherwise = x : bubbleSort'' (y:xs)
bubbleSort'' (x) = (x)

bubbleSort' xs z
    | z == (length xs) = xs
    | otherwise = bubbleSort' (bubbleSort'' xs) (z + 1)

bubbleSort xs = bubbleSort' xs 0
