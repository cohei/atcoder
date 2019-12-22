{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnersSelection.PracticeASpec (spec) where

import           Test.Hspec                          (Spec, it)
import           Text.Heredoc                        (str)

import           AtCoderBeginnersSelection.PracticeA (main)
import           Test                                (shouldInteractAs)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|1
            |2 3
            |test
            |]
      output =
        [str|6 test
            |]
    main `shouldInteractAs` (input, output)

  it "Example 2" $ do
    let
      input =
        [str|72
            |128 256
            |myonmyon
            |]
      output =
        [str|456 myonmyon
            |]
    main `shouldInteractAs` (input, output)
