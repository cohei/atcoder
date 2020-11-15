{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest183.ASpec (spec) where

import           Data.ByteString             (ByteString)
import           Test.Hspec                  (Spec, it, shouldBe)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest183.A (main)
import           Test                        (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input, output :: ByteString
      input =
        [str|1
            |]
      output =
        [str|1
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input, output :: ByteString
      input =
        [str|0
            |]
      output =
        [str|0
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 3" $ do
    let
      input, output :: ByteString
      input =
        [str|-1
            |]
      output =
        [str|0
            |]
    main `runWith` input $ (`shouldBe` output)
