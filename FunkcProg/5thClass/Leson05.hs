module Lesson05 where
    pl :: Integer -> Integer -> Bool
    pl x y = even (x + y) && (x + y) `mod` 3 == 0

    ------------- Where
    pl2 :: Integer -> Integer -> Bool
    pl2 x y = even z && z `mod` 3 == 0
        where
            z = x + y

    ------------- Let
    pl3 :: Integer -> Integer -> Bool
    pl3 x y = let z = x + y
              in even z && z `mod` 3 == 0

    
    foo x y = (let z = x + y in z + 2) + (let z = x + y in z + 32)

    ------------- Feladatok

    numberWords' :: [a] -> [(a, Integer)]
    numberWords' xs = zip xs z
        where
            z = [0..]

    numberWords'' :: [a] -> [(Int, a)]
    numberWords'' l = foo 1 l
        where
            foo _ [] = []
            foo n (x:xs) = (n, x) : foo (n + 1) xs

    showList' :: Show a => [a] -> String
    showList' l = "[" ++ foo' l ++ "]"
        where
            foo' [] = "[]"
            foo' [x] = show x
            foo' (x:xs) = show x ++ ", " ++ foo' xs

    --unzip' :: [(a, b)] -> ([a], [b])
    --unzip' [] = ([], [])
    --unzip' (x:xs) = (a : foo xs, b : foo xs)
    --    where
    --        (a, b) = x

    ------------- Megcsináni -- + Pontot kapunk érte

    reverse' :: [a] -> [a]
    reverse' [] = []
    reverse' l = foo l []
        where
            foo [] acc = acc
            foo (x:xs) acc = foo xs (x : acc)
