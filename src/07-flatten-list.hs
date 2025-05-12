data MyNode a = One a
            | Many [MyNode a]
            deriving (Show, Eq)

flatten :: [MyNode a] -> [a]
flatten [] = []
flatten ((One x):xs)  = x : flatten xs
flatten ((Many x):xs) = flatten x ++ flatten xs

main :: IO ()
main = do
    putStrLn "## 7: Flatten a List"
    putStrLn "flatten [One 1, Many [One 2, Many [One 3, One 4], One 5]]"
    print (flatten [One 1, Many [One 2, Many [One 3, One 4], One 5]])
