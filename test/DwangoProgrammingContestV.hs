{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Main where

import           Test.Hspec                  (describe, hspec, it, shouldBe)
import           Text.Heredoc                (here)

import qualified DwangoProgrammingContestV.A as A (main)
import qualified DwangoProgrammingContestV.B as B (main)
import           Test                        (shouldInteractAs)

main :: IO ()
main = hspec $ do
  describe "A" $ do
    it "Example 1" $ do
      let
        input = [here|3
1 2 3
|]
        output = [here|1
|]
      A.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input = [here|4
2 5 2 5
|]
        output = [here|0
|]
      A.main `shouldInteractAs` (input, output)

  describe "B" $ do
    it "Example 1" $ do
      let
        input = [here|4 2
2 5 2 5
|]
        output = [here|12
|]
      B.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input = [here|8 4
9 1 8 2 7 5 6 4
|]
        output = [here|32
|]
      B.main `shouldInteractAs` (input, output)
