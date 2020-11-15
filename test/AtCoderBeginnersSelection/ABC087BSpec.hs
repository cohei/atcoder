{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnersSelection.ABC087BSpec (spec) where

import           Test.Hspec                        (Spec, it, shouldBe)
import           Text.Heredoc                      (str)

import           AtCoderBeginnersSelection.ABC087B (main)
import           Test                              (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|2
            |2
            |2
            |100
            |]
      output =
        [str|2
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input =
        [str|5
            |1
            |0
            |150
            |]
      output =
        [str|0
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 3" $ do
    let
      input =
        [str|30
            |40
            |50
            |6000
            |]
      output =
        [str|213
            |]
    main `runWith` input $ (`shouldBe` output)
