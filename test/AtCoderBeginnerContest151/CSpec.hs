{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest151.CSpec (spec) where

import           Test.Hspec                  (Spec, it, shouldBe)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest151.C (main)
import           Test                        (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|2 5
            |1 WA
            |1 AC
            |2 WA
            |2 AC
            |2 WA
            |]
      output =
        [str|2 2
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input =
        [str|100000 3
            |7777 AC
            |7777 AC
            |7777 AC
            |]
      output =
        [str|1 0
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 3" $ do
    let
      input =
        [str|6 0
            |]
      output =
        [str|0 0
            |]
    main `runWith` input $ (`shouldBe` output)
