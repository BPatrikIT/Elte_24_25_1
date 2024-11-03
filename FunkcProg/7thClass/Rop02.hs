module Rop02 where
    longerThan :: [a] -> [a] -> Bool
    longerThan [] [] = False
    longerThan [] _ = False
    longerThan _ [] = True
    longerThan (_:xs) (_:ys) = longerThan xs ys