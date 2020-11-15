{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderGrandContest028.BSpec (spec) where

import           Test.Hspec               (Spec, it, shouldBe)
import           Text.Heredoc             (str)

import           AtCoderGrandContest028.B (main)
import           Test                     (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|2
            |1 2
            |]
      output =
        [str|9
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input =
        [str|4
            |1 1 1 1
            |]
      output =
        [str|212
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 3" $ do
    let
      input =
        [str|10
            |1 2 4 8 16 32 64 128 256 512
            |]
      output =
        [str|880971923
            |]
    main `runWith` input $ (`shouldBe` output)
