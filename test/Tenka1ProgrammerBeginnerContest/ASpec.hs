{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Tenka1ProgrammerBeginnerContest.ASpec (spec) where

import           Test.Hspec                        (Spec, it)
import           Text.Heredoc                      (str)

import           Tenka1ProgrammerBeginnerContest.A (main)
import           Test                              (shouldInteractAs)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|abc
            |]
      output =
        [str|cba
            |]
    main `shouldInteractAs` (input, output)

  it "Example 2" $ do
    let
      input =
        [str|ac
            |]
      output =
        [str|ac
            |]
    main `shouldInteractAs` (input, output)
