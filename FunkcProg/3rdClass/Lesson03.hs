module Lesson03 where

    import Data.Char

    -- data [a] = [] | a : [a]
    -- 1 : 2 : 3 : []
    -- [1,2,3]

    null' :: [a] -> Bool
    null' [] = True
    null' _ = False

    head' :: [a] -> a
    head' (x:_) = x

    tail' :: [a] -> [a]
    tail' (_:xs) = xs

    foo (1:_) = "One"
    foo (2:_) = "Two"

    second :: [a] -> a
    second (_:x:_) = x

    -- [ x | x <- [1..10], x `mod` 2 == 0 ]

    onlyUpper :: String -> String
    --onlyUpper xs = [ x | x <- xs, x `elem` ['A'..'Z'] ]
    onlyUpper l = [c | c <- l, isUpper c]