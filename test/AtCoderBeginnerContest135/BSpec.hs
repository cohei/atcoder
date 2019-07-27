{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest135.BSpec (spec) where

import           Test.Hspec                  (Spec, it)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest135.B (main)
import           Test                        (shouldInteractAs)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|5
            |5 2 3 4 1
            |]
      output =
        [str|YES
            |]
    main `shouldInteractAs` (input, output)

  it "Example 2" $ do
    let
      input =
        [str|5
            |2 4 3 5 1
            |]
      output =
        [str|NO
            |]
    main `shouldInteractAs` (input, output)

  it "Example 3" $ do
    let
      input =
        [str|7
            |1 2 3 4 5 6 7
            |]
      output =
        [str|YES
            |]
    main `shouldInteractAs` (input, output)
