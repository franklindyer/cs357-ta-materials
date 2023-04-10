-- Exercise 1
-- myTakeWhile (/= ' ') "This is practice." => "This"
myTakeWhile :: (a -> Bool) -> [a] -> [a]
myTakeWhile _ _ = undefined

-- Exercise 2
-- mySpan (/= ' ') "This is practice." => ("This"," is practice.")
mySpan :: (a -> Bool) -> [a] -> ([a], [a])
mySpan _ _ = undefined

-- Exercise 3
-- combinations3 "ABCDE" => ["ABC","ABD","ABE","ACD","ACE","ADE","BCD","BCE","BDE","CDE"] 
combinations3 :: (Ord a) => [a] -> [[a]]
combinations3 _ = undefined

-- Exercise 4
-- runLengthEncode [4, 2, 2, 1, 1, 1, 1, 4, 4, 4, 4] => [(4,1),(2,2),(1,4),(4,4)]
-- runLengthEncode "foo" => [('f',1),('o',2)]
runLengthEncode :: Eq a => [a] -> [(a, Int)]
runLengthEncode _ = undefined

-- Exercise 5
-- runLengthDecode [(4, 1), (2, 2), (1, 4), (4, 4)] => [4,2,2,1,1,1,1,4,4,4,4]
runLengthDecode :: [(a, Int)] -> [a]
runLengthDecode _ = undefined

-- Exercise 6
-- splitText (/= ' ') "This is practice." => ["This","is","practice."]
splitText :: (Char -> Bool) -> [Char] -> [[Char]]
splitText _ _ = undefined

-- Exercise 7
-- encipher ['A' .. 'Z'] ['a' .. 'z'] "THIS" => "this"
encipher :: Eq a => [a] -> [a] -> [a] -> [a]
encipher _ _ _ = undefined

-- Exercise 8
-- goldbach 6 => [(3,3)]
goldbach :: Int -> [(Int, Int)]
goldbach _ = undefined
  
-- Exercise 9
-- increasing "ABBD" => False
-- increasing [100, 99 .. 1] => False
increasing :: Ord a => [a] -> Bool
increasing _ = undefined

-- Exercise 10
-- select even [1 .. 26] ['a' .. 'z'] => "bdfhjlnprtvxz"
-- select (<= 'g') ['a' .. 'z'] [1 .. 26]  => [1,2,3,4,5,6,7]
select :: (t -> Bool) -> [t] -> [a] -> [a]
select _ _ _ = undefined

-- Exercise 11
-- combinations 3 "ABCDE" => ["ABC","ABD","ABE","ACD","ACE","ADE","BCD","BCE","BDE","CDE"]
combinations :: Ord a => Int -> [a] -> [[a]]
combinations _ _ = _
  
-- Exercise 12
-- real (ComplexInteger 1 2) => 1
-- imaginary (ComplexInteger 2 3) => 3
-- (ComplexInteger 1 2) == (ComplexInteger 3 4) => False
-- (ComplexInteger 1 2) => 1+2i
-- (ComplexInteger 1 2) * (ComplexInteger 3 4) => -5+10i

data ComplexInteger = ComplexInteger Integer Integer

instance Eq ComplexInteger where
  _ == _ = undefined

instance Show ComplexInteger where
  show _ = undefined

instance Num ComplexInteger where
  _ + _ = undefined
  _ * _ = undefined
  abs _ = undefined
  signum _ = undefined
  fromInteger _ = undefined
  negate _ = undefined

real :: ComplexInteger -> Integer
real _ = undefined

imaginary :: ComplexInteger -> Integer
imaginary _ = undefined
