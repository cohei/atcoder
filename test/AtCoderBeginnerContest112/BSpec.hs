{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest112.BSpec (spec) where

import           Test.Hspec                  (Spec, it, shouldBe)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest112.B (main)
import           Test                        (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|3 70
            |7 60
            |1 80
            |4 50
            |]
      output =
        [str|4
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input =
        [str|4 3
            |1 1000
            |2 4
            |3 1000
            |4 500
            |]
      output =
        [str|TLE
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 3" $ do
    let
      input =
        [str|5 9
            |25 8
            |5 9
            |4 10
            |1000 1000
            |6 1
            |]
      output =
        [str|5
            |]
    main `runWith` input $ (`shouldBe` output)
