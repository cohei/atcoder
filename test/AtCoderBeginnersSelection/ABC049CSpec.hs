{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnersSelection.ABC049CSpec (spec) where

import           Test.Hspec                        (Spec, it)
import           Text.Heredoc                      (str)

import           AtCoderBeginnersSelection.ABC049C (main)
import           Test                              (shouldInteractAs)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|erasedream
            |]
      output =
        [str|YES
            |]
    main `shouldInteractAs` (input, output)

  it "Example 2" $ do
    let
      input =
        [str|dreameraser
            |]
      output =
        [str|YES
            |]
    main `shouldInteractAs` (input, output)

  it "Example 3" $ do
    let
      input =
        [str|dreamerer
            |]
      output =
        [str|NO
            |]
    main `shouldInteractAs` (input, output)
