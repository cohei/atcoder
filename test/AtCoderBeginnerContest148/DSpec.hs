{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest148.DSpec (spec) where

import           Test.Hspec                  (Spec, it, shouldBe)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest148.D (main)
import           Test                        (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|3
            |2 1 2
            |]
      output =
        [str|1
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input =
        [str|3
            |2 2 2
            |]
      output =
        [str|-1
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 3" $ do
    let
      input =
        [str|10
            |3 1 4 1 5 9 2 6 5 3
            |]
      output =
        [str|7
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 4" $ do
    let
      input =
        [str|1
            |1
            |]
      output =
        [str|0
            |]
    main `runWith` input $ (`shouldBe` output)
