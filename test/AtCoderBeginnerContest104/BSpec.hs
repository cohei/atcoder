{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest104.BSpec (spec) where

import           Test.Hspec                  (Spec, it, shouldBe)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest104.B (main)
import           Test                        (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|AtCoder
            |]
      output =
        [str|AC
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input =
        [str|ACoder
            |]
      output =
        [str|WA
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 3" $ do
    let
      input =
        [str|AcycliC
            |]
      output =
        [str|WA
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 4" $ do
    let
      input =
        [str|AtCoCo
            |]
      output =
        [str|WA
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 5" $ do
    let
      input =
        [str|Atcoder
            |]
      output =
        [str|WA
            |]
    main `runWith` input $ (`shouldBe` output)
