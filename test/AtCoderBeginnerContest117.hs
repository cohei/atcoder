{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Main where

import           Test.Hspec                  (describe, hspec, it)
import           Text.Heredoc                (str)

import qualified AtCoderBeginnerContest117.A as A (main)
import qualified AtCoderBeginnerContest117.B as B (main)
import           Test                        (shouldInteractAs)

main :: IO ()
main = hspec $ do
  describe "A" $ do
    it "Example 1" $ do
      let
        input =
          [str|8 3
              |]
        output =
          -- 2.6666666667
          [str|2.6666666666666665
              |]
      A.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|99 1
              |]
        output =
          -- 99.0000000000
          [str|99.0
              |]
      A.main `shouldInteractAs` (input, output)

    it "Example 3" $ do
      let
        input =
          [str|1 100
              |]
        output =
          -- 0.0100000000
          [str|1.0e-2
              |]
      A.main `shouldInteractAs` (input, output)

  describe "B" $ do
    it "Example 1" $ do
      let
        input =
          [str|4
              |3 8 5 1
              |]
        output =
          [str|Yes
              |]
      B.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|4
              |3 8 4 1
              |]
        output =
          [str|No
              |]
      B.main `shouldInteractAs` (input, output)

    it "Example 3" $ do
      let
        input =
          [str|10
              |1 8 10 5 8 12 34 100 11 3
              |]
        output =
          [str|No
              |]
      B.main `shouldInteractAs` (input, output)
