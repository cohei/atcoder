{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest135.DSpec (spec) where

import           Test.Hspec                  (Spec, it, shouldBe)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest135.D (main)
import           Test                        (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input =
        [str|??2??5
            |]
      output =
        [str|768
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input =
        [str|?44
            |]
      output =
        [str|1
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 3" $ do
    let
      input =
        [str|7?4
            |]
      output =
        [str|0
            |]
    main `runWith` input $ (`shouldBe` output)

  -- it "Example 4" $ do
  --   let
  --     input =
  --       [str|?6?42???8??2??06243????9??3???7258??5??7???????774????4?1??17???9?5?70???76???
  --           |]
  --     output =
  --       [str|153716888
  --           |]
  --   main `runWith` input $ (`shouldBe` output)
