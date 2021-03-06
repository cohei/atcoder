{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest113.CSpec (spec) where

import           Data.ByteString             (ByteString)
import           Test.Hspec                  (Spec, it, shouldBe)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest113.C (main)
import           Test                        (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input, output :: ByteString
      input =
        [str|2 3
            |1 32
            |2 63
            |1 12
            |]
      output =
        [str|000001000002
            |000002000001
            |000001000001
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input, output :: ByteString
      input =
        [str|2 3
            |2 55
            |2 77
            |2 99
            |]
      output =
        [str|000002000001
            |000002000002
            |000002000003
            |]
    main `runWith` input $ (`shouldBe` output)
