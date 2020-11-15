{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnersSelection.ABC085CSpec (spec) where

import           Test.Hspec                        (Spec, it, shouldBe)
import           Text.Heredoc                      (str)

import           AtCoderBeginnersSelection.ABC085C (main)
import           Test                              (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|9 45000
            |]
      output =
        -- 4 0 5 も別解
        [str|0 9 0
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input =
        [str|20 196000
            |]
      output =
        [str|-1 -1 -1
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 3" $ do
    let
      input =
        [str|1000 1234000
            |]
      output =
        -- 14 27 959 も別解
        [str|2 54 944
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 4" $ do
    let
      input =
        [str|2000 20000000
            |]
      output =
        [str|2000 0 0
            |]
    main `runWith` input $ (`shouldBe` output)
