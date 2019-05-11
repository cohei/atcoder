{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module Diverta2019.CSpec (spec) where

import           Test.Hspec    (Spec, it)
import           Text.Heredoc  (str)

import           Diverta2019.C (main)
import           Test          (shouldInteractAs)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|3
            |ABCA
            |XBAZ
            |BAD
            |]
      output =
        [str|2
            |]
    main `shouldInteractAs` (input, output)

  it "Example 2" $ do
    let
      input =
        [str|9
            |BEWPVCRWH
            |ZZNQYIJX
            |BAVREA
            |PA
            |HJMYITEOX
            |BCJHMRMNK
            |BP
            |QVFABZ
            |PRGKSPUNA
            |]
      output =
        [str|4
            |]
    main `shouldInteractAs` (input, output)

  it "Example 3" $ do
    let
      input =
        [str|7
            |RABYBBE
            |JOZ
            |BMHQUVA
            |BPA
            |ISU
            |MCMABAOBHZ
            |SZMEHMA
            |]
      output =
        [str|4
            |]
    main `shouldInteractAs` (input, output)
