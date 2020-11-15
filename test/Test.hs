{-# LANGUAGE NamedFieldPuns #-}
module Test (runWith) where

import           Control.Exception (throwIO)
import           Data.ByteString   (ByteString)
import           Test.Hspec        (Expectation)
import           Test.Main         (ProcessResult (ProcessResult, prException, prStdout),
                                    captureProcessResult, withStdin)

runWith :: IO () -> ByteString -> (ByteString -> Expectation) -> IO ()
runWith action input expectation = do
  ProcessResult { prException, prStdout } <- captureProcessResult $ withStdin input action
  maybe (pure ()) throwIO prException
  expectation prStdout
