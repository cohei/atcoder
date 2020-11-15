{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Diverta2019.ASpec (spec) where

import           Data.ByteString (ByteString)
import           Test.Hspec      (Spec, it, shouldBe)
import           Text.Heredoc    (str)

import           Diverta2019.A   (main)
import           Test            (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input, output :: ByteString
      input =
        [str|3 2
            |]
      output =
        [str|2
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input, output :: ByteString
      input =
        [str|13 3
            |]
      output =
        [str|11
            |]
    main `runWith` input $ (`shouldBe` output)
