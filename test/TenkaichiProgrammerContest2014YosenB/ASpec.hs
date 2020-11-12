{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module TenkaichiProgrammerContest2014YosenB.ASpec (spec) where

import           Data.ByteString                        (ByteString)
import           Test.Hspec                             (Spec, it)
import           Text.Heredoc                           (str)

import           TenkaichiProgrammerContest2014YosenB.A (main)
import           Test                                   (shouldInteractAs)

spec :: Spec
spec = do
  it "Example" $ do
    let
      input, output :: ByteString
      input =
        [str|MRHAGIYA
            |]
      output =
        [str|MRHAGIXILE
            |]
    main `shouldInteractAs` (input, output)
