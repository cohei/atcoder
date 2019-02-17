{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Main where

import           Test.Hspec                  (describe, hspec, it)
import           Text.Heredoc                (str)

import qualified AtCoderBeginnerContest030.A as A (main)
import qualified AtCoderBeginnerContest030.B as B (main)
import qualified AtCoderBeginnerContest030.C as C (main)
import           Test                        (shouldInteractAs)

main :: IO ()
main = hspec $ do
  describe "A" $ do
    it "Example 1" $ do
      let
        input =
          [str|5 2 6 3
              |]
        output =
          [str|AOKI
              |]
      A.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|100 80 100 73
              |]
        output =
          [str|TAKAHASHI
              |]
      A.main `shouldInteractAs` (input, output)

    it "Example 3" $ do
      let
        input =
          [str|66 30 55 25
              |]
        output =
          [str|DRAW
              |]
      A.main `shouldInteractAs` (input, output)

  describe "B" $ do
    it "Example 1" $ do
      let
        input =
          [str|15 0
              |]
        output =
          -- 90
          [str|90.0
              |]
      B.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|3 17
              |]
        output =
          [str|3.5
              |]
      B.main `shouldInteractAs` (input, output)

    it "Example 3" $ do
      let
        input =
          [str|0 0
              |]
        output =
          -- 0
          [str|0.0
              |]
      B.main `shouldInteractAs` (input, output)

    it "Example 4" $ do
      let
        input =
          [str|6 0
              |]
        output =
          -- 180
          [str|180.0
              |]
      B.main `shouldInteractAs` (input, output)

    it "Example 5" $ do
      let
        input =
          [str|23 59
              |]
        output =
          -- 5.5000
          [str|5.5
              |]
      B.main `shouldInteractAs` (input, output)

  describe "C" $ do
    it "Example 1" $ do
      let
        input =
          [str|3 4
              |2 3
              |1 5 7
              |3 8 12 13
              |]
        output =
          [str|2
              |]
      C.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|1 1
              |1 1
              |1
              |1
              |]
        output =
          [str|0
              |]
      C.main `shouldInteractAs` (input, output)

    it "Example 3" $ do
      let
        input =
          [str|6 7
              |5 3
              |1 7 12 19 20 26
              |4 9 15 23 24 31 33
              |]
        output =
          [str|3
              |]
      C.main `shouldInteractAs` (input, output)
