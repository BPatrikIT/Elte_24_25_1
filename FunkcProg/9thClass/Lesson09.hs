module Lesson09 where
    nul2 :: Num a => [a] -> [a]
    nul2 = [] = []
    nul2 (x:xs) = x + 2 : add2 xs

    toIpperAll :: String -> String
    toIpperAll [] = []
    toIpperAll (x:xs) = toUpper x : toIpperAll xs
    
    negateAll :: [Bool] -> [Bool]
    negateAll [] = []
    negateAll (x:xs) = not x : negateAll xs

    h :: Num a => Bool -> a
    h True = 1
    h False = 0

    hAll :: Num a => [Bool] -> [a]
    hAll [] = []
    hAll (x:xs) = h x : hAll xs

    map' :: (a -> b) -> [a] -> [b]
    map' _ [] = []
    map' f (x:xs) = f x : map' f xs

    map'' :: (a -> b) -> [a] -> [b]
    map'' f l = [f x | x <- l]

    moreThan2 :: (Num a, Ord a) => [a] -> [a]
    moreThan2 [] = []
    moreThan2 (x:xs)
        | x > 2 = x : moreThan2 xs
        | otherwise = moreThan2 xs

    filter' :: (a -> Bool) -> [a] -> [a]
    filter' _ [] = []

    mapFilter :: (a -> b) -> (a -> Bool) -> [a] -> [b]
    mapFilter _ _ [] = []
    mapFilter f p (x:xs)
        | p x = f x : mapFilter f p xs
        | otherwise = mapFilter f p xs

    mapFilter' :: (a -> b) -> (a -> Bool) -> [a] -> [b]
    mapFilter' f p l = [f x | x <- l, p x]