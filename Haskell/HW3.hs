import Data.Char
import Data.List

table :: [Float]
table = [8.2, 1.5, 2.8, 4.3, 12.7, 2.2, 2.0, 6.1, 7.0,
        0.2, 0.8, 4.0, 2.4, 6.7, 7.5, 1.9, 0.1, 6.0,
        6.3, 9.1, 2.8, 1.0, 2.4, 0.2, 2.0, 0.1]

let2nat :: Char -> Int
let2nat str = ord str - ord 'a'

nat2let :: Int -> Char
nat2let str  = chr(ord 'a' + str)

shift :: Int -> Char -> Char
shift x str
    | (let2nat str) > 25 || (let2nat str) < 0 = str
    | ((let2nat str) + x) <= 25   = nat2let (((let2nat str) + x) `mod` 26)
    | otherwise = (nat2let ((let2nat str) + x))

encode :: Int -> String -> String
encode x str = [shift x xs | xs <- str]

decode :: Int -> String -> String
decode x str = [shift (-x) xs | xs <- str]

lowers :: String -> Int
lowers str = length [x | x <- str, (let2nat x <= 25) && (let2nat x >= 0)]

count :: Char -> String -> Int
count x str = length [xs | xs <- str, xs == x]

percent :: Int -> Int -> Float
percent x y = (fromIntegral x / fromIntegral y) * 100

freqs :: String -> [Float]
freqs str = [(percent (count x str) (lowers str)) | x <- ['a'..'z']]

rotate :: Int -> [a] -> [a]
rotate x str = (drop x str) ++ (take x str)

chisqr :: [Float] -> [Float] -> Float
chisqr x y = sum [(((xs - ys)^2)/ys) | (xs,ys) <- zip x y]

position x str = head(elemIndices x str)

crack :: String -> String
crack x = decode factor x
           where factor = (position (minimum array) array)
                 array = [chisqr (rotate xs dataT) table | xs <- [0..25]]
                 dataT = freqs x
