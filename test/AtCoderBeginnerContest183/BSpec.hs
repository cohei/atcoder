{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
{-# LANGUAGE ViewPatterns      #-}
module AtCoderBeginnerContest183.BSpec (spec) where

import           Data.ByteString             (ByteString)
import           Data.ByteString.Char8       (unpack)
import           Test.Hspec                  (Spec, it, shouldSatisfy)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest183.B (main)
import           Test                        (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input, output :: ByteString
      input =
        [str|1 1 7 2
            |]
      output =
        [str|3.0000000000
            |]
    main `runWith` input $ (`shouldSatisfy` withinErrorMargin output)

  it "Example 2" $ do
    let
      input, output :: ByteString
      input =
        [str|1 1 3 2
            |]
      output =
        [str|1.6666666667
            |]
    main `runWith` input $ (`shouldSatisfy` withinErrorMargin output)

  it "Example 3" $ do
    let
      input, output :: ByteString
      input =
        [str|-9 99 -999 9999
            |]
      output =
        [str|-18.7058823529
            |]
    main `runWith` input $ (`shouldSatisfy` withinErrorMargin output)

withinErrorMargin :: ByteString -> ByteString -> Bool
withinErrorMargin (read . unpack -> expected) (read . unpack -> actual) =
  let
    absoluteError, relativeError :: Double
    absoluteError = abs $ actual - expected
    relativeError = abs $ absoluteError / expected
  in
    absoluteError < 10e-6 || relativeError < 10e-6
