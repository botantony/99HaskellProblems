removeAt :: Int -> String -> String
removeAt n "" = ""
removeAt n (x:xs)
    | n == 0    = xs
    | otherwise = x : removeAt (n - 1) xs

main :: IO ()
main = do
    putStrLn "## 20: Remove the K'th Element From a List"
    putStrLn "removeAt 1 \"abcd\""
    print (removeAt 1 "abcde")
