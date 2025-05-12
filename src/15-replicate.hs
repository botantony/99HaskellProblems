customReplicate :: Int -> String -> String
customReplicate 0 _      = ""
customReplicate _ ""     = ""
customReplicate n (x:xs) = replicate n x ++ customReplicate n xs

main :: IO ()
main = do
    putStrLn "## 15: Replicate the Elements of a List a Given Number of Times"
    putStrLn "replicate 3 \"abc\""
    print (replicate 3 "abc")
