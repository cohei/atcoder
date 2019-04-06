{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest123.BSpec (spec) where

import           Test.Hspec                  (Spec, it)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest123.B (main)
import           Test                        (shouldInteractAs)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|29
            |20
            |7
            |35
            |120
            |]
      output =
        [str|215
            |]
    main `shouldInteractAs` (input, output)

  it "Example 2" $ do
    let
      input =
        [str|101
            |86
            |119
            |108
            |57
            |]
      output =
        [str|481
            |]
    main `shouldInteractAs` (input, output)

  it "Example 3" $ do
    let
      input =
        [str|123
            |123
            |123
            |123
            |123
            |]
      output =
        [str|643
            |]
    main `shouldInteractAs` (input, output)
