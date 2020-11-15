{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest126.DSpec (spec) where

import           Test.Hspec                  (Spec, it, shouldBe)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest126.D (main)
import           Test                        (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|3
            |1 2 2
            |2 3 1
            |]
      output =
        [str|0
            |0
            |1
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input =
        [str|5
            |2 5 2
            |2 3 10
            |1 3 8
            |3 4 2
            |]
      output =
        [str|1
            |0
            |1
            |0
            |1
            |]
    main `runWith` input $ (`shouldBe` output)
