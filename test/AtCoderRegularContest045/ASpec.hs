{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderRegularContest045.ASpec (spec) where

import           Data.ByteString            (ByteString)
import           Test.Hspec                 (Spec, it, shouldBe)
import           Text.Heredoc               (str)

import           AtCoderRegularContest045.A (main)
import           Test                       (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input, output :: ByteString
      input =
        [str|Left Right AtCoder
            |]
      output =
        [str|< > A
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input, output :: ByteString
      input =
        [str|Left Left Right Right AtCoder
            |]
      output =
        [str|< < > > A
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 3" $ do
    let
      input, output :: ByteString
      input =
        [str|Right Right AtCoder Left Left AtCoder
            |]
      output =
        [str|> > A < < A
            |]
    main `runWith` input $ (`shouldBe` output)
