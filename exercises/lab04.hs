triangle :: Integer -> Integer
triangle 0 = 0
triangle x = x + triangle (x - 1)