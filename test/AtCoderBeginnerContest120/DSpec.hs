{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest120.DSpec (spec) where

import           Test.Hspec                  (Spec, it, shouldBe)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest120.D (main)
import           Test                        (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|4 5
            |1 2
            |3 4
            |1 3
            |2 3
            |1 4
            |]
      output =
        [str|0
            |0
            |4
            |5
            |6
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input =
        [str|6 5
            |2 3
            |1 2
            |5 6
            |3 4
            |4 5
            |]
      output =
        [str|8
            |9
            |12
            |14
            |15
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 3" $ do
    let
      input =
        [str|2 1
            |1 2
            |]
      output =
        [str|1
            |]
    main `runWith` input $ (`shouldBe` output)
