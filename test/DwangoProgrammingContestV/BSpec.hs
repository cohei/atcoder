{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module DwangoProgrammingContestV.BSpec (spec) where

import           Test.Hspec                  (Spec, it)
import           Text.Heredoc                (str)

import           DwangoProgrammingContestV.B (main)
import           Test                        (shouldInteractAs)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|4 2
            |2 5 2 5
            |]
      output =
        [str|12
            |]
    main `shouldInteractAs` (input, output)

  it "Example 2" $ do
    let
      input =
        [str|8 4
            |9 1 8 2 7 5 6 4
            |]
      output =
        [str|32
            |]
    main `shouldInteractAs` (input, output)
