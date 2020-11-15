{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Diverta2019.DSpec (spec) where

import           Data.ByteString (ByteString)
import           Test.Hspec      (Spec, it, shouldBe)
import           Text.Heredoc    (str)

import           Diverta2019.D   (main)
import           Test            (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input, output :: ByteString
      input =
        [str|8
            |]
      output =
        [str|10
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input, output :: ByteString
      input =
        [str|1000000000000
            |]
      output =
        [str|2499686339916
            |]
    main `runWith` input $ (`shouldBe` output)
