mySplitAt :: String -> Int -> (String, String)
mySplitAt xs n = fn n "" xs
    where
        fn _ acc "" = (acc, "")
        fn n acc (x:xs)
            | n == 0    = (acc, x:xs)
            | otherwise = fn (n - 1) (acc ++ [x]) xs

main :: IO ()
main = do
    putStrLn "## 17: Split a List Into Two Parts; The Length of the First Part Is Given"
    putStrLn "mySplitAt \"abcdefghij\" 3"
    print (mySplitAt "abcdefghij" 3)
    putStrLn "mySplitAt \"abcd\" 5"
    print (mySplitAt "abcd" 5)
