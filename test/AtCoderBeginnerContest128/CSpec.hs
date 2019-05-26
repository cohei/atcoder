{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest128.CSpec (spec) where

import           Test.Hspec                  (Spec, it)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest128.C (main)
import           Test                        (shouldInteractAs)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|2 2
            |2 1 2
            |1 2
            |0 1
            |]
      output =
        [str|1
            |]
    main `shouldInteractAs` (input, output)

  it "Example 2" $ do
    let
      input =
        [str|2 3
            |2 1 2
            |1 1
            |1 2
            |0 0 1
            |]
      output =
        [str|0
            |]
    main `shouldInteractAs` (input, output)

  it "Example 3" $ do
    let
      input =
        [str|5 2
            |3 1 2 5
            |2 2 3
            |1 0
            |]
      output =
        [str|8
            |]
    main `shouldInteractAs` (input, output)
