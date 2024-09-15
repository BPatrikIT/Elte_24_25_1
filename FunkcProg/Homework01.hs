module Hazi1 where

    intExpr1 :: Int
    intExpr2 :: Int
    intExpr3 :: Int

    intExpr1 = 1
    intExpr2 = 2
    intExpr3 = 3

    charExpr1 :: Char
    charExpr2 :: Char
    charExpr3 :: Char

    charExpr1 = 'a'
    charExpr2 = 'b'
    charExpr3 = 'c'

    boolExpr1 :: Bool
    boolExpr2 :: Bool
    boolExpr3 :: Bool

    boolExpr1 = True
    boolExpr2 = False
    boolExpr3 = not boolExpr1

    inc :: Integer -> Integer
    inc x = x + 1
    triple :: Integer -> Integer
    triple x = x * 3
    zero :: Integer
    zero = 0    

    thirteen1 :: Integer
    thirteen1 = inc(triple(inc(triple(inc zero))))

    thirteen2 :: Integer
    thirteen2 = inc(inc(inc(inc(triple(inc(inc(inc zero)))))))

    thirteen3 :: Integer
    thirteen3 = inc(inc(inc(inc(inc(inc(inc(inc(inc(inc(inc(inc(inc zero))))))))))))

    thirteen4 :: String
    thirteen4 = show (inc zero) ++ show (triple(inc zero))

    cmpRem5Rem7 :: Integer -> String
    cmpRem5Rem7 x =
        if (mod x 5) > (mod x 7)
        then "dividing by five gives more remainders" 
        else "dividing by seven gives more remainders"

    foo :: Int -> Bool -> Bool
    foo x y = 
        if y
        then x > 0
        else x <= 0

    bar :: Bool -> Int -> Bool
    bar = flip foo