module Main where

  import Dataloader
  import Data.String

  main :: IO ()
  main = do
    images <- loadXTrain 10
    showImage (head (drop 3 images))

  showImage :: [Int] -> IO ()
  showImage list = do
    putStrLn (concatMap toAsciiPixel (take 28 list))
    if null (drop 28 list)
      then putStr ""
      else showImage (drop 28 list)

  toAsciiPixel:: Int -> String
  toAsciiPixel pixelNum
    | pixelNum == 0     = toEnum 46:" "
    | pixelNum < 30     = toEnum 95:" "
    | pixelNum < 100    = toEnum 45:" "
    | pixelNum < 200    = toEnum 61:" "
    | pixelNum < 230    = toEnum 65:" "
    | otherwise         = toEnum 77:" "