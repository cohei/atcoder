{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderRegularContest028.ASpec (spec) where

import           Data.ByteString            (ByteString)
import           Test.Hspec                 (Spec, it, shouldBe)
import           Text.Heredoc               (str)

import           AtCoderRegularContest028.A (main)
import           Test                       (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input, output :: ByteString
      input =
        [str|5 1 2
            |]
      output =
        [str|Bug
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input, output :: ByteString
      input =
        [str|10 3 4
            |]
      output =
        [str|Ant
            |]
    main `runWith` input $ (`shouldBe` output)
