range :: Int -> Int -> [Int]
range i j
    | i < j     = i : range (i + 1) j
    | otherwise = [i]

main :: IO ()
main = do
    putStrLn "## 22: Create a List Containing All Integers Within a Given Range"
    putStrLn "range 4 9"
    print (range 4 9)
