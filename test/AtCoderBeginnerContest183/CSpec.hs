{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest183.CSpec (spec) where

import           Test.Hspec                  (Spec, it, shouldBe)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest183.C (main)
import           Test                        (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|4 330
            |0 1 10 100
            |1 0 20 200
            |10 20 0 300
            |100 200 300 0
            |]
      output =
        [str|2
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input =
        [str|5 5
            |0 1 1 1 1
            |1 0 1 1 1
            |1 1 0 1 1
            |1 1 1 0 1
            |1 1 1 1 0
            |]
      output =
        [str|24
            |]
    main `runWith` input $ (`shouldBe` output)
