import System.Random.Stateful

-- Common shuffle function
shuffle :: [a] -> IO [a]
shuffle [] = return []
shuffle xs = do
    i   <- uniformRM (0, length xs - 1) globalStdGen
    let (left, rest) = splitAt i xs
    case rest of
        []     -> return []
        (x:rs) -> do
            shuffleRest <- shuffle (left ++ rs)
            return (x:shuffleRest)

randomSelect :: [a] -> Int -> IO [a]
randomSelect [] _ = return []
randomSelect xs n
    | length xs < n = return []
    | otherwise     = take n <$> shuffle xs

lotto :: Int -> Int -> IO [Int]
lotto n m = randomSelect [1..m] n

main :: IO ()
main = do
    putStrLn "## 24: Lotto: Draw N Different Random Numbers From the Set 1..M"
    putStrLn "lotto 6 49"
    selected <- lotto 6 49
    print (selected)
