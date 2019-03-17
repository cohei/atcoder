{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderGrandContest031.ASpec (spec) where

import           Test.Hspec               (Spec, it)
import           Text.Heredoc             (str)

import           AtCoderGrandContest031.A (main)
import           Test                     (shouldInteractAs)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|4
            |abcd
            |]
      output =
        [str|15
            |]
    main `shouldInteractAs` (input, output)

  it "Example 2" $ do
    let
      input =
        [str|3
            |baa
            |]
      output =
        [str|5
            |]
    main `shouldInteractAs` (input, output)

  it "Example 3" $ do
    let
      input =
        [str|5
            |abcab
            |]
      output =
        [str|17
            |]
    main `shouldInteractAs` (input, output)
