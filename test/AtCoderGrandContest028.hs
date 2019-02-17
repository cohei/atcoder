{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderGrandContest028 (spec) where

import           Test.Hspec               (Spec, describe, it, shouldBe)
import           Text.Heredoc             (str)

import qualified AtCoderGrandContest028.A as A (everyN, main)
import qualified AtCoderGrandContest028.B as B (main)
import           Test                     (shouldInteractAs)

spec :: Spec
spec = do
  describe "A" $ do
    describe "everyN" $ do
      it "take every n elements" $ do
        A.everyN 3 [1..10 :: Int] `shouldBe` [1, 4, 7, 10]

    it "Example 1" $ do
      let
        input =
          [str|3 2
              |acp
              |ae
              |]
        output =
          [str|6
              |]
      A.main `shouldInteractAs` (input, output)
    it "Example 2" $ do
      let
        input =
          [str|6 3
              |abcdef
              |abc
              |]
        output =
          [str|-1
              |]
      A.main `shouldInteractAs` (input, output)
    it "Example 3" $ do
      let
        input =
          [str|15 9
              |dnsusrayukuaiia
              |dujrunuma
              |]
        output =
          [str|45
              |]
      A.main `shouldInteractAs` (input, output)

  describe "B" $ do
    it "Example 1" $ do
      let
        input =
          [str|2
              |1 2
              |]
        output =
          [str|9
              |]
      B.main `shouldInteractAs` (input, output)
    it "Example 2" $ do
      let
        input =
          [str|4
              |1 1 1 1
              |]
        output =
          [str|212
              |]
      B.main `shouldInteractAs` (input, output)
