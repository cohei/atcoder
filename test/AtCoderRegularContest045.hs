{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Main where

import           Test.Hspec                 (describe, hspec, it)
import           Text.Heredoc               (str)

import qualified AtCoderRegularContest045.A as A (main)
import           Test                       (shouldInteractAs)

main :: IO ()
main = hspec $ do
  describe "A" $ do
    it "Example 1" $ do
      let
        input =
          [str|Left Right AtCoder
              |]
        output =
          [str|< > A
              |]
      A.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input =
          [str|Left Left Right Right AtCoder
              |]
        output =
          [str|< < > > A
              |]
      A.main `shouldInteractAs` (input, output)

    it "Example 3" $ do
      let
        input =
          [str|Right Right AtCoder Left Left AtCoder
              |]
        output =
          [str|> > A < < A
              |]
      A.main `shouldInteractAs` (input, output)
