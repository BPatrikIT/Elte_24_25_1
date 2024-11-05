module Lesson08 where

    data Maybe' a = Nothing' | Just' a
        deriving Show

    safeHEad :: [a] -> Maybe' a
    safeHEad [] = Nothing'
    safeHEad (x:_) = Just' x

    safeDiv :: Int -> Int -> Maybe' Int
    safeDiv _ 0 = Nothing'
    safeDiv x y = Just' (x `div` y)

    add :: Num a => Maybe' a -> Maybe' a -> Maybe' a
    add Nothing' _ = Nothing'
    add _ Nothing' = Nothing'
    add (Just' x) (Just' y) = Just' (x + y)

    doubleHead :: [[a]] -> Maybe' a
    doubleHead [] = Nothing'
    doubleHead ([]:_) = Nothing'
    doubleHead ((x:_):_) = Just' x

    divHead :: [Int] -> Int -> Maybe' Int
    divHead [] _ = Nothing'
    divHead _ 0 = Nothing'
    divHead (x:_) y = Just' (x `div` y)

    lookup' :: Eq a => [(a, b)] -> a -> Maybe' b
    lookup' [] _ = Nothing'
    lookup' ((x, y):xs) key
        | x == key = Just' y
        | otherwise = lookup' xs key

    elemIndex' :: Eq a => [a] -> a -> Maybe' Int
    elemIndex' xs x = elemIndex'' xs x 0
        where
            elemIndex'' [] _ _ = Nothing'
            elemIndex'' (y:ys) x i
                | x == y = Just' i
                | otherwise = elemIndex'' ys x (i + 1)

    data selectValue = First | Second

    data Either' a b = Left' a | Right' b
        deriving Show

    select :: selectValue -> a -> b -> Either' a b
    select First x _ = Left' x
    select Second _ y = Right' y
    
