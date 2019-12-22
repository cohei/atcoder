{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest148.BSpec (spec) where

import           Test.Hspec                  (Spec, it)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest148.B (main)
import           Test                        (shouldInteractAs)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|2
            |ip cc
            |]
      output =
        [str|icpc
            |]
    main `shouldInteractAs` (input, output)

  it "Example 2" $ do
    let
      input =
        [str|8
            |hmhmnknk uuuuuuuu
            |]
      output =
        [str|humuhumunukunuku
            |]
    main `shouldInteractAs` (input, output)

  it "Example 3" $ do
    let
      input =
        [str|5
            |aaaaa aaaaa
            |]
      output =
        [str|aaaaaaaaaa
            |]
    main `shouldInteractAs` (input, output)
