{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module ExaWizards2019.BSpec (spec) where

import           Test.Hspec       (Spec, it)
import           Text.Heredoc     (str)

import           ExaWizards2019.B (main)
import           Test             (shouldInteractAs)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|4
            |RRBR
            |]
      output =
        [str|Yes
            |]
    main `shouldInteractAs` (input, output)

  it "Example 2" $ do
    let
      input =
        [str|4
            |BRBR
            |]
      output =
        [str|No
            |]
    main `shouldInteractAs` (input, output)
