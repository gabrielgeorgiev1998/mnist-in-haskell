module Matrix where
  data Mat = Matrix [[Int]]

  matHeight :: Mat -> Int
  matHeight mat = length mat

  matWidth :: Mat -> Int
  matWidth mat = length (head mat)

  matMul :: Mat -> Mat -> Maybe Mat
  matMul mat1 mat2 = if 

