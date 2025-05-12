extract :: Int -> [a] -> [[a]]
extract n xs
    | n <= 0    = [[]]
    | otherwise = case xs of
        []       -> []
        (x:rest) -> map (\y -> x : y) (extract (n - 1) rest) ++ extract n rest

main :: IO ()
main = do
    putStrLn "## 26: Generate the Combinations of K Distinct Objects Chosen From the N Elements of a List"
    putStrLn "extract 2 [1,2,3,4]"
    print (extract 2 [1,2,3,4])
