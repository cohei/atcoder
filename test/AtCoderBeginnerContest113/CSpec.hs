{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest113.CSpec (spec) where

import           Test.Hspec                  (Spec, it)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest113.C (main)
import           Test                        (shouldInteractAs)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|2 3
            |1 32
            |2 63
            |1 12
            |]
      output =
        [str|000001000002
            |000002000001
            |000001000001
            |]
    main `shouldInteractAs` (input, output)

  it "Example 2" $ do
    let
      input =
        [str|2 3
            |2 55
            |2 77
            |2 99
            |]
      output =
        [str|000002000001
            |000002000002
            |000002000003
            |]
    main `shouldInteractAs` (input, output)
