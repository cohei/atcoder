{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderRegularContest045.ASpec (spec) where

import           Test.Hspec                 (Spec, it)
import           Text.Heredoc               (str)

import           AtCoderRegularContest045.A (main)
import           Test                       (shouldInteractAs)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|Left Right AtCoder
            |]
      output =
        [str|< > A
            |]
    main `shouldInteractAs` (input, output)

  it "Example 2" $ do
    let
      input =
        [str|Left Left Right Right AtCoder
            |]
      output =
        [str|< < > > A
            |]
    main `shouldInteractAs` (input, output)

  it "Example 3" $ do
    let
      input =
        [str|Right Right AtCoder Left Left AtCoder
            |]
      output =
        [str|> > A < < A
            |]
    main `shouldInteractAs` (input, output)