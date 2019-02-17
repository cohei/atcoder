{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest118 (spec) where

import           Test.Hspec                  (Spec, describe, it)
import           Text.Heredoc                (str)

import qualified AtCoderBeginnerContest118.A as A (main)
import qualified AtCoderBeginnerContest118.B as B (main)
import qualified AtCoderBeginnerContest118.C as C (main)
import qualified AtCoderBeginnerContest118.D as D (main)
import           Test                        (shouldInteractAs)

spec :: Spec
spec = do
  describe "A" $ do
    it "Example 1" $ do
      let
        input =
          [str|4 12
              |]
        output =
          [str|16
              |]
      A.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|8 20
              |]
        output =
          [str|12
              |]
      A.main `shouldInteractAs` (input, output)

    it "Example 3" $ do
      let
        input =
          [str|1 1
              |]
        output =
          [str|2
              |]
      A.main `shouldInteractAs` (input, output)

  describe "B" $ do
    it "Example 1" $ do
      let
        input =
          [str|3 4
              |2 1 3
              |3 1 2 3
              |2 3 2
              |]
        output =
          [str|1
              |]
      B.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|5 5
              |4 2 3 4 5
              |4 1 3 4 5
              |4 1 2 4 5
              |4 1 2 3 5
              |4 1 2 3 4
              |]
        output =
          [str|0
              |]
      B.main `shouldInteractAs` (input, output)

    it "Example 3" $ do
      let
        input =
          [str|1 30
              |3 5 10 30
              |]
        output =
          [str|3
              |]
      B.main `shouldInteractAs` (input, output)

  describe "C" $ do
    it "Example 1" $ do
      let
        input =
          [str|4
              |2 10 8 40
              |]
        output =
          [str|2
              |]
      C.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|4
              |5 13 8 1000000000
              |]
        output =
          [str|1
              |]
      C.main `shouldInteractAs` (input, output)

    it "Example 3" $ do
      let
        input =
          [str|3
              |1000000000 1000000000 1000000000
              |]
        output =
          [str|1000000000
              |]
      C.main `shouldInteractAs` (input, output)

  describe "D" $ do
    it "Example 1" $ do
      let
        input =
          [str|20 4
              |3 7 8 4
              |]
        output =
          [str|777773
              |]
      D.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|101 9
              |9 8 7 6 5 4 3 2 1
              |]
        output =
          [str|71111111111111111111111111111111111111111111111111
              |]
      D.main `shouldInteractAs` (input, output)

    it "Example 3" $ do
      let
        input =
          [str|15 3
              |5 4 6
              |]
        output =
          [str|654
              |]
      D.main `shouldInteractAs` (input, output)
