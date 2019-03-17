{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderRegularContest028.ASpec (spec) where

import           Test.Hspec                 (Spec, it)
import           Text.Heredoc               (str)

import           AtCoderRegularContest028.A (main)
import           Test                       (shouldInteractAs)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|5 1 2
            |]
      output =
        [str|Bug
            |]
    main `shouldInteractAs` (input, output)

  it "Example 2" $ do
    let
      input =
        [str|10 3 4
            |]
      output =
        [str|Ant
            |]
    main `shouldInteractAs` (input, output)
