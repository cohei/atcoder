{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest148.CSpec (spec) where

import           Test.Hspec                  (Spec, it)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest148.C (main)
import           Test                        (shouldInteractAs)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|2 3
            |]
      output =
        [str|6
            |]
    main `shouldInteractAs` (input, output)

  it "Example 2" $ do
    let
      input =
        [str|123 456
            |]
      output =
        [str|18696
            |]
    main `shouldInteractAs` (input, output)

  it "Example 3" $ do
    let
      input =
        [str|100000 99999
            |]
      output =
        [str|9999900000
            |]
    main `shouldInteractAs` (input, output)
