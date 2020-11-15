{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Tenka1ProgrammerBeginnerContest.BSpec (spec) where

import           Data.ByteString                   (ByteString)
import           Test.Hspec                        (Spec, it, shouldBe)
import           Text.Heredoc                      (str)

import           Tenka1ProgrammerBeginnerContest.B (main)
import           Test                              (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input, output :: ByteString
      input =
        [str|5 4 2
            |]
      output =
        [str|5 3
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input, output :: ByteString
      input =
        [str|3 3 3
            |]
      output =
        [str|1 3
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 3" $ do
    let
      input, output :: ByteString
      input =
        [str|314159265 358979323 84
            |]
      output =
        [str|448759046 224379523
            |]
    main `runWith` input $ (`shouldBe` output)
