module Lesson10 where

span' :: (a -> Bool) -> [a] -> ([a], [a])
span' _ [] = ([], [])
span' p (x:xs)
  | p x = (x:ys, zs)
  | otherwise = ([], x:xs)
  where (ys, zs) = span' p xs

find' :: (a -> Bool) -> [a] -> Maybe a
find' _ [] = Nothing
find' p (x:xs)
  | p x = Just x
  | otherwise = find' p xs