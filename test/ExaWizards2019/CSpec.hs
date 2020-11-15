{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module ExaWizards2019.CSpec (spec) where

import           Test.Hspec       (Spec, it, shouldBe)
import           Text.Heredoc     (str)

import           ExaWizards2019.C (main)
import           Test             (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|3 4
            |ABC
            |A L
            |B L
            |B R
            |A R
            |]
      output =
        [str|2
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input =
        [str|8 3
            |AABCBDBA
            |A L
            |B R
            |A R
            |]
      output =
        [str|5
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 3" $ do
    let
      input =
        [str|10 15
            |SNCZWRCEWB
            |B R
            |R R
            |E R
            |W R
            |Z L
            |S R
            |Q L
            |W L
            |B R
            |C L
            |A L
            |N L
            |E R
            |Z L
            |S L
            |]
      output =
        [str|3
            |]
    main `runWith` input $ (`shouldBe` output)
