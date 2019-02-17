{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Main where

import           Test.Hspec                  (describe, hspec, it)
import           Text.Heredoc                (str)

import qualified AtCoderBeginnerContest104.A as A (main)
import qualified AtCoderBeginnerContest104.B as B (main)
import           Test                        (shouldInteractAs)

main :: IO ()
main = hspec $ do
  describe "A" $ do
    it "Example 1" $ do
      let
        input =
          [str|1199
              |]
        output =
          [str|ABC
              |]
      A.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|1200
              |]
        output =
          [str|ARC
              |]
      A.main `shouldInteractAs` (input, output)

    it "Example 3" $ do
      let
        input =
          [str|4208
              |]
        output =
          [str|AGC
              |]
      A.main `shouldInteractAs` (input, output)

  describe "B" $ do
    it "Example 1" $ do
      let
        input =
          [str|AtCoder
              |]
        output =
          [str|AC
              |]
      B.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|ACoder
              |]
        output =
          [str|WA
              |]
      B.main `shouldInteractAs` (input, output)

    it "Example 3" $ do
      let
        input =
          [str|AcycliC
              |]
        output =
          [str|WA
              |]
      B.main `shouldInteractAs` (input, output)

    it "Example 4" $ do
      let
        input =
          [str|AtCoCo
              |]
        output =
          [str|WA
              |]
      B.main `shouldInteractAs` (input, output)

    it "Example 5" $ do
      let
        input =
          [str|Atcoder
              |]
        output =
          [str|WA
              |]
      B.main `shouldInteractAs` (input, output)
