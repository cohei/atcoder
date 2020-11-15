{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest119.DSpec (spec) where

import           Test.Hspec                  (Spec, it, shouldBe)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest119.D (main)
import           Test                        (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|2 3 4
            |100
            |600
            |400
            |900
            |1000
            |150
            |2000
            |899
            |799
            |]
      output =
        [str|350
            |1400
            |301
            |399
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input =
        [str|1 1 3
            |1
            |10000000000
            |2
            |9999999999
            |5000000000
            |]
      output =
        [str|10000000000
            |10000000000
            |14999999998
            |]
    main `runWith` input $ (`shouldBe` output)
