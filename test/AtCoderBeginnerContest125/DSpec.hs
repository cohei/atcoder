{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest125.DSpec (spec) where

import           Test.Hspec                  (Spec, it)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest125.D (main)
import           Test                        (shouldInteractAs)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|3
            |-10 5 -4
            |]
      output =
        [str|19
            |]
    main `shouldInteractAs` (input, output)

  it "Example 2" $ do
    let
      input =
        [str|5
            |10 -4 -8 -11 3
            |]
      output =
        [str|30
            |]
    main `shouldInteractAs` (input, output)

  it "Example 3" $ do
    let
      input =
        [str|11
            |-1000000000 1000000000 -1000000000 1000000000 -1000000000 0 1000000000 -1000000000 1000000000 -1000000000 1000000000
            |]
      output =
        [str|10000000000
            |]
    main `shouldInteractAs` (input, output)
