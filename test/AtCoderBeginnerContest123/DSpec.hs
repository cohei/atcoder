{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE QuasiQuotes       #-}
module AtCoderBeginnerContest123.DSpec (spec) where

import           Data.ByteString             (ByteString)
import           Test.Hspec                  (Spec, it, shouldBe)
import           Text.Heredoc                (str)

import           AtCoderBeginnerContest123.D (main)
import           Test                        (runWith)

spec :: Spec
spec = do
  it "Example 1" $ do
    let
      input, output :: ByteString
      input =
        [str|2 2 2 8
            |4 6
            |1 5
            |3 8
            |]
      output =
        [str|19
            |17
            |15
            |14
            |13
            |12
            |10
            |8
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 2" $ do
    let
      input, output :: ByteString
      input =
        [str|3 3 3 5
            |1 10 100
            |2 20 200
            |1 10 100
            |]
      output =
        [str|400
            |310
            |310
            |301
            |301
            |]
    main `runWith` input $ (`shouldBe` output)

  it "Example 3" $ do
    let
      input, output :: ByteString
      input =
        [str|10 10 10 20
            |7467038376 5724769290 292794712 2843504496 3381970101 8402252870 249131806 6310293640 6690322794 6082257488
            |1873977926 2576529623 1144842195 1379118507 6003234687 4925540914 3902539811 3326692703 484657758 2877436338
            |4975681328 8974383988 2882263257 7690203955 514305523 6679823484 4263279310 585966808 3752282379 620585736
            |]
      output =
        [str|23379871545
            |22444657051
            |22302177772
            |22095691512
            |21667941469
            |21366963278
            |21287912315
            |21279176669
            |21160477018
            |21085311041
            |21059876163
            |21017997739
            |20703329561
            |20702387965
            |20590247696
            |20383761436
            |20343962175
            |20254073196
            |20210218542
            |20150096547
            |]
    main `runWith` input $ (`shouldBe` output)
