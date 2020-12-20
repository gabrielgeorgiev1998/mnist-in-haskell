-- matrices are represented by nested Int lists


module Matrix where

  import Data.Maybe
  import Helpers (dotProduct)

  matHeight :: [[Int]] -> Int
  matHeight = length

  matWidth :: [[Int]] -> Int
  matWidth mat = length (head mat)

  matTranspose:: [[Int]] -> [[Int]]
  matTranspose mat = if null (head mat)
    then []
    else map head mat:matTranspose (map tail mat)

  matMul :: [[Int]] -> [[Int]] -> [[Int]]
  matMul mat1 mat2
    | matWidth mat1 /= matHeight mat2    = error "Matrix dimensions do not match"
    | otherwise                          = [ [dotProduct row column | column <- matTranspose mat2] | row <- mat1]
