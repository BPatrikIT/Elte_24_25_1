module LEsson04 where

    -- [_ : (z, x:xs)):foo@(y : ys)] -@ naming
    import Data.List
    ------------------------
    -- Rekurzió
    ------------------------

    add1' :: Num a => [a] -> [a]
    add1' [] = []
    add1' (x:xs) = (x + 1) : add1' xs

    fact :: Integer -> Integer
    fact 0 = 1
    fact n = n * fact (n - 1) 

    -- Feladatok

    sum' :: Num a => [a] -> a
    sum' [] = 0
    sum' (x:xs) = x + sum' xs

    product' :: Num a => [a] -> a
    product' [] = 1
    product' (x:xs) = x * product' xs

    elem' :: Eq a => a -> [a] -> Bool
    elem' _ [] = False
    elem' n (x:xs) = n == x || elem' n xs

    genericLength' :: Num b => [a] -> b
    genericLength' [] = 0
    genericLength' (_:xs) = 1 + genericLength' xs

    factorial :: Integral a => a -> a
    factorial 0 = 1
    factorial n = product' [1..n]

    replicateFact :: [a] -> b -> [b]
    replicateFact i e = replicate (factorial (length i)) e

    replicateFact' :: [a] -> b -> [b]
    replicateFact' i e = genericReplicate (factorial (genericLength' i)) e

    ( +++ ) :: [a] -> [a] -> [a]
    ( +++ ) [] [] = []
    ( +++ ) [] l@(x:xs) = l
    ( +++ ) l@(x:xs) [] = l
    ( +++ ) (x:xs) l@(y:ys) = x : ( +++ ) xs l

    concat' :: [[a]] -> [a]
    concat' [] = []
    concat' (x:xs) = x +++ concat' xs

    nub' :: Eq a => [a] -> [a]
    nub' [] = []
    nub' (x:xs)
        | elem' x xs = nub' xs
        | otherwise = x : nub' xs

    numberWords :: String -> [(Int, String)]
    numberWords s = zip [1..] (words s)