module Matrix where
  newtype Mat = Matrix [[Int]] deriving (Show, Eq)

  matHeight :: Mat -> Int
  matHeight (Matrix mat) = length mat

  matWidth :: Mat -> Int
  matWidth (Matrix mat) = length (head mat)

  matTranspose :: Mat -> Mat
  matTranspose (Matrix mat) = Matrix (matTransposeHelper mat)
    
    -- (map head mat):(matTransposeHelper (map tail mat))

  matTransposeHelper :: [[Int]] -> [[Int]]
  matTransposeHelper mat = if null (head mat)
    then []
    else map head mat:matTransposeHelper (map tail mat)


  matMul :: Mat -> Mat -> Maybe Mat
  matMul mat1 mat2 = if (matWidth mat1)/=(matHeight mat2)
    then Nothing
    else Nothing

