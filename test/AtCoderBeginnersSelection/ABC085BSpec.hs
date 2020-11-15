{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnersSelection.ABC085BSpec (spec) where

import           Data.ByteString                   (ByteString)
import           Test.Hspec                        (Spec, it, shouldBe)
import           Text.Heredoc                      (str)

import           AtCoderBeginnersSelection.ABC085B (main)
import           Test                              (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input, output :: ByteString
      input =
        [str|4
            |10
            |8
            |8
            |6
            |]
      output =
        [str|3
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input, output :: ByteString
      input =
        [str|3
            |15
            |15
            |15
            |]
      output =
        [str|1
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 3" $ do
    let
      input, output :: ByteString
      input =
        [str|7
            |50
            |30
            |50
            |100
            |50
            |80
            |30
            |]
      output =
        [str|4
            |]
    main `runWith` input $ (`shouldBe` output)
