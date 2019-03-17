{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest118.DSpec (spec) where

import           Test.Hspec                  (Spec, it)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest118.D (main)
import           Test                        (shouldInteractAs)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|20 4
            |3 7 8 4
            |]
      output =
        [str|777773
            |]
    main `shouldInteractAs` (input, output)

  it "Example 2" $ do
    let
      input =
        [str|101 9
            |9 8 7 6 5 4 3 2 1
            |]
      output =
        [str|71111111111111111111111111111111111111111111111111
            |]
    main `shouldInteractAs` (input, output)

  it "Example 3" $ do
    let
      input =
        [str|15 3
            |5 4 6
            |]
      output =
        [str|654
            |]
    main `shouldInteractAs` (input, output)
