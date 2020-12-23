module AtCoderBeginnerContest183.D (main) where

import           Control.Monad         (replicateM)
import           Data.ByteString.Char8 (ByteString)
import qualified Data.ByteString.Char8 as BS (dropWhile, getLine, readInt)
import           Data.Char             (isSpace)
import           Data.List             (scanl', unfoldr)
import           Data.Map              (Map)
import qualified Data.Map              as M (elems, fromListWith)

main :: IO ()
main = do
  [n, w] <- map read . words <$> getLine
  inputs <- replicateM n $ do
    -- 入力を String で受けると TLE
    [s, t, p] <- readInts <$> BS.getLine
    pure (s, t, p)
  putStrLn $ yesNo $ solve w inputs

readInts :: ByteString -> [Int]
readInts = unfoldr $ (fmap . fmap $ BS.dropWhile isSpace) . BS.readInt

yesNo :: Bool -> String
yesNo False = "No"
yesNo True  = "Yes"

type Time = Int
type ChangeTable = Map Time Int

solve :: Int -> [(Time, Time, Int)] -> Bool
solve w = all (<= w) . scanl' (+) 0 . M.elems . makeChangeTable . decompose

makeChangeTable :: [(Time, Int)] -> ChangeTable
makeChangeTable = M.fromListWith (+)

decompose :: [(Time, Time, Int)] -> [(Time, Int)]
decompose = concatMap $ \(start, end, quantity) -> [(start, quantity), (end, -quantity)]
