import Data.List

studentName = ["Last", "First"]
netID = "netID@unm.edu"


-- Problem 1, bits2num
bits2num :: Num a => [Char] -> a
bits2num = undefined

p1tests = [bits2num "1011000" == 88]


-- Problem 2, num2bits
num2bits :: Integral a => a -> [Char]
num2bits = undefined

p2tests = [num2bits 87783 == "010101011011100111"]


-- Problem 3, variance
variance :: (Num a, Fractional a) => [a] -> a
variance = undefined

p3tests = [variance [1..10] == 8.25]


-- Problem 4, difference
difference :: Eq a => [a] -> [a] -> [a]
difference = undefined

p4tests = [difference "ABCD" "AD" == "BC",difference "ABCDCBA" "AD" == "BC"]


-- Problem 5, splits
splits ::  Ord a => [a] -> [([a], [a])]
splits = undefined

p5tests = [sort (splits "abc") == sort [("c","ab"),("b","ac"),("bc","a"),("a","bc"),("ac","b"),("ab","c")]]


-- Problem 6, argmin
argmin ::  (Ord a) => (t -> a) -> [t] -> t
argmin = undefined

p6tests = [argmin length ["ABC","EF","GHIJ","K"] == "K"]


data Htree a = HLeaf Double a | HFork Double [a] (Htree a) (Htree a) deriving (Show, Eq)
-- Problem 7, bogus

instance (Ord a) => Ord (Htree a) where
    (HLeaf x _) < (HLeaf y _) = x < y
    (HLeaf x _) < (HFork y _ _ _) = x < y
    (HFork x _ _ _) < (HLeaf y _) = x < y
    (HFork x _ _ _) < (HFork y _ _ _) = x < y
    (HLeaf x _) <= (HLeaf y _) = x <= y
    (HLeaf x _) <= (HFork y _ _ _) = x <= y
    (HFork x _ _ _) <= (HLeaf y _) = x <= y
    (HFork x _ _ _) <= (HFork y _ _ _) = x <= y

-- encode character using Huffman coding tree
encode (HFork _ _ (HLeaf _ l) (HLeaf _ r)) c = if c == l then "0" else "1"
encode (HFork _ _ (HLeaf _ l) v@(HFork _ rs _ _)) c =
    if c == l then "0" else '1':(encode v c)
encode (HFork _ _ u@(HFork _ ls _ _) v@(HLeaf _ r)) c =
    if c == r then "1" else '0':(encode u c)
encode (HFork _ _ u@(HFork _ ls _ _) v@(HFork _ rs _ _)) c =
    if c `elem` ls then '0':(encode u c) else '1':(encode v c)

-- decode message using Huffman coding tree
decode t [] = []
decode t (x:xs) = loop t (x:xs)
    where loop (HLeaf _ l) xs = l:(decode t xs)
          loop (HFork _ _ u v) ('0':xs) = loop u xs
          loop (HFork _ _ u v) ('1':xs) = loop v xs


bogus :: Ord a => [(Double, a)] -> Htree a
bogus = undefined

p7tests = let xs = [(0.30,'e'), (0.14,'h'), (0.1,'l'), (0.16,'o'), (0.05,'p'), (0.23,'t'), (0.02,'w')] in 
                [(decode (bogus xs) $ concatMap (encode (bogus xs)) "hello") == "hello", 
                 concatMap (encode (bogus xs)) "hello" /= concatMap (encode (bogus xs)) "oellh"]


-- Problem 8, church
church :: Int -> (a -> a) -> a -> a
church = undefined

p8tests = [church 4 tail "ABCDEFGH" == "EFGH", church 100 id 9001 == 9001]


data Btree a = BLeaf a | BFork (Btree a) (Btree a) deriving (Show, Eq, Ord)
-- Problem 9, trees

trees :: (Ord t) => [t] -> [Btree t]
trees = undefined

p9tests = [(sort $ trees "ABCDE") !! 114 == BFork (BLeaf 'A') (BFork (BFork (BFork (BLeaf 'E') (BLeaf 'B')) (BLeaf 'C')) (BLeaf 'D')),
           length (trees [0..4]) == 1680]


bases = "AGCT"
-- Problem 10, insertions
insertions :: String -> [String]
insertions = undefined

p10tests = [insertions "GC" == ["AGC","GAC","GCA","GGC","GGC","GCG","CGC","GCC","GCC","TGC","GTC","GCT"]]


-- Problem 11, deletions
deletions :: [a] -> [[a]]
deletions = undefined

p11tests = [deletions "AGCT" == ["GCT","ACT","AGT","AGC"]]


-- Problem 12, substitutions
substitutions :: String -> [String]
substitutions = undefined

p12tests = [substitutions "ACT" == ["ACT","AAT","ACA","GCT","AGT","ACG","CCT","ACT","ACC","TCT","ATT","ACT"]]


-- Problem 13, transpositions
transpositions :: [a] -> [[a]]
transpositions = undefined

p13tests = [transpositions "GATC" == ["AGTC","GTAC","GACT"]]



tests = [p1tests,p2tests,p3tests,p4tests,p5tests,p6tests,p7tests,p8tests,p9tests,p10tests,p11tests,p12tests,p13tests]
likelyCorrect = let results = [and t | t <- tests] in (and results, filter (not.snd) $ zip [1..] results)