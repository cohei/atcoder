{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Main where

import           Test.Hspec                 (describe, hspec, it)
import           Text.Heredoc               (str)

import qualified AtCoderRegularContest028.A as A (main)
import qualified AtCoderRegularContest028.B as B (main)
import           Test                       (shouldInteractAs)

main :: IO ()
main = hspec $ do
  describe "A" $ do
    it "Example 1" $ do
      let
        input =
          [str|5 1 2
              |]
        output =
          [str|Bug
              |]
      A.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|10 3 4
              |]
        output =
          [str|Ant
              |]
      A.main `shouldInteractAs` (input, output)

  describe "B" $ do
    it "Example 1" $ do
      let
        input =
          [str|5 2
              |4 5 3 1 2
              |]
        output =
          [str|2
              |1
              |3
              |5
              |]
      B.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|3 1
              |2 3 1
              |]
        output =
          [str|1
              |1
              |3
              |]
      B.main `shouldInteractAs` (input, output)
