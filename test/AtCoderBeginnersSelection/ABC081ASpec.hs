{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnersSelection.ABC081ASpec (spec) where

import           Test.Hspec                        (Spec, it)
import           Text.Heredoc                      (str)

import           AtCoderBeginnersSelection.ABC081A (main)
import           Test                              (shouldInteractAs)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|101
            |]
      output =
        [str|2
            |]
    main `shouldInteractAs` (input, output)

  it "Example 2" $ do
    let
      input =
        [str|000
            |]
      output =
        [str|0
            |]
    main `shouldInteractAs` (input, output)
