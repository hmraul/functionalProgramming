n = a `div` length xs
  where
  	a = 10
  	xs = [1, 2, 3, 4, 5]

xs = [1,2,3,4,5,6]


mproduct [] = 1
mproduct (x : xs) = x * product xs


--qsort [] = []
--qsort(x : xs) = qsort larger ++ [x] ++ qsort smaller
--  where smaller = [a | a <-xs, a <= x]
--        larger = [b | b <- xs, b > x]

qsort [] = []
qsort(x : xs) 
  = reverse
      ( reverse (qsort smaller) ++ [x] ++ reverse (qsort larger)) 
  where smaller = [a | a <-xs, a <= x]
        larger = [b | b <- xs, b > x]
