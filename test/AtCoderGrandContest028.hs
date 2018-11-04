{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Main where

import           Test.Hspec               (describe, hspec, it, shouldBe)
import           Text.Heredoc             (here)

import qualified AtCoderGrandContest028.A as A (everyN, main)
import qualified AtCoderGrandContest028.B as B (main)
import           Test                     (shouldInteractAs)

main :: IO ()
main = hspec $ do
  describe "A" $ do
    describe "everyN" $ do
      it "take every n elements" $ do
        A.everyN 3 [1..10 :: Int] `shouldBe` [1, 4, 7, 10]

    it "Example 1" $ do
      let
        input = [here|3 2
acp
ae
|]
        output = [here|6
|]
      A.main `shouldInteractAs` (input, output)
    it "Example 2" $ do
      let
        input = [here|6 3
abcdef
abc
|]
        output = [here|-1
|]
      A.main `shouldInteractAs` (input, output)
    it "Example 3" $ do
      let
        input = [here|15 9
dnsusrayukuaiia
dujrunuma
|]
        output = [here|45
|]
      A.main `shouldInteractAs` (input, output)

  describe "B" $ do
    it "Example 1" $ do
      let
        input = [here|2
1 2
|]
        output = [here|9
|]
      B.main `shouldInteractAs` (input, output)
    it "Example 2" $ do
      let
        input = [here|4
1 1 1 1
|]
        output = [here|212
|]
      B.main `shouldInteractAs` (input, output)
