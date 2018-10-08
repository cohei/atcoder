module AtCoderBeginnerContest112.A (main) where

main :: IO ()
main = do
  n <- readLn :: IO Int
  case n of
    1 -> putStrLn "Hello World"
    2 -> print =<< ((+) <$> readLn <*> (readLn :: IO Int))
    _ -> undefined
