insertAt :: String -> Int -> String -> String
insertAt i n "" = i
insertAt i n (x:xs)
    | n == 0    = i ++ xs
    | otherwise = x : insertAt i (n - 1) xs

main :: IO ()
main = do
    putStrLn "## 21: Insert an Element at a Given Position Into a List"
    putStrLn "insertAt \"alfa\" 1 \"abcde\""
    print (insertAt "alfa" 1 "abcde")
