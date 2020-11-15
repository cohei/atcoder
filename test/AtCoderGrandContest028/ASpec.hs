{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderGrandContest028.ASpec (spec) where

import           Data.ByteString          (ByteString)
import           Test.Hspec               (Spec, describe, it, shouldBe)
import           Text.Heredoc             (str)

import           AtCoderGrandContest028.A (everyN, main)
import           Test                     (runWith)

spec :: Spec
spec = do
  describe "everyN" $ do
    it "take every n elements" $ do
      everyN 3 [1..10 :: Int] `shouldBe` [1, 4, 7, 10]

  it "Example 1" $ do
    let
      input, output :: ByteString
      input =
        [str|3 2
            |acp
            |ae
            |]
      output =
        [str|6
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input, output :: ByteString
      input =
        [str|6 3
            |abcdef
            |abc
            |]
      output =
        [str|-1
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 3" $ do
    let
      input, output :: ByteString
      input =
        [str|15 9
            |dnsusrayukuaiia
            |dujrunuma
            |]
      output =
        [str|45
            |]
    main `runWith` input $ (`shouldBe` output)
