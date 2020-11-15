{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest118.BSpec (spec) where

import           Test.Hspec                  (Spec, it, shouldBe)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest118.B (main)
import           Test                        (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|3 4
            |2 1 3
            |3 1 2 3
            |2 3 2
            |]
      output =
        [str|1
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input =
        [str|5 5
            |4 2 3 4 5
            |4 1 3 4 5
            |4 1 2 4 5
            |4 1 2 3 5
            |4 1 2 3 4
            |]
      output =
        [str|0
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 3" $ do
    let
      input =
        [str|1 30
            |3 5 10 30
            |]
      output =
        [str|3
            |]
    main `runWith` input $ (`shouldBe` output)
