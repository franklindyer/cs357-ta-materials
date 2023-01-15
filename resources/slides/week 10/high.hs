dot [] [] = 0
dot (x:xs) (y:ys) = x*y + (dot xs ys)

zip' [] [] = []
zip' (x:xs) (y:ys) = (x,y):(zip' xs ys)

dot' xs ys = sum $ map (uncurry (*)) (zip' xs ys)

filter' _ [] = []
filter' pred (x:xs) = if (pred x) then x:(filter' pred xs) else (filter' pred xs)

delete x xs = filter (/= x) xs

nub' [] = []
nub' (x:xs) = x:(nub' (delete x xs))

-- (f 1 (f 2 (f 3 ... (f n seed))))
foldr' _ seed [] = seed
foldr' f seed (x:xs) = f x (foldr' f seed xs)

sum' = foldr (+) 0

length' = foldr (\x y -> (y+1)) 0

filter'' pred xs = foldr (\x y -> if (pred x) then x:y else y) [] xs

append xs ys = foldr (:) ys xs

map' proc xs = foldr (\x y -> (proc x):y) [] xs

nub'' xs = foldr (\x y -> x:(delete x y)) [] xs
 
concat' = foldr (++) []

church' f n = foldr (\x y -> (f . y)) id [1..n]

-- (f (f (f (f (f acc 1) 2) 3) 4) ... n)
foldl' _ acc [] = acc
foldl' f acc (x:xs) = foldl' f (f acc x) xs

reverse' [] = []
reverse' (x:xs) = (reverse' xs) ++ [x]

reverse'' [] acc = acc
reverse'' (x:xs) acc = reverse'' xs (x:acc)

reverse''' = foldl' (flip (:)) []

append' xs ys = foldl' (flip (:)) ys $ (foldl' (flip (:)) []) xs

outerProduct f xs ys = map (\x -> map (\y -> f x y) ys) xs

identity n = outerProduct kronecker [1..n] [1..n]
    where kronecker = \x y -> if x == y then 1 else 0

select _ [] [] = []
select pred (x:xs) (y:ys) = if (pred x) then y:rest else rest where rest = select pred xs ys

primes n = select (== 2) (map length (map (filter (== 0)) (outerProduct rem [1..n] [1..n]))) [1..n]