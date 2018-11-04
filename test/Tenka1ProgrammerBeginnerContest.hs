module Main where

import           Test.Hspec                        (describe, hspec, it,
                                                    shouldBe)

import qualified Tenka1ProgrammerBeginnerContest.A as A (f)
import qualified Tenka1ProgrammerBeginnerContest.B as B (f)
import qualified Tenka1ProgrammerBeginnerContest.C as C (f)

main :: IO ()
main = hspec $ do
  describe "A" $ do
    it "Example 1" $ do
      A.f "abc" `shouldBe` "cba"
    it "Example 2" $ do
      A.f "ac" `shouldBe` "ac"

  describe "B" $ do
    it "Example 1" $ do
      B.f 5 4 2 `shouldBe` (5, 3)
    it "Example 2" $ do
      B.f 3 3 3 `shouldBe` (1, 3)
    it "Example 3" $ do
      B.f 314159265 358979323 84 `shouldBe` (448759046, 224379523)

  describe "C" $ do
    it "Example 1" $ do
      C.f 5 [6, 8, 1, 2, 3] `shouldBe` 21
    it "Example 2" $ do
      C.f 6 [3, 1, 4, 1, 5, 9] `shouldBe` 25
    it "Example 3" $ do
      C.f 3 [5, 5, 1] `shouldBe` 8
