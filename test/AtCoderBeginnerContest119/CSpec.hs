{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest119.CSpec (spec) where

import           Test.Hspec                  (Spec, describe, it, shouldBe)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest119.C (isSynthesyzed, main)
import           Test                        (shouldInteractAs)

spec :: Spec
spec = do
  describe "isSynthesyzed" $ do
    it "determines synthesis finished" $
      isSynthesyzed (10, 20, 30) [1..100] `shouldBe` True

    it "determines synthesis not finished" $
      isSynthesyzed (10, 20, 30) [1..29] `shouldBe` False

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
    main `shouldInteractAs` (input, output)

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
    main `shouldInteractAs` (input, output)

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
    main `shouldInteractAs` (input, output)