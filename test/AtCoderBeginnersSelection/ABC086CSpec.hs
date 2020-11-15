{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnersSelection.ABC086CSpec (spec) where

import           Data.ByteString                   (ByteString)
import           Test.Hspec                        (Spec, it, shouldBe)
import           Text.Heredoc                      (str)

import           AtCoderBeginnersSelection.ABC086C (main)
import           Test                              (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input, output :: ByteString
      input =
        [str|2
            |3 1 2
            |6 1 1
            |]
      output =
        [str|Yes
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input, output :: ByteString
      input =
        [str|1
            |2 100 100
            |]
      output =
        [str|No
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 3" $ do
    let
      input, output :: ByteString
      input =
        [str|2
            |5 1 1
            |100 1 1
            |]
      output =
        [str|No
            |]
    main `runWith` input $ (`shouldBe` output)
