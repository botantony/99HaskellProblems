pack :: String -> [String]
pack xs = fn [] "" xs
    where
        fn acc curr ""     = []
        fn acc curr [x]    = acc ++ [x : curr]
        fn acc curr (x:y:xs)
            | x == y    = fn acc (x : curr) (y:xs)
            | otherwise = fn (acc ++ [x : curr]) "" (y:xs)

main :: IO ()
main = do
    putStrLn "## 9: Pack Consecutive Duplicates"
    putStrLn "pack \"aaaabbbcdeee\""
    print (pack "aaaabbbcdeee")
