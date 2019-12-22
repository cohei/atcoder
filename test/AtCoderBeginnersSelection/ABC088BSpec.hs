{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnersSelection.ABC088BSpec (spec) where

import           Test.Hspec                        (Spec, it)
import           Text.Heredoc                      (str)

import           AtCoderBeginnersSelection.ABC088B (main)
import           Test                              (shouldInteractAs)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|2
            |3 1
            |]
      output =
        [str|2
            |]
    main `shouldInteractAs` (input, output)

  it "Example 2" $ do
    let
      input =
        [str|3
            |2 7 4
            |]
      output =
        [str|5
            |]
    main `shouldInteractAs` (input, output)

  it "Example 3" $ do
    let
      input =
        [str|4
            |20 18 2 18
            |]
      output =
        [str|18
            |]
    main `shouldInteractAs` (input, output)
