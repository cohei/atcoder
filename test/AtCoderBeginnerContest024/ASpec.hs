{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest024.ASpec (spec) where

import           Test.Hspec                  (Spec, it, shouldBe)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest024.A (main)
import           Test                        (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|100 200 50 20
            |40 10
            |]
      output =
        [str|3500
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input =
        [str|400 1000 400 21
            |10 10
            |]
      output =
        [str|14000
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 3" $ do
    let
      input =
        [str|400 1000 400 20
            |10 10
            |]
      output =
        [str|6000
            |]
    main `runWith` input $ (`shouldBe` output)
