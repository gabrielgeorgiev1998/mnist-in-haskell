module Dataloader where

  -- import Data.Text hiding (map, take, lines)

  xTrainFile :: Int -> IO [String]
  xTrainFile count = do
    file <- readFile "dataset/X_train.txt"
    return (take count (lines file))

  loadXTrain :: Int -> IO [[Int]]
  loadXTrain count = do
    lines <- xTrainFile count
    let charNums = map words lines
    return (map (map read) charNums)