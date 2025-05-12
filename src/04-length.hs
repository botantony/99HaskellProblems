len :: [a] -> Integer
len []     = 0
-- My solution:
-- len (x:xs) = 1 + len xs
-- Suggestion from hlint
len xs = foldr (\ x -> (+) 1) 0 xs

main :: IO ()
main = do
    putStrLn "## 4: Length of a List"
    putStrLn "len [1,2,3]"
    print (len [1,2,3])
    putStrLn "len []"
    print (len [])
