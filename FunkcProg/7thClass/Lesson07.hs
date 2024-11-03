module Lesson07 where
    deletions :: [a] -> [[a]]
    deletions [] = []
    deletions (x:xs) = xs : [x:ys | ys <- deletions xs]

    insertions :: a -> [a] -> [[a]]
    insertions e [] = [[e]]
    insertions e l@(x:xs) = (e:l) : [x:ys | ys <- insertions e xs]

    type Point = (Integer, Integer)

    moveX :: Integer -> Point -> Point
    moveX n (x, y) = (x + n, y)

    moveY :: Integer -> Point -> Point
    moveY n (x, y) = (x, y + n)

    type Name = String
    type Birth = String
    type City = String
    type Age = Int
    type Person = (Name, Birth, City, Age)

    person :: Person
    person = ("Patrik", "2001-01-17", "Budapest", 23)

    data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday
        deriving (Show)

    nextDay :: Day -> Day
    nextDay Monday = Tuesday
    nextDay Tuesday = Wednesday
    nextDay Wednesday = Thursday
    nextDay Thursday = Friday
    nextDay Friday = Saturday
    nextDay Saturday = Sunday
    nextDay Sunday = Monday

    instance Eq Day where
        (==) Monday Monday = True
        (==) Tuesday Tuesday = True
        (==) Wednesday Wednesday = True
        (==) Thursday Thursday = True
        (==) Friday Friday = True
        (==) Saturday Saturday = True
        (==) Sunday Sunday = True
        (==) _ _ = False    


    data Fruit = Grape | Apple | Pear
        deriving Show

    data FruitBatch = FruitBatch Fruit Integer
        deriving Show

    sumFruits :: [FruitBatch] -> Integer
    sumFruits [] = 0
    sumFruits (FruitBatch _ n:xs) = n + sumFruits xs

    type NumberOfApples' = Integer
    type NumberOfPears' = Integer
    type NumberOfGrapes' = Integer

    sumDifferentFruits :: [FruitBatch] -> (NumberOfApples', NumberOfGrapes', NumberOfPears')
    sumDifferentFruits [] = (0, 0, 0)
    sumDifferentFruits (x:xs) = (a + as, g + gs, p + ps)
        where
            (as, gs, ps) = sumDifferentFruits xs
            (a, g, p) = getFruit x
            getFruit (FruitBatch Apple n) = (n, 0, 0)
            getFruit (FruitBatch Grape n) = (0, n, 0)
            getFruit (FruitBatch Pear n) = (0, 0, n)