encodeEasy :: String -> [(Integer, Char)]
encodeEasy xs = fn [] 1 xs
    where
        fn acc count []  = []
        fn acc count [x] = acc ++ [(count, x)]
        fn acc count (x:y:xs)
            | x == y     = fn acc (count + 1) (y:xs)
            | otherwise  = fn (acc ++ [(count, x)]) 1 (y:xs)

main :: IO ()
main = do
    putStrLn "## 10: Run-Length Encoding"
    putStrLn "encodeEasy \"aaaabccaadeeee\""
    print (encodeEasy "aaaabccaadeeee")
