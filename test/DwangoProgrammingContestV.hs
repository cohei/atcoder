{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Main where

import           Test.Hspec                  (describe, hspec, it)
import           Text.Heredoc                (here)

import qualified DwangoProgrammingContestV.A as A (main)
import qualified DwangoProgrammingContestV.B as B (main)
import qualified DwangoProgrammingContestV.C as C (main)
import           Test                        (shouldInteractAs)

main :: IO ()
main = hspec $ do
  describe "A" $ do
    it "Example 1" $ do
      let
        input = [here|3
1 2 3
|]
        output = [here|1
|]
      A.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input = [here|4
2 5 2 5
|]
        output = [here|0
|]
      A.main `shouldInteractAs` (input, output)

  describe "B" $ do
    it "Example 1" $ do
      let
        input = [here|4 2
2 5 2 5
|]
        output = [here|12
|]
      B.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input = [here|8 4
9 1 8 2 7 5 6 4
|]
        output = [here|32
|]
      B.main `shouldInteractAs` (input, output)

  describe "C" $ do
    it "Example 1" $ do
      let
        input = [here|18
DWANGOMEDIACLUSTER
1
18
|]
        output = [here|1
|]
      C.main `shouldInteractAs` (input, output)

    it "Example 2" $ do
      let
        input = [here|18
DDDDDDMMMMMCCCCCCC
1
18
|]
        output = [here|210
|]
      C.main `shouldInteractAs` (input, output)

    it "Example 3" $ do
      let
        input = [here|54
DIALUPWIDEAREANETWORKGAMINGOPERATIONCORPORATIONLIMITED
3
20 30 40
|]
        output = [here|0
1
2
|]
      C.main `shouldInteractAs` (input, output)

    it "Example 4" $ do
      let
        input = [here|30
DMCDMCDMCDMCDMCDMCDMCDMCDMCDMC
4
5 10 15 20
|]
        output = [here|10
52
110
140
|]
      C.main `shouldInteractAs` (input, output)
