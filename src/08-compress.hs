compress :: String -> String
compress []     = []
compress [x]    = [x]
compress (x:xs) | x == head xs = compress xs
                | otherwise    = x : compress xs

main :: IO ()
main = do
    putStrLn "## 8: Eliminate Duplicates"
    putStrLn "compress \"aaaaabbbcddde\""
    print (compress "aaaaabbbcddde")
