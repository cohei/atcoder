module TenkaichiProgrammerContest2014YosenB.A (main) where

import           Data.Either        (fromRight)
import           Data.List          (dropWhileEnd)
import           Text.Parsec        (anyChar, many, manyTill, parse, string,
                                     try)
import           Text.Parsec.String (Parser)

main :: IO ()
main = interact $ (<> "\n") . replaceHAGIYA . dropWhileEnd (== '\n')

hagiya = "HAGIYA"
hagixile = "HAGIXILE"

replaceHAGIYA :: String -> String
replaceHAGIYA s = fromRight s $ parse parser "stdin" s

parser :: Parser String
parser =
  (\former latter -> former <> hagixile <> latter)
    <$> manyTill anyChar (try (string hagiya))
    <*> many anyChar
