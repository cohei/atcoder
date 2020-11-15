{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest117.ASpec (spec) where

import           Test.Hspec                  (Spec, it, shouldBe)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest117.A (main)
import           Test                        (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|8 3
            |]
      output =
        -- 2.6666666667
        [str|2.6666666666666665
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input =
        [str|99 1
            |]
      output =
        -- 99.0000000000
        [str|99.0
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 3" $ do
    let
      input =
        [str|1 100
            |]
      output =
        -- 0.0100000000
        [str|1.0e-2
            |]
    main `runWith` input $ (`shouldBe` output)
