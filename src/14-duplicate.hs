duplicate :: String -> String
duplicate ""     = ""
duplicate (x:xs) = replicate 2 x ++ duplicate xs

main :: IO ()
main = do
    putStrLn "## 14: Duplicate the Elements of a List"
    putStrLn "duplicate \"abcd\""
    print (duplicate "abcd")
