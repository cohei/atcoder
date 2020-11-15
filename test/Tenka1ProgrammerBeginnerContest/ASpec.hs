{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Tenka1ProgrammerBeginnerContest.ASpec (spec) where

import           Test.Hspec                        (Spec, it, shouldBe)
import           Text.Heredoc                      (str)

import           Tenka1ProgrammerBeginnerContest.A (main)
import           Test                              (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|abc
            |]
      output =
        [str|cba
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input =
        [str|ac
            |]
      output =
        [str|ac
            |]
    main `runWith` input $ (`shouldBe` output)
