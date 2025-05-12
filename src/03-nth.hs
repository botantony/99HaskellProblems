nth :: Integer -> [a] -> Maybe a
nth _ [] = Nothing
nth 0 xs = Just $ head xs
nth n (_:xs) = nth (n - 1) xs

main :: IO ()
main = do
    putStrLn "## 3: N'th Element of a List"
    putStrLn "nth 2 [1,2,3]"
    print (nth 2 [1,2,3])
    putStrLn "nth 4 [1,2,3]"
    print (nth 4 [1,2,3])
