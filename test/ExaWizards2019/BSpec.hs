{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module ExaWizards2019.BSpec (spec) where

import           Data.ByteString  (ByteString)
import           Test.Hspec       (Spec, it, shouldBe)
import           Text.Heredoc     (str)

import           ExaWizards2019.B (main)
import           Test             (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input, output :: ByteString
      input =
        [str|4
            |RRBR
            |]
      output =
        [str|Yes
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input, output :: ByteString
      input =
        [str|4
            |BRBR
            |]
      output =
        [str|No
            |]
    main `runWith` input $ (`shouldBe` output)
