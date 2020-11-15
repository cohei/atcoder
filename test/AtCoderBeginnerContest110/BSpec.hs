{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest110.BSpec (spec) where

import           Test.Hspec                  (Spec, it, shouldBe)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest110.B (main)
import           Test                        (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|3 2 10 20
            |8 15 13
            |16 22
            |]
      output =
        [str|No War
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input =
        [str|4 2 -48 -1
            |-20 -35 -91 -23
            |-22 66
            |]
      output =
        [str|War
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 3" $ do
    let
      input =
        [str|5 3 6 8
            |-10 3 1 5 -100
            |100 6 14
            |]
      output =
        [str|War
            |]
    main `runWith` input $ (`shouldBe` output)
