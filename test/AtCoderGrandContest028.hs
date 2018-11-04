module Main where

import Test.Hspec

import qualified AtCoderGrandContest028.A as A
import qualified AtCoderGrandContest028.B as B

main :: IO ()
main = hspec $ do
  describe "A" $ do
    describe "everyN" $ do
      it "take every n elements" $ do
        A.everyN 3 [1..10] `shouldBe` [1, 4, 7, 10]

    it "Example 1" $ do
      A.f 3 2 "acp" "ae" `shouldBe` Just 6
    it "Example 2" $ do
      A.f 6 3 "abcdef" "abc" `shouldBe` Nothing
    it "Example 3" $ do
      A.f 15 9 "dnsusrayukuaiia" "dujrunuma" `shouldBe` Just 45

  describe "B" $ do
    it "Example 1" $ do
      B.f [1, 2] `shouldBe` 9
    it "Example 2" $ do
      B.f [1, 1, 1, 1] `shouldBe` 212
