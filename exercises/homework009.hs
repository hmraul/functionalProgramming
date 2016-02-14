
import Data.List
import Data.Char
import Hugs.IOExts (unsafeCoerce)


-- EX 0:
data Nat = Zero
         | Succ Nat
         deriving Show

natToInteger :: Nat -> Integer
natToInteger Zero = 0
natToInteger (Succ n) = natToInteger n + 1

-- EX 1:

integerToNat :: Integer -> Nat
--0 OK
integerToNat 0 = Zero
integerToNat (n+1) = Succ (integerToNat n)

--1 Fail
--integerToNat 0 = Succ Zero
--integerToNat n = (Succ (integerToNat n))

--2 fail
--integerToNat n
--  = product [(unsafeCoerce c) :: Integer | c <- show n ]

--3 fail
--integerToNat n = integerToNat n

--4 OK
--integerToNat (n+1) = Succ (integerToNat n)
--integerToNat 0 = Zero

--5 OK
--integerToNat (n+1) = let m = integerToNat n in Succ m
--integerToNat 0 = Zero

--6 Fail
--integerToNat = head . m
--    where {
--          ; m 0 = [0]
--          ; m (n + 1) = [sum [x | x <- (1 : m n)]]
--          }

--7 Fail
--integerToNat :: Integer -> Nat
-- integerToNat = \n -> genericLength [c | c <- show n, isDigit c]

-- EX 5:

--data Tree = Leaf Integer
--          | Node Tree Tree

--balanced :: Tree -> Bool
--leaves (Leaf x) = x
--leaves (Node l r) = leaves l + leaves r
--balanced (Leaf _) = True
--balanced (Node l r)
--  = abs (leaves l -leaves r) <= 1 || balanced l || balanced r


-- EX 10
--0 fail
--instance Monad [] where
--	return x = [x]
--	xs >>= f = f xs

--instance Monad [] where
--	return x = [x]
--	xs >>= f = f concat (f xs)


--instance Monad [] where
--	return x = [x]
--	xs >>= f = concat (map f xs)

--instance Monad [] where
--	return x = [x]
--	xs >>= f = map f xs

