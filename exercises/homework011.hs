
-- Ex 6
-- KO fibs = 1 : [x + y | (x,y) <- zip fibs (tail fibs)]
-- KO fibs = 0 : 1 : zipWith (*) fibs(tail fibs)
fibs = 0 : 1 : [x + y | (x,y) <- zip fibs (tail fibs)]
-- 

-- EX 7
-- KO fib n = last (take n fibs)
-- KO fib n = head (drop (n-1) fibs)
fib n = fibs !! n
-- KO fib n = index fibs n


-- EX 8
largeFib = head (dropWhile (<=1000) fibs)
-- KO largeFib = last (take 19 fibs)
-- KO largeFib = filter (> 1000) fibs
-- KO largeFib = head (drop 1000 fibs)