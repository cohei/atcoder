{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module ExaWizards2019.ASpec (spec) where

import           Test.Hspec       (Spec, it, shouldBe)
import           Text.Heredoc     (str)

import           ExaWizards2019.A (main)
import           Test             (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|2 2 2
            |]
      output =
        [str|Yes
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input =
        [str|3 4 5
            |]
      output =
        [str|No
            |]
    main `runWith` input $ (`shouldBe` output)
