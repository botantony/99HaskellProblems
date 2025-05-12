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

premutation :: [a] -> IO [a]
premutation = shuffle

main :: IO ()
main = do
    putStrLn "## 25: Generate a Random Permutation of the Elements of a List"
    putStrLn "premutation [1,2,3,4,5,6]"
    selected <- premutation [1,2,3,4,5,6]
    print (selected)
