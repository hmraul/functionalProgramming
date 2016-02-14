-- EX 0

--1 NO
--halve xs = (take n xs, drop n xs)
--  where n = length xs / 2

--2 OK
--halve xs = splitAt(length xs `div`2) xs

--3 OK
--halve xs = (take (n `div` 2) xs, drop (n `div` 2) xs)
--    where n = length xs

--4 NO
--halve xs = splitAt(length xs `div` 2)

--5 NO
--halve xs = (take n xs, drop (n + 1) xs)
--    where n = length xs `div` 2


--6 OK
-- halve xs = splitAt(div (length xs) 2) xs

--7 KO
-- halve xs = splitAt(length xs / 2) xs

--8 OK
-- halve xs = (take n xs, drop n xs)
--    where n = length xs `div` 2


-- EX 1
--1 NO
--safetail xs = if null xs then [] esle tail xs

--2 OK
-- safetail [] = []
-- safetail(_ : xs) = xs

--3 NO
-- safetail (_ : xs)
--     | null xs = []
--     | otherwise = tail xs

-- 4 OK
-- safetail xs
--     | null xs = []
--     | otherwise = tail xs

-- 5 NO
-- safetail xs = tail xs
-- safetail [] = []

-- 6 OK
-- safetail [] = []
-- safetail xs = tail xs

-- 7 NO
-- safetail  [x] = [x]
-- safetail (_ : xs) = xs


-- 8 OK
-- safetail
--     = \ xs ->
--         case xs of
--         	[] -> []
--         	(_ : xs) -> xs


-- EX 2
--import Prelude hiding ((||))

-- False || False = False
-- _ || _ = True


-- False || b = b
-- True || _ = True

-- b || c 
--    | b == c = c
--    | otherwise = True

--EX 3
-- import Prelude hiding ((&&))

-- a && b = if b
-- 	then a
-- 	else False

-- EX 4
-- mult x y z = \ x -> (\ y -> (\ z -> x * y * z))
-- mult = \ x -> ( x * \ y -> (y * \ z -> z))
-- mult = \ x -> (\ y -> (\ z -> x * y * z))
-- mult = ((((\ x -> \ y) -> \ z) -> x * y) * z)




-- remove n xs = take n xs ++ drop (n + 1) xs

-- funct :: Int -> [a] -> [a]
-- funct x xs = take (x + 1) xs ++ drop x xs

e13 :: Int -> Int -> Int
e13 x y = x + y * y