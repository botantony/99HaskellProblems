myLast :: [a] -> Maybe a
myLast []     = Nothing
myLast [x]    = Just x
myLast (_:xs) = myLast xs

main :: IO ()
main = do
    putStrLn "## 1: Tail of a List"
    putStrLn "myLast [1,2,3,4]"
    print (myLast [1,2,3,4])
    putStrLn "myLast []"
    print (myLast ([] :: [Int]))
