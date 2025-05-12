last2 :: [a] -> Maybe (a, a)
last2 []  = Nothing
last2 [x] = Nothing
last2 (x:xs) | length xs == 1 = Just (x, head xs)
             | otherwise      = last2 xs

main :: IO ()
main = do
    putStrLn "## 2: Last Two Elements of a List"
    putStrLn "last2 [1,2,3,4]"
    print (last2 [1,2,3,4])
    putStrLn "last2 [1]"
    print (last2 [1])
