module Lesson11 where

iterate' :: (a -> a) -> a -> [a]
iterate' f x = x : iterate' f (f x)

numberMadeOfThrees :: [Integer]
numberMadeOfThrees = iterate' ((+3) . (*10)) 3

numberMadeOfThreesAndOnes' :: [Integer]
numberMadeOfThreesAndOnes' = iterate' ((+1) . (*10) . (+2)) 1

dropSpaces :: String -> String
dropSpaces = dropWhile (== ' ')

trim :: String -> String
trim = reverse . dropSpaces . reverse . dropSpaces

