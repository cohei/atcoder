{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest119.BSpec (spec) where

import           Test.Hspec                  (Spec, it)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest119.B (main)
import           Test                        (shouldInteractAs)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|2
            |10000 JPY
            |0.10000000 BTC
            |]
      output =
        [str|48000.0
            |]
    main `shouldInteractAs` (input, output)

  it "Example 2" $ do
    let
      input =
        [str|3
            |100000000 JPY
            |100.00000000 BTC
            |0.00000001 BTC
            |]
      output =
        -- 138000000.0038
        [str|1.380000000038e8
            |]
    main `shouldInteractAs` (input, output)
