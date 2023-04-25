-- data Nat = Zero | Succ Nat

data BinInt = Zero BinInt | One BinInt

-- 6     110
-- Zero (One (One Empty))

zero :: BinInt
zero = Zero zero

showFirstDigs :: Int -> BinInt -> String
showFirstDigs 0 _ = "..."
showFirstDigs n (Zero b) = (showFirstDigs (n - 1) b) ++ "0"
showFirstDigs n (One b) = (showFirstDigs (n - 1) b) ++ "1"

instance Show BinInt where
  show b = showFirstDigs 20 b

plusone :: BinInt -> BinInt
plusone (Zero b) = One b
plusone (One b) = Zero (plusone b)

natToBin :: Int -> BinInt
natToBin 0 = zero
natToBin n = plusone (natToBin (n - 1))

plus :: BinInt -> BinInt -> BinInt
plus (Zero b1) (Zero b2) = Zero (plus b1 b2) 
plus (Zero b1) (One b2) = One (plus b1 b2)
plus (One b1) (Zero b2) = One (plus b1 b2)
plus (One b1) (One b2) = Zero (plusone (plus b1 b2))

negone :: BinInt
negone = One negone

negOneThird :: BinInt
negOneThird = One (Zero negOneThird)