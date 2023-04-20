data BinInt = Zero BinInt | One BinInt

firstDigs :: Int -> BinInt -> [Int]
firstDigs 0 _ = []
firstDigs n (Zero b) = 0 : (firstDigs (n - 1) b)
firstDigs n (One b) = 1 : (firstDigs (n - 1) b)

showFirstDigs :: Int -> BinInt -> String
showFirstDigs 0 _ = "..."
showFirstDigs n (Zero b) = (showFirstDigs (n - 1) b) ++ "0"
showFirstDigs n (One b) = (showFirstDigs (n - 1) b) ++ "1"

-- Kinda like saying x = 2x
zero' :: BinInt
zero' = Zero zero'

one' :: BinInt
one' = One zero'

six' :: BinInt
six' = Zero (One (One zero'))

negone' :: BinInt
negone' = One negone'

instance Show BinInt where
  show = showFirstDigs 20

plusone :: BinInt -> BinInt
plusone (Zero b) = (One b)
plusone (One b) = Zero (plusone b)

minusone :: BinInt -> BinInt
minusone (Zero b) = One (minusone b)
minusone (One b) = Zero b

negone :: BinInt
negone = minusone zero'

natToBin :: Int -> BinInt
natToBin 0 = zero'
natToBin n = plusone (natToBin (n - 1))

plus :: BinInt -> BinInt -> BinInt
plus (Zero b1) (Zero b2) = Zero (plus b1 b2)
plus (Zero b1) (One b2) = One (plus b1 b2)
plus (One b1) (Zero b2) = One (plus b1 b2)
plus (One b1) (One b2) = Zero (plusone $ plus b1 b2)

times :: BinInt -> BinInt -> BinInt
times (Zero b1) b2 = Zero (times b1 b2)
times (One b1) b2 = plus b2 (Zero (times b1 b2))

negfive :: BinInt
negfive = plus (natToBin 5) (Zero negfive)

-- Notice that this is like saying "1/3 is the soln to x = -1 + 4x"
-- And why does it work?
-- Only because of laziness!
-- The first element of oneThird is determined as 1, so is the 2nd
-- To get the third element, it must recurse, but only once!
oneThird :: BinInt
oneThird = plus negone (Zero (Zero oneThird))

-- Behaves like negative one
wtf1 :: BinInt
wtf1 = One wtf1

-- Notice that we can subtract one from zero and get a valid number!
wtf1' :: BinInt
wtf1' = minusone zero'

wtf2 :: BinInt
wtf2 = One (Zero wtf2)

-- Exercise 1: find one-fifth
-- i.e. oneFifth such that times (natToBin 5) oneFifth gives one
-- We are using the definition "x = -1 + 6x"
oneFifth :: BinInt
oneFifth = plus negone' (times (natToBin 6) oneFifth)

-- Exercise 2: write "negative" function
-- Should satisfy plus x (negative x) = 0
negative :: BinInt -> BinInt
negative x = plus x (Zero (negative x))
