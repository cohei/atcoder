{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest128.DSpec (spec) where

import           Test.Hspec                  (Spec, it)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest128.D (main)
import           Test                        (shouldInteractAs)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|6 4
            |-10 8 2 1 2 6
            |]
      output =
        [str|14
            |]
    main `shouldInteractAs` (input, output)

  it "Example 2" $ do
    let
      input =
        [str|6 4
            |-6 -100 50 -2 -5 -3
            |]
      output =
        [str|44
            |]
    main `shouldInteractAs` (input, output)

  it "Example 3" $ do
    let
      input =
        [str|6 3
            |-6 -100 50 -2 -5 -3
            |]
      output =
        [str|0
            |]
    main `shouldInteractAs` (input, output)
