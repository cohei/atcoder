{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Main where

import           Test.Hspec                        (describe, hspec, it)
import           Text.Heredoc                      (str)

import qualified Tenka1ProgrammerBeginnerContest.A as A (main)
import qualified Tenka1ProgrammerBeginnerContest.B as B (main)
import qualified Tenka1ProgrammerBeginnerContest.C as C (main)
import           Test                              (shouldInteractAs)

main :: IO ()
main = hspec $ do
  describe "A" $ do
    it "Example 1" $ do
      let
        input =
          [str|abc
              |]
        output =
          [str|cba
              |]
      A.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|ac
              |]
        output =
          [str|ac
              |]
      A.main `shouldInteractAs` (input, output)

  describe "B" $ do
    it "Example 1" $ do
      let
        input =
          [str|5 4 2
              |]
        output =
          [str|5 3
              |]
      B.main `shouldInteractAs` (input, output)
    it "Example 2" $ do
      let
        input =
          [str|3 3 3
              |]
        output =
          [str|1 3
              |]
      B.main `shouldInteractAs` (input, output)
    it "Example 3" $ do
      let
        input =
          [str|314159265 358979323 84
              |]
        output =
          [str|448759046 224379523
              |]
      B.main `shouldInteractAs` (input, output)

  describe "C" $ do
    it "Example 1" $ do
      let
        input =
          [str|5
              |6
              |8
              |1
              |2
              |3
              |]
        output =
          [str|21
              |]
      C.main `shouldInteractAs` (input, output)
    it "Example 2" $ do
      let
        input =
          [str|6
              |3
              |1
              |4
              |1
              |5
              |9
              |]
        output =
          [str|25
              |]
      C.main `shouldInteractAs` (input, output)
    it "Example 3" $ do
      let
        input =
          [str|3
              |5
              |5
              |1
              |]
        output =
          [str|8
              |]
      C.main `shouldInteractAs` (input, output)
