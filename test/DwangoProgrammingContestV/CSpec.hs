{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module DwangoProgrammingContestV.CSpec (spec) where

import           Data.ByteString             (ByteString)
import           Test.Hspec                  (Spec, it, shouldBe)
import           Text.Heredoc                (str)

import           DwangoProgrammingContestV.C (main)
import           Test                        (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input, output :: ByteString
      input =
        [str|18
            |DWANGOMEDIACLUSTER
            |1
            |18
            |]
      output =
        [str|1
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input, output :: ByteString
      input =
        [str|18
            |DDDDDDMMMMMCCCCCCC
            |1
            |18
            |]
      output =
        [str|210
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 3" $ do
    let
      input, output :: ByteString
      input =
        [str|54
            |DIALUPWIDEAREANETWORKGAMINGOPERATIONCORPORATIONLIMITED
            |3
            |20 30 40
            |]
      output =
        [str|0
            |1
            |2
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 4" $ do
    let
      input, output :: ByteString
      input =
        [str|30
            |DMCDMCDMCDMCDMCDMCDMCDMCDMCDMC
            |4
            |5 10 15 20
            |]
      output =
        [str|10
            |52
            |110
            |140
            |]
    main `runWith` input $ (`shouldBe` output)
