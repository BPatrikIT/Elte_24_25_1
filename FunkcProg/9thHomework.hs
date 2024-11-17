module Homework where

countEmptyLists :: Num a => [[[b]]] -> [a]
countEmptyLists = map (fromIntegral . length . filter null)

function1 :: (Integer -> Integer) -> Integer
function1 g = g 13

function2 :: (Integer -> Integer -> Integer) -> Integer
function2 g = 2 * (g 25 11)

function3 :: (Integer -> Integer) -> (Integer -> Integer) -> Integer
function3 g h = g 14 + h 15

function4 :: (Integer -> Integer) -> (Integer -> Integer) -> Integer
function4 g h = g (h 1 + h 2) + g 3

function5 :: (Integer -> Integer -> Integer) -> (Integer -> Integer) -> Integer
function5 g h = g (h 1) (g 1 3) + h (g 3 5)

lambda1 :: Integer
lambda1 = function1 (\x -> x * 2)

lambda2 :: Integer
lambda2 = function2 (\x y -> 1 * x - y)

lambda3 :: Integer
lambda3 = function3 (\x -> x * 2) (\y -> y * (-1))

lambda4 :: Integer
lambda4 = function4 (\x -> x * 50) (\y -> y + 7)

lambda5 :: Integer
lambda5 = function5 (\x y -> 2 * x + y) (\z -> z + 118)

propEq :: Eq b => a -> a -> (a -> b) -> Bool
propEq x y f = f x == f y

sumVia :: Num b => (a -> b) -> [a] -> b
sumVia f = sum . map f

concatWith :: (a -> [b]) -> [a] -> [b]
concatWith f = concat . map f