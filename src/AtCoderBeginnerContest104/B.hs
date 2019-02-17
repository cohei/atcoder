module AtCoderBeginnerContest104.B (main) where

import           Data.Char                    (isLower)
import           Text.ParserCombinators.ReadP (ReadP, char, eof, many1,
                                               readP_to_S, satisfy)

main :: IO ()
-- interact を使うと一部失敗する
-- main = interact $ show . f
main = print . f =<< getLine

f :: String -> Result
f s = if not . null . readP_to_S parser $ s then AC else WA

parser :: ReadP ()
parser = char 'A' *> many1 lowerChar *> char 'C' *> many1 lowerChar *> eof

lowerChar :: ReadP Char
lowerChar = satisfy isLower

data Result
  = AC
  | WA
  deriving (Show, Eq)
