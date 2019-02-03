module Main where

import           Test.Hspec

import qualified AtCoderBeginnerContest112.A as A

main :: IO ()
main = hspec $ do
  describe "A" $ do
    it "returns the first element of a list" $ do
      head [23 ..] `shouldBe` (23 :: Int)
