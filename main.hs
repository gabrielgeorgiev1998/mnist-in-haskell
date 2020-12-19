{-# LANGUAGE OverloadedStrings #-}

import Data.ByteString as B -- hiding (drop, putStrLn, readFile, unpack, head)
import Data.ByteString.Char8 as C8 -- hiding (drop, take, head)
import Data.Maybe
import Prelude as P -- hiding (drop, length, map, null, readFile, tail, take)

main :: IO ()
main = do
  mnist <- B.readFile "mnist"
  let imagesMatrix = B.take 47040000 (B.drop 16 mnist)
  newLines (P.take 784 (P.drop 784 (readInts imagesMatrix)))

newLines :: [Integer] -> IO ()
newLines numbers = do
  if P.null numbers
    then print("\n")
    else newLinesHelper numbers

newLinesHelper :: [Integer] -> IO()
newLinesHelper numbers = do
  print (P.take 28 numbers)
  newLines (P.drop 28 numbers)

readInts :: ByteString -> [Integer]
readInts str
  | B.null str = []
  | otherwise =
    fst (fromMaybe (0, B.drop 1 str) (readInteger str)) :
    readInts (snd (fromMaybe (0, B.drop 1 str) (readInteger str)))