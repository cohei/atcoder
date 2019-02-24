{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest024.BSpec (spec) where

import           Test.Hspec                  (Spec, it)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest024.B (main)
import           Test                        (shouldInteractAs)

spec :: Spec
spec = do
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
    main `shouldInteractAs` (input, output)

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
    main `shouldInteractAs` (input, output)

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
    main `shouldInteractAs` (input, output)
