module AtCoderRegularContest045.A (main) where

main :: IO ()
main = interact transduce

transduce :: String -> String
transduce = (++ "\n") . unwords . map instruct . words

instruct :: String -> String
instruct "Left"    = "<"
instruct "Right"   = ">"
instruct "AtCoder" = "A"
instruct _         = error "instruct: invalid input"

test_transduce1 :: Bool
test_transduce1 = transduce "Left Right AtCoder\n" == "< > A\n"

test_transduce2 :: Bool
test_transduce2 = transduce "Left Left Right Right AtCoder\n" == "< < > > A\n"

test_transduce3 :: Bool
test_transduce3 = transduce "Right Right AtCoder Left Left AtCoder\n" == "> > A < < A\n"

test :: IO ()
test = mapM_ print [test_transduce1, test_transduce2, test_transduce3]
