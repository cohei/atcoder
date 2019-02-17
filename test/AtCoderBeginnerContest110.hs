{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Main where

import           Test.Hspec                  (describe, hspec, it)
import           Text.Heredoc                (str)

import qualified AtCoderBeginnerContest110.A as A (main)
import qualified AtCoderBeginnerContest110.B as B (main)
import qualified AtCoderBeginnerContest110.C as C (main)
import qualified AtCoderBeginnerContest110.D as D (main)
import           Test                        (shouldInteractAs)

main :: IO ()
main = hspec $ do
  describe "A" $ do
    it "Example 1" $ do
      let
        input =
          [str|1 5 2
              |]
        output =
          [str|53
              |]
      A.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|9 9 9
              |]
        output =
          [str|108
              |]
      A.main `shouldInteractAs` (input, output)

    it "Example 3" $ do
      let
        input =
          [str|6 6 7
              |]
        output =
          [str|82
              |]
      A.main `shouldInteractAs` (input, output)

  describe "B" $ do
    it "Example 1" $ do
      let
        input =
          [str|3 2 10 20
              |8 15 13
              |16 22
              |]
        output =
          [str|No War
              |]
      B.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|4 2 -48 -1
              |-20 -35 -91 -23
              |-22 66
              |]
        output =
          [str|War
              |]
      B.main `shouldInteractAs` (input, output)

    it "Example 3" $ do
      let
        input =
          [str|5 3 6 8
              |-10 3 1 5 -100
              |100 6 14
              |]
        output =
          [str|War
              |]
      B.main `shouldInteractAs` (input, output)

  describe "C" $ do
    it "Example 1" $ do
      let
        input =
          [str|azzel
              |apple
              |]
        output =
          [str|Yes
              |]
      C.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|chokudai
              |redcoder
              |]
        output =
          [str|No
              |]
      C.main `shouldInteractAs` (input, output)

    it "Example 3" $ do
      let
        input =
          [str|abcdefghijklmnopqrstuvwxyz
              |ibyhqfrekavclxjstdwgpzmonu
              |]
        output =
          [str|Yes
              |]
      C.main `shouldInteractAs` (input, output)

  describe "D" $ do
    it "Example 1" $ do
      let
        input =
          [str|2 6
              |]
        output =
          [str|4
              |]
      D.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|3 12
              |]
        output =
          [str|18
              |]
      D.main `shouldInteractAs` (input, output)

    it "Example 3" $ do
      let
        input =
          [str|100000 1000000000
              |]
        output =
          [str|957870001
              |]
      D.main `shouldInteractAs` (input, output)
