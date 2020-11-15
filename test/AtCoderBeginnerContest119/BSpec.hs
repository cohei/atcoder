{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest119.BSpec (spec) where

import           Data.ByteString             (ByteString)
import           Test.Hspec                  (Spec, it, shouldBe)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest119.B (main)
import           Test                        (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input, output :: ByteString
      input =
        [str|2
            |10000 JPY
            |0.10000000 BTC
            |]
      output =
        [str|48000.0
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input, output :: ByteString
      input =
        [str|3
            |100000000 JPY
            |100.00000000 BTC
            |0.00000001 BTC
            |]
      output =
        -- 138000000.0038
        [str|1.380000000038e8
            |]
    main `runWith` input $ (`shouldBe` output)
