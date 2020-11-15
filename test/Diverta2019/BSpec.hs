{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Diverta2019.BSpec (spec) where

import           Test.Hspec    (Spec, it, shouldBe)
import           Text.Heredoc  (str)

import           Diverta2019.B (main)
import           Test          (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|1 2 3 4
            |]
      output =
        [str|4
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input =
        [str|13 1 4 3000
            |]
      output =
        [str|87058
            |]
    main `runWith` input $ (`shouldBe` output)
