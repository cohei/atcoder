{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderGrandContest031.ASpec (spec) where

import           Data.ByteString          (ByteString)
import           Test.Hspec               (Spec, it, shouldBe)
import           Text.Heredoc             (str)

import           AtCoderGrandContest031.A (main)
import           Test                     (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input, output :: ByteString
      input =
        [str|4
            |abcd
            |]
      output =
        [str|15
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input, output :: ByteString
      input =
        [str|3
            |baa
            |]
      output =
        [str|5
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 3" $ do
    let
      input, output :: ByteString
      input =
        [str|5
            |abcab
            |]
      output =
        [str|17
            |]
    main `runWith` input $ (`shouldBe` output)
