data BinInt = Zero BinInt | One BinInt

-- ...0000
zero :: BinInt
zero = Zero zero

-- ...0001
one :: BinInt
one = One zero

showFirstDigs :: Int -> BinInt -> String
showFirstDigs 0 _ = "..."
showFirstDigs n (Zero b) = (showFirstDigs (n - 1) b) ++ "0"
showFirstDigs n (One b) = (showFirstDigs (n - 1) b) ++ "1"

-- ...0000101 + ...00001 = _____0

addone :: BinInt -> BinInt
addone (Zero b) = One b
addone (One b) = Zero (addone b)

minusone :: BinInt -> BinInt
minusone (Zero b) = One (minusone b)
minusone (One b) = Zero b

natToBin :: Int -> BinInt
natToBin 0 = zero
natToBin n = addone (natToBin (n - 1))

three :: BinInt
three = natToBin 3

plus :: BinInt -> BinInt -> BinInt
plus (Zero b1) (Zero b2) = Zero (plus b1 b2)
plus (Zero b1) (One b2) = One (plus b1 b2)
plus (One b1) (Zero b2) = One (plus b1 b2)
plus (One b1) (One b2) = addone (One (plus b1 b2))

instance Show BinInt where
  show b = showFirstDigs 20 b

negativeOne :: BinInt
negativeOne = One negativeOne

negativeTwo :: BinInt
negativeTwo = Zero negativeOne

negativeThree :: BinInt
negativeThree = plus negativeOne negativeTwo

-- Kind of behaves like -1/3
-- because x + x + x = -1
wtf3 :: BinInt
wtf3 = One (Zero wtf3)

-- Exercise 1: find "negative five"
-- i.e. define negativeFive :: BinInt
-- such that plus (natToBin 5) negativeFive gives ...00000

-- Exercise 2: define "times"
-- times :: BinInt -> BinInt -> BinInt
-- (times (natToBin 5) (natToBin 3)) ===> ...0001111

-- "2-adic numbers"

-- Appending zero to the beginning of a binary number
--   is the same as multiplying it by 2
--   (Zero b1) * b2
--   (2 * b1) * b2
--   2 * (b1 * b2)
--   Zero (b1 * b2)

-- 5 in binary is 101
-- ===> 1010 which is 10 (in base 10)

-- Appending one to the beginning of a binary number
--   is the same as multiplying it by 2, and adding 1
-- 5 in binary is 101
-- ===> 1011 which is 11 (in base 10)

times :: BinInt -> BinInt -> BinInt
times (Zero b1) b2 = Zero (times b1 b2)
times (One b1) b2 = ___
-- For the second case you may want to take advantage of plus