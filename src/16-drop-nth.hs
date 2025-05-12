dropNth :: String -> Int -> String
dropNth xs n = fn n n xs
    where
        fn acc n ""     = ""
        fn acc n (x:xs)
            | acc == 1  = fn n n xs
            | otherwise = x : fn (acc - 1) n xs

main :: IO ()
main = do
    putStrLn "## 16: Drop Every N'th Element From a List"
    putStrLn "dropNth \"abcdefgh\" 3"
    print (dropNth "abcdefgh" 3)
