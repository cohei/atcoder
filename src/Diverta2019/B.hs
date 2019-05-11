module Diverta2019.B (main) where

main :: IO ()
main = do
  [r, g, b, n] <- map read . words <$> getLine
  print $ solve' r g b n

solve :: Int -> Int -> Int -> Int -> Int
solve r g b n =
  length $ filter ((n ==) . sum) $ sequence [rs, gs, bs]
  where
    rs = [0, r .. n]
    gs = [0, g .. n]
    bs = [0, b .. n]

solve' :: Int -> Int -> Int -> Int -> Int
solve' r g b n =
  length $ filter ((n ==) . sum) rgbs
  where
    rgbs =
      [ [r', g', b']
      | r' <- [0, r .. n]
      , g' <- [0, g .. (n - r')]
      , b' <- [0, b .. (n - r' - g')]
      ]
