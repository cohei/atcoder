{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest125.BSpec (spec) where

import           Test.Hspec                  (Spec, it)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest125.B (main)
import           Test                        (shouldInteractAs)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|3
            |10 2 5
            |6 3 4
            |]
      output =
        [str|5
            |]
    main `shouldInteractAs` (input, output)

  it "Example 2" $ do
    let
      input =
        [str|4
            |13 21 6 19
            |11 30 6 15
            |]
      output =
        [str|6
            |]
    main `shouldInteractAs` (input, output)

  it "Example 3" $ do
    let
      input =
        [str|1
            |1
            |50
            |]
      output =
        [str|0
            |]
    main `shouldInteractAs` (input, output)
