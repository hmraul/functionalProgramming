import System.IO
import Data.Maybe

getCh :: IO Char
getCh = do hSetEcho stdin False
           c <- getChar
           hSetEcho stdin True
           return c

sgetLine :: IO String
sgetLine = do x <- getCh
              if x == '\n' then
              	do putChar x
              	   return []
              else
              	do putChar '-'
              	   xs <- sgetLine
              	   return (x:xs)

guess :: String -> IO ()
guess word =
	do putStr "> "
	   xs <- getLine
	   if xs == word then
	   	  putStrLn "You got it!"
	   else
	   	  do putStrLn (diff word xs)
	   	     guess word

diff :: String -> String -> String
diff xs ys =
	[if elem x ys then x else '-' | x <- xs]

putStr' [] = return ()
putStr' (x:xs) = putChar x >> putStr' xs


putStrLn' [] = putChar '\n'
putStrLn' xs = putStr' xs >> putChar '\n'


getLine' = get []

get :: String -> IO String
get xs
  = do x <- getChar
       case x of
       	    '\n' -> return xs
       	    _ -> get (xs ++ [x])


interact' :: (String -> String) -> IO ()
interact' f
  = do input <- getLine
       putStrLn (f input)



-- sequence_' [] = return []
-- sequence_' (m:ms) = m >> \ _ -> sequence_' ms

pertwo x = x * 2

sequence_' :: Monad m => [m a] -> m ()
sequence_' [] = return ()
sequence_' (m : ms) = (foldl (>>) m ms) >> return ()


-- A function that takes care of the "divide by zero" problem
(./.) :: Fractional a => a -> a -> Maybe a
x ./. 0 = Nothing
x ./. y = Just (x / y)

foldLeftM             :: (Monad m) => (a -> b -> m a) -> a -> [b] -> m a
foldLeftM f a []      =  return a
foldLeftM f a (x:xs)  =  f a x >>= \y -> foldLeftM f y xs

divide :: Fractional a => a -> [a] -> Maybe a
divide x ys = foldLeftM (./.) x ys

-- foldRightM :: Monad m => (a -> b -> m b) -> b -> [a] -> m b
-- foldRightM f [] b      =  return b
-- foldRightM f (x:xs) b  =  f x b >>= \y -> foldRightM f xs y


foldRightM :: Monad m => (a -> b -> m b) -> b -> [a] -> m b
foldRightM acc b [] = return b
foldRightM acc b (a : as) = do b' <- foldRightM acc b as
                               acc a b'


mapM' :: Monad m => (a -> m b) -> [a] -> m [b]
mapM' f [] = return []
mapM' f (a : as) = f a >>= \b -> mapM' f as >>= \bs -> return (b : bs)
-- mapM' f as = sequence' (map f as)

filterM' :: Monad m => (a -> m Bool) -> [a] -> m [a]
filterM' p [] = return []
filterM' p (a : as) = do r <- p a
                         aas <- filterM' p as
                         if r then return (a : aas) else return aas