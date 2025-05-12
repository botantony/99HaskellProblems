data Rle a = OneRle a
    | ManyRle (Integer, a)
    deriving (Show, Eq)

decodeEasy :: [Rle Char] -> String
decodeEasy []     = ""
decodeEasy ((OneRle x):xs) = x : decodeEasy xs
decodeEasy ((ManyRle (y, x)):xs) = replicate (fromIntegral y) x ++ decodeEasy xs

main :: IO ()
main = do
    putStrLn "## 12: Decode a Run-Length Encoded List"
    putStrLn "decodeEasy [ManyRle (4, 'a'), OneRle 'b', ManyRle (2, 'c'), OneRle 'd', ManyRle (4, 'e')]"
    print (decodeEasy [ManyRle (4, 'a'), OneRle 'b', ManyRle (2, 'c'), OneRle 'd', ManyRle (4, 'e')])
