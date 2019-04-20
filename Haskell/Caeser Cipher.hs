--Alexander Meade HW3 Caeser Cipher
import Data.List
import Data.Char
--table of approx letter freqs used for the crack function 
table :: [Float]
table = [8.2, 1.5, 2.8, 4.3, 12.7, 2.2, 2.0, 6.1, 7.0,
         0.2, 0.8, 4.0, 2.4, 6.7, 7.5, 1.9, 0.1, 6.0,
         6.3, 9.1, 2.8, 1.0, 2.4, 0.2, 2.0, 0.1]

--takes char and turns to int 
let2nat :: Char -> Int
let2nat str = ord str - ord 'a'
--takes int back to char 
nat2let :: Int -> Char
nat2let str = chr(str + ord 'a')
--shift by specified value while keeping in lowercase alpha range of 0-25 
shift :: Int -> Char -> Char
shift x str 
    | (let2nat str) > 25 || (let2nat str) < 0 = str
    | (let2nat str + x) <= 25 = nat2let (((let2nat str) + x) `mod` 26)
    | otherwise = (nat2let ((let2nat str) + x))
--encodes a string using the shift function 
encode :: Int -> String -> String 
encode x str = [shift x xs | xs <- str]
--decodes a string encoded with prev func 
decode :: Int -> String -> String
decode x str = [shift (-x) xs | xs <- str]
--find num of lower case letters 
lowers :: String -> Int 
lowers str = length [x | x <- str, (let2nat x <= 25) && (let2nat x >= 0)]
--counts num of char in a string 
count :: Char -> String -> Int 
count x str = length [ xs | xs <- str, xs  == x]
--finds % of one int with respect to another
percent :: Int -> Int -> Float 
percent x y = (fromIntegral x / fromIntegral y) * 100 
--finds the % frequency of lower case letters 
freqs :: String -> [Float]
freqs str = [(percent (count x str) (lowers str)) | x <-['a'..'z']]
--rotates a lies to the left n places with wrap around
rotate :: Int -> [a] -> [a]
rotate x str = (drop x str) ++ (take x str)
--chi square statistic function for list of frequencies 
chisqr :: [Float] -> [Float] -> Float
chisqr x y = sum [(((os - es)^2)/es) | (os,es) <- zip x y]
--first position 0 indexed at which a value occurs 
position x str = head(elemIndices x str)
--attempts to decode the string by calculating freqs of chars in the string then chisq value of the rotation
crack :: String -> String
crack str = decode factor str 
            where factor = (position ( minimum array) array) --position of min value to use as shift 
                  array = [chisqr (rotate xs freqAm) table | xs <- [0..25]] --find chisqr of rotation
                  freqAm = freqs str --find frequency of letters 