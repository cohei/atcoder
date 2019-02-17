module Test (shouldInteractAs) where

import           Data.ByteString (ByteString)
import           Test.Hspec      (shouldBe)
import           Test.Main       (captureProcessResult, prStdout, withStdin)

shouldInteractAs :: IO () -> (ByteString, ByteString) -> IO ()
shouldInteractAs action (input, output) = do
  result <- captureProcessResult $ withStdin input action
  prStdout result `shouldBe` output
