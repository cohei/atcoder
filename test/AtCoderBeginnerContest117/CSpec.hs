{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest117.CSpec (spec) where

import           Test.Hspec                  (Spec, it)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest117.C (main)
import           Test                        (shouldInteractAs)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|2 5
            |10 12 1 2 14
            |]
      output =
        [str|5
            |]
    main `shouldInteractAs` (input, output)

  it "Example 2" $ do
    let
      input =
        [str|3 7
            |-10 -3 0 9 -100 2 17
            |]
      output =
        [str|19
            |]
    main `shouldInteractAs` (input, output)

  it "Example 3" $ do
    let
      input =
        [str|100 1
            |-100000
            |]
      output =
        [str|0
            |]
    main `shouldInteractAs` (input, output)