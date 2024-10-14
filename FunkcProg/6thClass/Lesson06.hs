module Lesson06 where
    fact n
        | n < 1 = 1
        | otherwise = n * fact (n - 1)

    take' :: (Num a, Ord a) => a -> [b] -> [b]
    take' _ [] = []
    take' n (x:xs)
        | n < 1 = []
        | otherwise = x : take' (n - 1) xs

    drop' :: (Num a, Ord a) => a -> [b] -> [b]
    drop' _ [] = []
    drop' n (x:xs)
        | n < 1 = x:xs
        | otherwise = drop' (n - 1) xs

    replicate' :: Integral a => a -> b -> [b]
    replicate' n e
        | n <= 0 = []
        | otherwise = e : replicate' (n - 1) e

    tails' :: [a] -> [[a]]
    tails' [] = [[]]
    tails' a
        | null a = [[]]
        | otherwise = a : tails' (drop' 1 a)

    inits' :: [a] -> [[a]]
    inits' [] = [[]]
    inits' l@(x:xs) = inits' (init l) ++ [l]

    --quickSort

    --mergeSort