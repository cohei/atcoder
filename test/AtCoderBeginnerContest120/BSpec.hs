{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest120.BSpec (spec) where

import           Test.Hspec                  (Spec, describe, it, shouldBe)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest120.B (canDivide, main)
import           Test                        (shouldInteractAs)

spec :: Spec
spec = do
  describe "canDivide" $ do
    it "can divide" $ (3 `canDivide` (12 :: Int)) `shouldBe` True
    it "can not divide" $ (5 `canDivide` (12 :: Int)) `shouldBe` False

  it "Example 1" $ do
    let
      input =
        [str|8 12 2
            |]
      output =
        [str|2
            |]
    main `shouldInteractAs` (input, output)

  it "Example 2" $ do
    let
      input =
        [str|100 50 4
            |]
      output =
        [str|5
            |]
    main `shouldInteractAs` (input, output)

  it "Example 3" $ do
    let
      input =
        [str|1 1 1
            |]
      output =
        [str|1
            |]
    main `shouldInteractAs` (input, output)
