{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest030.BSpec (spec) where

import           Test.Hspec                  (Spec, it)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest030.B (main)
import           Test                        (shouldInteractAs)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|15 0
            |]
      output =
        -- 90
        [str|90.0
            |]
    main `shouldInteractAs` (input, output)

  it "Example 2" $ do
    let
      input =
        [str|3 17
            |]
      output =
        [str|3.5
            |]
    main `shouldInteractAs` (input, output)

  it "Example 3" $ do
    let
      input =
        [str|0 0
            |]
      output =
        -- 0
        [str|0.0
            |]
    main `shouldInteractAs` (input, output)

  it "Example 4" $ do
    let
      input =
        [str|6 0
            |]
      output =
        -- 180
        [str|180.0
            |]
    main `shouldInteractAs` (input, output)

  it "Example 5" $ do
    let
      input =
        [str|23 59
            |]
      output =
        -- 5.5000
        [str|5.5
            |]
    main `shouldInteractAs` (input, output)
