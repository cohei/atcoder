{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest119.CSpec (spec) where

import           Data.ByteString             (ByteString)
import           Test.Hspec                  (Spec, it, shouldBe)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest119.C (main)
import           Test                        (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input, output :: ByteString
      input =
        [str|5 100 90 80
            |98
            |40
            |30
            |21
            |80
            |]
      output =
        [str|23
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input, output :: ByteString
      input =
        [str|8 100 90 80
            |100
            |100
            |90
            |90
            |90
            |80
            |80
            |80
            |]
      output =
        [str|0
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 3" $ do
    let
      input, output :: ByteString
      input =
        [str|8 1000 800 100
            |300
            |333
            |400
            |444
            |500
            |555
            |600
            |666
            |]
      output =
        [str|243
            |]
    main `runWith` input $ (`shouldBe` output)
