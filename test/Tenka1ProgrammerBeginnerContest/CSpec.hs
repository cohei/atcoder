{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Tenka1ProgrammerBeginnerContest.CSpec (spec) where

import           Data.ByteString                   (ByteString)
import           Test.Hspec                        (Spec, it, shouldBe)
import           Text.Heredoc                      (str)

import           Tenka1ProgrammerBeginnerContest.C (main)
import           Test                              (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input, output :: ByteString
      input =
        [str|5
            |6
            |8
            |1
            |2
            |3
            |]
      output =
        [str|21
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input, output :: ByteString
      input =
        [str|6
            |3
            |1
            |4
            |1
            |5
            |9
            |]
      output =
        [str|25
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 3" $ do
    let
      input, output :: ByteString
      input =
        [str|3
            |5
            |5
            |1
            |]
      output =
        [str|8
            |]
    main `runWith` input $ (`shouldBe` output)
