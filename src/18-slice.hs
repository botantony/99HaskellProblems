mySlice :: String -> Int -> Int -> String
mySlice "" i j = ""
mySlice xs i j
    | j > i     = take (j - i + 1) $ drop i xs
    | otherwise = ""

main :: IO ()
main = do
    putStrLn "## 18: Extract a Slice From a List"
    putStrLn "mySlice \"abcdefghij\" 2 6"
    print (mySlice "abcdefghij" 2 6)
