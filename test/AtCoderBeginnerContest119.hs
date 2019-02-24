{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest119 (spec) where

import           Test.Hspec                  (Spec, describe, it, shouldBe)
import           Text.Heredoc                (str)

import qualified AtCoderBeginnerContest119.A as A (main)
import qualified AtCoderBeginnerContest119.B as B (main)
import qualified AtCoderBeginnerContest119.C as C (isSynthesyzed, main)
import qualified AtCoderBeginnerContest119.D as D (main)
import           Test                        (shouldInteractAs)

spec :: Spec
spec = do
  describe "A" $ do
    it "Example 1" $ do
      let
        input =
          [str|2019/04/30
              |]
        output =
          [str|Heisei
              |]
      A.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|2019/11/01
              |]
        output =
          [str|TBD
              |]
      A.main `shouldInteractAs` (input, output)

  describe "B" $ do
    it "Example 1" $ do
      let
        input =
          [str|2
              |10000 JPY
              |0.10000000 BTC
              |]
        output =
          [str|48000.0
              |]
      B.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|3
              |100000000 JPY
              |100.00000000 BTC
              |0.00000001 BTC
              |]
        output =
          -- 138000000.0038
          [str|1.380000000038e8
              |]
      B.main `shouldInteractAs` (input, output)

  describe "C" $ do
    describe "isSynthesyzed" $ do
      it "determines synthesis finished" $
        C.isSynthesyzed (10, 20, 30) [1..100] `shouldBe` True

      it "determines synthesis not finished" $
        C.isSynthesyzed (10, 20, 30) [1..29] `shouldBe` False

    it "Example 1" $ do
      let
        input =
          [str|5 100 90 80
              |98
              |40
              |30
              |21
              |80
              |]
        output =
          [str|23
              |]
      C.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|8 100 90 80
              |100
              |100
              |90
              |90
              |90
              |80
              |80
              |80
              |]
        output =
          [str|0
              |]
      C.main `shouldInteractAs` (input, output)

    it "Example 3" $ do
      let
        input =
          [str|8 1000 800 100
              |300
              |333
              |400
              |444
              |500
              |555
              |600
              |666
              |]
        output =
          [str|243
              |]
      C.main `shouldInteractAs` (input, output)

  describe "D" $ do
    it "Example 1" $ do
      let
        input =
          [str|2 3 4
              |100
              |600
              |400
              |900
              |1000
              |150
              |2000
              |899
              |799
              |]
        output =
          [str|350
              |1400
              |301
              |399
              |]
      D.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|1 1 3
              |1
              |10000000000
              |2
              |9999999999
              |5000000000
              |]
        output =
          [str|10000000000
              |10000000000
              |14999999998
              |]
      D.main `shouldInteractAs` (input, output)
