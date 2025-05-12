-- 1. Implement `last` function
myLast :: [a] -> Maybe a
myLast []     = Nothing
myLast [x]    = Just x
myLast (_:xs) = myLast xs

-- 2. Last 2 elements in the list
last2 :: [a] -> Maybe (a, a)
last2 []  = Nothing
last2 [x] = Nothing
last2 (x:xs) | length xs == 1 = Just (x, head xs)
             | otherwise      = last2 xs

-- 3. Nth element int the list
nth :: Integer -> [a] -> Maybe a
nth _ [] = Nothing
nth 0 xs = Just $ head xs
nth n (_:xs) = nth (n - 1) xs

-- 4. Implement `length` function
len :: [a] -> Integer
len []     = 0
-- My solution:
-- len (x:xs) = 1 + len xs
-- Suggestion from hlint
len xs = foldr (\ x -> (+) 1) 0 xs

-- 5. Reverse a list
revList :: [a] -> [a]
revList []     = []
revList (x:xs) = revList xs ++ [x]

-- 6. Palindrome (doesn't work with [a] lists, need to implement Eq a)
palindrome :: String -> Bool
palindrome []  = True
palindrome [x] = True
palindrome (x:xs) | x == last xs = palindrome (init xs)
                  | otherwise    = False

-- 7. Flatten a list
data MyNode a = One a
            | Many [MyNode a]
            deriving (Show, Eq)

flatten :: [MyNode a] -> [a]
flatten [] = []
flatten ((One x):xs)  = x : flatten xs
flatten ((Many x):xs) = flatten x ++ flatten xs

-- 8. Eliminate duplicates (Eq a doesn't work)
compress :: String -> String
compress []     = []
compress [x]    = [x]
compress (x:xs) | x == head xs = compress xs
                | otherwise    = x : compress xs

-- 9. Pack duplicates
pack :: String -> [String]
pack xs = fn [] "" xs
    where
        fn acc curr ""     = []
        fn acc curr [x]    = acc ++ [x : curr]
        fn acc curr (x:y:xs)
            | x == y    = fn acc (x : curr) (y:xs)
            | otherwise = fn (acc ++ [x : curr]) "" (y:xs)

-- 10. Run-Length Encoding
encodeEasy :: String -> [(Integer, Char)]
encodeEasy xs = fn [] 1 xs
    where
        fn acc count []  = []
        fn acc count [x] = acc ++ [(count, x)]
        fn acc count (x:y:xs)
            | x == y     = fn acc (count + 1) (y:xs)
            | otherwise  = fn (acc ++ [(count, x)]) 1 (y:xs)

data Rle a = OneRle a
    | ManyRle (Integer, a)
    deriving (Show, Eq)

-- 11. Modified Run-Length Encoding
encodeHarder :: String -> [Rle Char]
encodeHarder xs = fn [] 1 xs
    where
        createElem (1, a)   = [OneRle a]
        createElem (x, a)   = [ManyRle (x, a)]
        fn acc count []  = []
        fn acc count [x] = acc ++ createElem (count, x)
        fn acc count (x:y:xs)
            | x == y     = fn acc (count + 1) (y:xs)
            | otherwise  = fn (acc ++ createElem (count, x)) 1 (y:xs)

-- 12. Decode a Run-Length Encoded List
decodeEasy :: [Rle Char] -> String
decodeEasy []     = ""
decodeEasy ((OneRle x):xs) = x : decodeEasy xs
decodeEasy ((ManyRle (y, x)):xs) = replicate (fromIntegral y) x ++ decodeEasy xs

-- 14. Duplicate the Elements of a List
duplicate :: String -> String
duplicate ""     = ""
duplicate (x:xs) = replicate 2 x ++ duplicate xs

-- 15. Replicate the Elements of a List a Given Number of Times
customReplicate :: Int -> String -> String
customReplicate 0 _      = ""
customReplicate _ ""     = ""
customReplicate n (x:xs) = replicate n x ++ customReplicate n xs

-- 16. Drop Every N'th Element From a List
dropNth :: String -> Int -> String
dropNth xs n = fn n n xs
    where
        fn acc n ""     = ""
        fn acc n (x:xs)
            | acc == 1  = fn n n xs
            | otherwise = x : fn (acc - 1) n xs

-- 17. splitAt
mySplitAt :: String -> Int -> (String, String)
mySplitAt xs n = fn n "" xs
    where
        fn _ acc "" = (acc, "")
        fn n acc (x:xs)
            | n == 0    = (acc, x:xs)
            | otherwise = fn (n - 1) (acc ++ [x]) xs

-- 18. Extract a Slice From a List
mySlice :: String -> Int -> Int -> String
mySlice "" i j = ""
mySlice xs i j
    | j > i     = take (j - i + 1) $ drop i xs
    | otherwise = ""

-- 19. Rotate a List N Places to the Left
rotate :: String -> Int -> String
rotate "" n = ""
rotate xs 0 = xs
rotate xs n = fn n "" xs
    where
        fn n acc ""     = acc
        fn n acc (x:xs)
            | n == 1    = xs ++ acc ++ [x]
            | otherwise = fn (n - 1) (acc ++ [x]) xs

-- 20. removeAt
removeAt :: Int -> String -> String
removeAt n "" = ""
removeAt n (x:xs)
    | n == 0    = xs
    | otherwise = x : removeAt (n - 1) xs

-- 21. insertAt
insertAt :: String -> Int -> String -> String
insertAt i n "" = i
insertAt i n (x:xs)
    | n == 0    = i ++ xs
    | otherwise = x : insertAt i (n - 1) xs

-- 22. Range
range :: Int -> Int -> [Int]
range i j
    | i < j     = i : range (i + 1) j
    | otherwise = [i]
