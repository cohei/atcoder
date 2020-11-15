{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module ExaWizards2019.DSpec (spec) where

import           Test.Hspec       (Spec, it, shouldBe)
import           Text.Heredoc     (str)

import           ExaWizards2019.D (main)
import           Test             (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|2 19
            |3 7
            |]
      output =
        [str|3
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input =
        [str|5 82
            |22 11 6 5 13
            |]
      output =
        [str|288
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 3" $ do
    let
      input =
        [str|10 100000
            |50000 50001 50002 50003 50004 50005 50006 50007 50008 50009
            |]
      output =
        [str|279669259
            |]
    main `runWith` input $ (`shouldBe` output)

  it "My Example" $ do
    let
      input =
        [str|3 19
            |3 7 5
            |]
      output =
        [str|6
            |]
    main `runWith` input $ (`shouldBe` output)
