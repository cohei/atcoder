{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest112.CSpec (spec) where

import           Data.ByteString             (ByteString)
import           Test.Hspec                  (Spec, it, shouldBe)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest112.C (main)
import           Test                        (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input, output :: ByteString
      input =
        [str|4
            |2 3 5
            |2 1 5
            |1 2 5
            |3 2 5
            |]
      output =
        [str|2 2 6
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input, output :: ByteString
      input =
        [str|2
            |0 0 100
            |1 1 98
            |]
      output =
        [str|0 0 100
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 3" $ do
    let
      input, output :: ByteString
      input =
        [str|3
            |99 1 191
            |100 1 192
            |99 0 192
            |]
      output =
        [str|100 0 193
            |]
    main `runWith` input $ (`shouldBe` output)
