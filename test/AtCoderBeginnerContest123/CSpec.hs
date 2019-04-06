{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest123.CSpec (spec) where

import           Test.Hspec                  (Spec, it)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest123.C (main)
import           Test                        (shouldInteractAs)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|5
            |3
            |2
            |4
            |3
            |5
            |]
      output =
        [str|7
            |]
    main `shouldInteractAs` (input, output)

  it "Example 2" $ do
    let
      input =
        [str|10
            |123
            |123
            |123
            |123
            |123
            |]
      output =
        [str|5
            |]
    main `shouldInteractAs` (input, output)

  it "Example 3" $ do
    let
      input =
        [str|10000000007
            |2
            |3
            |5
            |7
            |11
            |]
      output =
        [str|5000000008
            |]
    main `shouldInteractAs` (input, output)

  it "My example 1" $ do
    let
      input =
        [str|5
            |5
            |5
            |1
            |5
            |5
            |]
      output =
        [str|9
            |]
    main `shouldInteractAs` (input, output)
