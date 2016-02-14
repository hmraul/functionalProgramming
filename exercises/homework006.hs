
evens [] = []
evens (x:xs)
    | even x = [x] ++ evens xs
    | otherwise = evens xs


squares 0 = []
squares x = squares (x-1) ++ [x*x]

sumSquares n = sum (squares n)


squares' 0 _ = []
squares' m n = squares' (m-1) n ++ [(m+n) * (m+n)]

sumSquares' x = sum . uncurry squares' $ (x, x)
