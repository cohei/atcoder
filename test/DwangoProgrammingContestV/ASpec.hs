{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module DwangoProgrammingContestV.ASpec (spec) where

import           Test.Hspec                  (Spec, it)
import           Text.Heredoc                (str)

import           DwangoProgrammingContestV.A (main)
import           Test                        (shouldInteractAs)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|3
            |1 2 3
            |]
      output =
        [str|1
            |]
    main `shouldInteractAs` (input, output)

  it "Example 2" $ do
    let
      input =
        [str|4
            |2 5 2 5
            |]
      output =
        [str|0
            |]
    main `shouldInteractAs` (input, output)