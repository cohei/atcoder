{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnersSelection.ABC086ASpec (spec) where

import           Test.Hspec                        (Spec, it)
import           Text.Heredoc                      (str)

import           AtCoderBeginnersSelection.ABC086A (main)
import           Test                              (shouldInteractAs)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|3 4
            |]
      output =
        [str|Even
            |]
    main `shouldInteractAs` (input, output)

  it "Example 2" $ do
    let
      input =
        [str|1 21
            |]
      output =
        [str|Odd
            |]
    main `shouldInteractAs` (input, output)
