{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest128.BSpec (spec) where

import           Test.Hspec                  (Spec, it)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest128.B (main)
import           Test                        (shouldInteractAs)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|6
            |khabarovsk 20
            |moscow 10
            |kazan 50
            |kazan 35
            |moscow 60
            |khabarovsk 40
            |]
      output =
        [str|3
            |4
            |6
            |1
            |5
            |2
            |]
    main `shouldInteractAs` (input, output)

  it "Example 2" $ do
    let
      input =
        [str|10
            |yakutsk 10
            |yakutsk 20
            |yakutsk 30
            |yakutsk 40
            |yakutsk 50
            |yakutsk 60
            |yakutsk 70
            |yakutsk 80
            |yakutsk 90
            |yakutsk 100
            |]
      output =
        [str|10
            |9
            |8
            |7
            |6
            |5
            |4
            |3
            |2
            |1
            |]
    main `shouldInteractAs` (input, output)
