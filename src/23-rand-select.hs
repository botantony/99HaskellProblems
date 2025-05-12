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

main :: IO ()
main = do
    putStrLn "## 23: Extract a Given Number of Randomly Selected Elements From a List"
    putStrLn "randomSelect [1,2,3,4,5] 3"
    selected <- randomSelect [1,2,3,4,5] 3
    print (selected)
