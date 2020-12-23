{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes #-}
module AtCoderRegularContest014.BSpec (spec) where

import Data.ByteString (ByteString)
import Test.Hspec (Spec, it, shouldBe)
import Text.Heredoc (str)

import AtCoderRegularContest014.B (main)
import Test (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input, output :: ByteString
      input =
        [str|4
            |ab
            |ba
            |ab
            |cb
            |]
      output =
        [str|LOSE
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input, output :: ByteString
      input =
        [str|3
            |atcoder
            |redcoder
            |recorder
            |]
      output =
        [str|DRAW
            |]
    main `runWith` input $ (`shouldBe` output)
