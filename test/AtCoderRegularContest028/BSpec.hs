{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderRegularContest028.BSpec (spec) where

import           Test.Hspec                 (Spec, it)
import           Text.Heredoc               (str)

import           AtCoderRegularContest028.B (main)
import           Test                       (shouldInteractAs)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|5 2
            |4 5 3 1 2
            |]
      output =
        [str|2
            |1
            |3
            |5
            |]
    main `shouldInteractAs` (input, output)

  it "Example 2" $ do
    let
      input =
        [str|3 1
            |2 3 1
            |]
      output =
        [str|1
            |1
            |3
            |]
    main `shouldInteractAs` (input, output)
