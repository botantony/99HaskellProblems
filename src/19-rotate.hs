rotate :: String -> Int -> String
rotate "" n = ""
rotate xs 0 = xs
rotate xs n = fn n "" xs
    where
        fn n acc ""     = acc
        fn n acc (x:xs)
            | n == 1    = xs ++ acc ++ [x]
            | otherwise = fn (n - 1) (acc ++ [x]) xs

main :: IO ()
main = do
    putStrLn "## 19: Rotate a List N Places to the Left"
    putStrLn "rotate \"abcdefgh\" 3"
    print (rotate "abcdefgh" 3)
