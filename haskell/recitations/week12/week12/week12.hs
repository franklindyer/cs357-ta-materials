data Color = Red | Blue | Green

data Result a = Success a | Nope

instance Show a => Show (Result a) where
  show (Success output) = "Result is: " ++ show output
  show Nope             = "hahahah"

-- @Student: why does `show (Success Red)` fail?

f1 :: Result Integer -> Integer
f1 Nope        = 0
f1 (Success x) = x

-- @Jose: explain why this fails
-- f2 :: Result a -> a
-- f2 Nope        = 0
-- f2 (Success x) = x

data ZeckendorfRepr = Cons Integer ZeckendorfRepr | Null

fib :: Integer -> [Integer]
fib 0 = [1]
fib 1 = [1, 1]
fib n =
  (head prevFibs) + (head (tail prevFibs)) : prevFibs
  where prevFibs = fib (n - 1)

zeckendorfAux :: Integer -> [Integer] -> Result ZeckendorfRepr
zeckendorfAux _ []           = Nope
zeckendorfAux 0 _            = Success Null
-- @Students: After running `zeckendorf 4` please remove
-- the comments of the next 3 lines
-- zeckendorfAux n [x]
--   | n == x    = Success $ Cons n Null
--   | otherwise = Nope
zeckendorfAux n (x : y : xs) =
  if (n >= x) then
    case zeckendorfAux (n - x) xs of
      Nope       -> zeckendorfAux n (y : xs)
      Success ys -> Success $ Cons x ys
  else
    zeckendorfAux n (y : xs)

zeckendorf n = zeckendorfAux n (fib n)

instance Show ZeckendorfRepr  where
  show (Cons x Null) = show x 
  show (Cons x xs)   = show x ++ " + " ++ show xs
  show Null          = ""

containsOne :: ZeckendorfRepr -> Bool
containsOne Null          = False
containsOne (Cons x Null) = x == 1
containsOne (Cons _ xs)   = containsOne xs

-- Participation activity:
-- Write a function `numberOfOnes` that
-- given a list of integers ([Integer])
-- the function returns the number of
-- numbers which their Zeckendorf representation
-- contains a 1
-- Hint: you might find convenient to use the
-- function `containsOne` provided in this file
-- Tests:
-- Test 1: numberOfOnes [1] => 1
-- Test 2: numberOfOnes [1, 2] => 1
-- Test 3: numberOfOnes [1 .. 10] => 4
numberOfOnes :: [Integer] -> Integer
numberOfOnes xs = undefined 
