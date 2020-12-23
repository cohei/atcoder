{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest183.DSpec (spec) where

import           Data.ByteString             (ByteString)
import           Test.Hspec                  (Spec, it, shouldBe)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest183.D (main)
import           Test                        (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input, output :: ByteString
      input =
        [str|4 10
            |1 3 5
            |2 4 4
            |3 10 6
            |2 4 1
            |]
      output =
        [str|No
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input, output :: ByteString
      input =
        [str|4 10
            |1 3 5
            |2 4 4
            |3 10 6
            |2 3 1
            |]
      output =
        [str|Yes
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 3" $ do
    let
      input, output :: ByteString
      input =
        [str|6 1000000000
            |0 200000 999999999
            |2 20 1
            |20 200 1
            |200 2000 1
            |2000 20000 1
            |20000 200000 1
            |]
      output =
        [str|Yes
            |]
    main `runWith` input $ (`shouldBe` output)
