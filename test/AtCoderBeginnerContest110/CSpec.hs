{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest110.CSpec (spec) where

import           Test.Hspec                  (Spec, it, shouldBe)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest110.C (main)
import           Test                        (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|azzel
            |apple
            |]
      output =
        [str|Yes
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input =
        [str|chokudai
            |redcoder
            |]
      output =
        [str|No
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 3" $ do
    let
      input =
        [str|abcdefghijklmnopqrstuvwxyz
            |ibyhqfrekavclxjstdwgpzmonu
            |]
      output =
        [str|Yes
            |]
    main `runWith` input $ (`shouldBe` output)
