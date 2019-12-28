{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderGrandContest041.ASpec (spec) where

import           Test.Hspec               (Spec, it)
import           Text.Heredoc             (str)

import           AtCoderGrandContest041.A (main)
import           Test                     (shouldInteractAs)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|5 2 4
            |]
      output =
        [str|1
            |]
    main `shouldInteractAs` (input, output)

  it "Example 2" $ do
    let
      input =
        [str|5 2 3
            |]
      output =
        [str|2
            |]
    main `shouldInteractAs` (input, output)
