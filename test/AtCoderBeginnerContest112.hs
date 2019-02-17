{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest112 (spec) where

import           Test.Hspec                  (Spec, describe, it)
import           Text.Heredoc                (str)

import qualified AtCoderBeginnerContest112.A as A (main)
import qualified AtCoderBeginnerContest112.B as B (main)
import qualified AtCoderBeginnerContest112.C as C (main)
import qualified AtCoderBeginnerContest112.D as D (main)
import           Test                        (shouldInteractAs)

spec :: Spec
spec = do
  describe "A" $ do
    it "Example 1" $ do
      let
        input =
          [str|1
              |]
        output =
          [str|Hello World
              |]
      A.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|2
              |3
              |5
              |]
        output =
          [str|8
              |]
      A.main `shouldInteractAs` (input, output)

  describe "B" $ do
    it "Example 1" $ do
      let
        input =
          [str|3 70
              |7 60
              |1 80
              |4 50
              |]
        output =
          [str|4
              |]
      B.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|4 3
              |1 1000
              |2 4
              |3 1000
              |4 500
              |]
        output =
          [str|TLE
              |]
      B.main `shouldInteractAs` (input, output)

    it "Example 3" $ do
      let
        input =
          [str|5 9
              |25 8
              |5 9
              |4 10
              |1000 1000
              |6 1
              |]
        output =
          [str|5
              |]
      B.main `shouldInteractAs` (input, output)

  describe "C" $ do
    it "Example 1" $ do
      let
        input =
          [str|4
              |2 3 5
              |2 1 5
              |1 2 5
              |3 2 5
              |]
        output =
          [str|2 2 6
              |]
      C.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|2
              |0 0 100
              |1 1 98
              |]
        output =
          [str|0 0 100
              |]
      C.main `shouldInteractAs` (input, output)

    it "Example 3" $ do
      let
        input =
          [str|3
              |99 1 191
              |100 1 192
              |99 0 192
              |]
        output =
          [str|100 0 193
              |]
      C.main `shouldInteractAs` (input, output)

  describe "D" $ do
    it "Example 1" $ do
      let
        input =
          [str|3 14
              |]
        output =
          [str|2
              |]
      D.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|10 123
              |]
        output =
          [str|3
              |]
      D.main `shouldInteractAs` (input, output)

    it "Example 3" $ do
      let
        input =
          [str|100000 1000000000
              |]
        output =
          [str|10000
              |]
      D.main `shouldInteractAs` (input, output)
