module Helpers where
  dotProduct :: [Int] -> [Int] -> Int 
  dotProduct vector1 vector2 = sum (zipWith (*) vector1 vector2)