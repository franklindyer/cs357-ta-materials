-- Exercise 1
bits2num _ = undefined

-- Exercise 2
num2bits _ = undefined

-- Exercise 3
variance _ = undefined

-- Exercise 4
difference _ _ = undefined

-- Exercise 5
splits _ = undefined

-- Exercise 6
argmin _ _ = undefined

-- Exercise 7
data Htree a = Leaf Double a | Fork Double [a] (Htree a) (Htree a) deriving (Show, Eq)

instance (Ord a) => Ord (Htree a) where
    (Leaf x _) < (Leaf y _) = x < y
    (Leaf x _) < (Fork y _ _ _) = x < y
    (Fork x _ _ _) < (Leaf y _) = x < y
    (Fork x _ _ _) < (Fork y _ _ _) = x < y
    (Leaf x _) <= (Leaf y _) = x <= y
    (Leaf x _) <= (Fork y _ _ _) = x <= y
    (Fork x _ _ _) <= (Leaf y _) = x <= y
    (Fork x _ _ _) <= (Fork y _ _ _) = x <= y

partition pred xs = loop xs ([],[])
    where loop [] acc = acc
          loop (x:xs) (pass,fail) =
              if pred x then loop xs (x:pass,fail) else loop xs (pass,x:fail)

quicksort [] = []
quicksort (t:ts) = (quicksort smaller) ++ [t] ++ (quicksort larger)
    where (smaller,larger) = partition (< t) ts

-- merge two Huffman coding trees
merge u@(Leaf x l) v@(Leaf y r) = Fork (x+y) [l,r] u v
merge u@(Leaf x l) v@(Fork y rs _ _) = Fork (x+y) (l:rs) u v
merge u@(Fork x ls _ _) v@(Leaf y r) = Fork (x+y) (r:ls) u v
merge u@(Fork x ls _ _) v@(Fork y rs _ _) = Fork (x+y) (ls ++ rs) u v

-- make Huffman coding tree
huffman xs = loop (quicksort xs)
    where loop [t] = t
          loop (t:t':ts) = loop (quicksort ((merge t t'):ts))

-- encode character using Huffman coding tree
encode (Fork _ _ (Leaf _ l) (Leaf _ r)) c = if c == l then "0" else "1"
encode (Fork _ _ (Leaf _ l) v@(Fork _ rs _ _)) c =
    if c == l then "0" else '1':(encode v c)
encode (Fork _ _ u@(Fork _ ls _ _) v@(Leaf _ r)) c =
    if c == r then "1" else '0':(encode u c)
encode (Fork _ _ u@(Fork _ ls _ _) v@(Fork _ rs _ _)) c =
    if c `elem` ls then '0':(encode u c) else '1':(encode v c)

-- decode message using Huffman coding tree
decode t [] = []
decode t (x:xs) = loop t (x:xs)
    where loop (Leaf _ l) xs = l:(decode t xs)
          loop (Fork _ _ u v) ('0':xs) = loop u xs
          loop (Fork _ _ u v) ('1':xs) = loop v xs

bogusListValue xs = foldl (\x y -> x + fst y) 0 xs

bogus _ = undefined

-- Exercise 8
church _ _ _ = undefined

-- Exercise 9
data BTree a = Leaf' a
  | Fork' (BTree a) (BTree a) deriving (Show, Eq)

trees _ = undefined

-- Exercise 10
insertions _ = undefined

deletions _ = undefined

substitutions _ = undefined

transpositions _ = undefined
