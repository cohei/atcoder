{-# LANGUAGE NamedFieldPuns #-}
module Test (shouldInteractAs) where

import           Control.Exception (throwIO)
import           Data.ByteString   (ByteString)
import           Test.Hspec        (shouldBe)
import           Test.Main         (ProcessResult (ProcessResult, prException, prStdout),
                                    captureProcessResult, withStdin)

shouldInteractAs :: IO () -> (ByteString, ByteString) -> IO ()
shouldInteractAs action (input, output) = do
  ProcessResult { prException, prStdout } <- captureProcessResult $ withStdin input action
  maybe (pure ()) throwIO prException
  prStdout `shouldBe` output
