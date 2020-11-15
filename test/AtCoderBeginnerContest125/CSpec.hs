{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest125.CSpec (spec) where

import           Test.Hspec                  (Spec, it, shouldBe)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest125.C (main)
import           Test                        (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|3
            |7 6 8
            |]
      output =
        [str|2
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input =
        [str|3
            |12 15 18
            |]
      output =
        [str|6
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 3" $ do
    let
      input =
        [str|2
            |1000000000 1000000000
            |]
      output =
        [str|1000000000
            |]
    main `runWith` input $ (`shouldBe` output)
