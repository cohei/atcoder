{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest151.ASpec (spec) where

import           Test.Hspec                  (Spec, it)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest151.A (main)
import           Test                        (shouldInteractAs)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|a
            |]
      output =
        [str|b|]
    main `shouldInteractAs` (input, output)

  it "Example 2" $ do
    let
      input =
        [str|y
            |]
      output =
        [str|z|]
    main `shouldInteractAs` (input, output)
