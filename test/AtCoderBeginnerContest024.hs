{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest024 (spec) where

import           Test.Hspec                  (Spec, describe, it)
import           Text.Heredoc                (str)

import qualified AtCoderBeginnerContest024.A as A (main)
import qualified AtCoderBeginnerContest024.B as B (main)
import           Test                        (shouldInteractAs)

spec :: Spec
spec = do
  describe "A" $ do
    it "Example 1" $ do
      let
        input =
          [str|100 200 50 20
              |40 10
              |]
        output =
          [str|3500
              |]
      A.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|400 1000 400 21
              |10 10
              |]
        output =
          [str|14000
              |]
      A.main `shouldInteractAs` (input, output)

    it "Example 3" $ do
      let
        input =
          [str|400 1000 400 20
              |10 10
              |]
        output =
          [str|6000
              |]
      A.main `shouldInteractAs` (input, output)

  describe "B" $ do
    it "Example 1" $ do
      let
        input =
          [str|5 10
              |20
              |100
              |105
              |217
              |314
              |]
        output =
          [str|45
              |]
      B.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|10 10
              |1
              |2
              |3
              |4
              |5
              |6
              |7
              |8
              |9
              |10
              |]
        output =
          [str|19
              |]
      B.main `shouldInteractAs` (input, output)

    it "Example 3" $ do
      let
        input =
          [str|10 100000
              |3
              |31
              |314
              |3141
              |31415
              |314159
              |400000
              |410000
              |500000
              |777777
              |]
        output =
          [str|517253
              |]
      B.main `shouldInteractAs` (input, output)
