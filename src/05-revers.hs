revList :: [a] -> [a]
revList []     = []
revList (x:xs) = revList xs ++ [x]

main :: IO ()
main = do
    putStrLn "## 5: Reverse a List"
    putStrLn "revList [1,2,3,4]"
    print (revList [1,2,3,4])
