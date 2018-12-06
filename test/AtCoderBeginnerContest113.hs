{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Main where

import           Test.Hspec                  (describe, hspec, it, shouldBe)
import           Text.Heredoc                (str)

import qualified AtCoderBeginnerContest113.A as A (main)
import qualified AtCoderBeginnerContest113.B as B (main)
import qualified AtCoderBeginnerContest113.C as C (main)
import           Test                        (shouldInteractAs)

main :: IO ()
main = hspec $ do
  describe "A" $ do
    it "Example 1" $ do
      let
        input =
          [str|81 58
              |]
        output =
          [str|110
              |]
      A.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|4 54
              |]
        output =
          [str|31
              |]
      A.main `shouldInteractAs` (input, output)

  describe "B" $ do
    it "Example 1" $ do
      let
        input =
          [str|2
              |12 5
              |1000 2000
              |]
        output =
          [str|1
              |]
      B.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|3
              |21 -11
              |81234 94124 52141
              |]
        output =
          [str|3
              |]
      B.main `shouldInteractAs` (input, output)

  describe "C" $ do
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
      C.main `shouldInteractAs` (input, output)

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
      C.main `shouldInteractAs` (input, output)
