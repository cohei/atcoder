{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest135.CSpec (spec) where

import           Test.Hspec                  (Spec, it, shouldBe)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest135.C (main)
import           Test                        (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|2
            |3 5 2
            |4 5
            |]
      output =
        [str|9
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input =
        [str|3
            |5 6 3 8
            |5 100 8
            |]
      output =
        [str|22
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 3" $ do
    let
      input =
        [str|2
            |100 1 1
            |1 100
            |]
      output =
        [str|3
            |]
    main `runWith` input $ (`shouldBe` output)
