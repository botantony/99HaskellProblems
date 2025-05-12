data Rle a = OneRle a
    | ManyRle (Integer, a)
    deriving (Show, Eq)

encodeHarder :: String -> [Rle Char]
encodeHarder xs = fn [] 1 xs
    where
        createElem (1, a)   = [OneRle a]
        createElem (x, a)   = [ManyRle (x, a)]
        fn acc count []  = []
        fn acc count [x] = acc ++ createElem (count, x)
        fn acc count (x:y:xs)
            | x == y     = fn acc (count + 1) (y:xs)
            | otherwise  = fn (acc ++ createElem (count, x)) 1 (y:xs)

main :: IO ()
main = do
    putStrLn "## 11: Modified Run-Length Encoding"
    putStrLn "encodeHarder \"aaaabccaadeeee\""
    print (encodeHarder "aaaabccaadeeee")
