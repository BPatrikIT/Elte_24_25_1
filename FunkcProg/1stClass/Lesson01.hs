module Lesson01 where

one :: Int
one = 1

two :: Integer
two = 2

a :: Int
a = div 10 5

minusOne :: Int
minusOne = -1

inc :: Int -> Int
inc x = x + 1

c :: Char
c = 'a'

b :: Bool
b = True || False -- || - or, && - and, not - not

x = 4.23 -- Float - 32bit, Double - 64bit

hello :: String
hello = "Hello, World!"

z :: Bool -> Bool
z b = not b

hello2 :: String
hello2 = "Hello, " ++ "World!"

hello3 :: String -> String
hello3 name = "Hello, " ++ name ++ "!"