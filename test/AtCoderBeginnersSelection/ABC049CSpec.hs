{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnersSelection.ABC049CSpec (spec) where

import           Test.Hspec                        (Spec, it, shouldBe)
import           Text.Heredoc                      (str)

import           AtCoderBeginnersSelection.ABC049C (main)
import           Test                              (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|erasedream
            |]
      output =
        [str|YES
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input =
        [str|dreameraser
            |]
      output =
        [str|YES
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 3" $ do
    let
      input =
        [str|dreamerer
            |]
      output =
        [str|NO
            |]
    main `runWith` input $ (`shouldBe` output)
