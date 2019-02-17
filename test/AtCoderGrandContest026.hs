{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Main where

import           Test.Hspec               (describe, hspec, it)
import           Text.Heredoc             (str)

import qualified AtCoderGrandContest026.B as B (main)
import           Test                     (shouldInteractAs)

main :: IO ()
main = hspec $ do
  describe "B" $ do
    it "Example 1" $ do
      let
        input =
          [str|14
              |9 7 5 9
              |9 7 6 9
              |14 10 7 12
              |14 10 8 12
              |14 10 9 12
              |14 10 7 11
              |14 10 8 11
              |14 10 9 11
              |9 10 5 10
              |10 10 5 10
              |11 10 5 10
              |16 10 5 10
              |1000000000000000000 17 14 999999999999999985
              |1000000000000000000 17 15 999999999999999985
              |]
        output =
          [str|No
              |Yes
              |No
              |Yes
              |Yes
              |No
              |No
              |Yes
              |No
              |Yes
              |Yes
              |No
              |No
              |Yes
              |]
      B.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|24
              |1 2 3 4
              |1 2 4 3
              |1 3 2 4
              |1 3 4 2
              |1 4 2 3
              |1 4 3 2
              |2 1 3 4
              |2 1 4 3
              |2 3 1 4
              |2 3 4 1
              |2 4 1 3
              |2 4 3 1
              |3 1 2 4
              |3 1 4 2
              |3 2 1 4
              |3 2 4 1
              |3 4 1 2
              |3 4 2 1
              |4 1 2 3
              |4 1 3 2
              |4 2 1 3
              |4 2 3 1
              |4 3 1 2
              |4 3 2 1
              |]
        output =
          [str|No
              |No
              |No
              |No
              |No
              |No
              |Yes
              |Yes
              |No
              |No
              |No
              |No
              |Yes
              |Yes
              |Yes
              |No
              |No
              |No
              |Yes
              |Yes
              |Yes
              |No
              |No
              |No
              |]
      B.main `shouldInteractAs` (input, output)
