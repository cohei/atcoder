import           Control.Monad (forM_, replicateM)

main :: IO ()
main = do
  lines' <- getNLine

  forM_ lines' $ \line ->
    putStrLn . (\(a:b:c:d:_) -> yesNo $ f a b c d) . map read . words $ line

getNLine :: IO [String]
getNLine = do
  n <- readLn
  replicateM n getLine

yesNo :: Bool -> String
yesNo b = if b then "Yes" else "No"

f :: Int -> Int -> Int -> Int -> Bool
f initial buy level restock
  | buy > initial = False -- 即死
  | buy > restock = False -- ジリ貧
  | buy <= level = True -- 絶対死なない
  | otherwise =
    let
      step = gcd buy restock -- mod buy で見ると、購入・補充はこのステップで動く
    in
      buy - step + initial `mod` step <= level

test :: Bool
test = output == map (\(a, b, c, d) -> f a b c d) input

input :: [(Int, Int, Int, Int)]
input =
  [ (9, 7, 5, 9)
  , (9, 7, 6, 9)
  , (14, 10, 7, 12)
  , (14, 10, 8, 12)
  , (14, 10, 9, 12)
  , (14, 10, 7, 11)
  , (14, 10, 8, 11)
  , (14, 10, 9, 11)
  , (9, 10, 5, 10) --
  , (10, 10, 5, 10)
  , (11, 10, 5, 10)
  , (16, 10, 5, 10)
  , (1000000000000000000, 17, 14, 999999999999999985)
  , (1000000000000000000, 17, 15, 999999999999999985)
  ]

output :: [Bool]
output =
  [ False
  , True
  , False
  , True
  , True
  , False
  , False
  , True
  , False
  , True
  , True
  , False
  , False
  , True
  ]
