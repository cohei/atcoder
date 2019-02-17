{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Main where

import           Test.Hspec                  (describe, hspec, it)
import           Text.Heredoc                (str)

import qualified AtCoderBeginnerContest105.A as A (main)
import qualified AtCoderBeginnerContest105.B as B (main)
import qualified AtCoderBeginnerContest105.C as C (main)
import qualified AtCoderBeginnerContest105.D as D (main)
import           Test                        (shouldInteractAs)

main :: IO ()
main = hspec $ do
  describe "A" $ do
    it "Example 1" $ do
      let
        input =
          [str|7 3
              |]
        output =
          [str|1
              |]
      A.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|100 10
              |]
        output =
          [str|0
              |]
      A.main `shouldInteractAs` (input, output)

    it "Example 3" $ do
      let
        input =
          [str|1 1
              |]
        output =
          [str|0
              |]
      A.main `shouldInteractAs` (input, output)

  describe "B" $ do
    it "Example 1" $ do
      let
        input =
          [str|11
              |]
        output =
          [str|Yes
              |]
      B.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|40
              |]
        output =
          [str|Yes
              |]
      B.main `shouldInteractAs` (input, output)

    it "Example 3" $ do
      let
        input =
          [str|3
              |]
        output =
          [str|No
              |]
      B.main `shouldInteractAs` (input, output)

  describe "C" $ do
    it "Example 1" $ do
      let
        input =
          [str|-9
              |]
        output =
          [str|1011
              |]
      C.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|123456789
              |]
        output =
          [str|11000101011001101110100010101
              |]
      C.main `shouldInteractAs` (input, output)

    it "Example 3" $ do
      let
        input =
          [str|0
              |]
        output =
          [str|0
              |]
      C.main `shouldInteractAs` (input, output)

  describe "D" $ do
    it "Example 1" $ do
      let
        input =
          [str|3 2
              |4 1 5
              |]
        output =
          [str|3
              |]
      D.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|13 17
              |29 7 5 7 9 51 7 13 8 55 42 9 81
              |]
        output =
          [str|6
              |]
      D.main `shouldInteractAs` (input, output)

    it "Example 3" $ do
      let
        input =
          [str|10 400000000
              |1000000000 1000000000 1000000000 1000000000 1000000000 1000000000 1000000000 1000000000 1000000000 1000000000
              |]
        output =
          [str|25
              |]
      D.main `shouldInteractAs` (input, output)
