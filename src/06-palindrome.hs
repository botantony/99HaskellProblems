palindrome :: String -> Bool
palindrome []  = True
palindrome [x] = True
palindrome (x:xs) | x == last xs = palindrome (init xs)
                  | otherwise    = False

main :: IO ()
main = do
    putStrLn "## 6: Palindrome"
    putStrLn "palindrome \"xamax\""
    print (palindrome "xamax")
    putStrLn "palindrome \"xammax\""
    print (palindrome "xammax")
    putStrLn "palindrome \"xa\""
    print (palindrome "xa")
