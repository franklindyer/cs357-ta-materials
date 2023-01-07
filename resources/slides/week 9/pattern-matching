fact x = if x == 0 then 1 else x*fact(x-1)

fib x = if (x < 2) then x else fib(x-1) + fib(x-2)

loop x acc0 acc1 = if x == 0 then acc0 else loop (x-1) acc1 (acc0+acc1)

fib' x = loop x 0 1

length xs = if null xs then 0 else 1 + length (tail xs)

append xs ys = if null xs then ys else (head xs):(append (tail xs) ys)

delete item xs = if null xs then [] else if (head xs) == item then delete item (tail xs) else (head xs):(delete item (tail xs))

member item xs = if (null xs) then False else ((head xs) == item) || (member item (tail xs))

evens xs = if null xs then [] else (head xs):(odds (tail xs))

odds xs = if null xs then [] else evens (tail xs)

merge xs ys = if null xs then ys else if null ys then xs else if (head xs) < (head ys) then (head ys):(merge xs (tail ys)) else (head xs):(merge (tail xs) ys)

mergesort xs = if null xs then [] else if null (tail xs) then xs else merge (mergesort (evens xs)) (mergesort (odds xs))

-- list functions rewritten using pattern matching

length [] = 0
length (x:xs) = 1 + (length xs)

append [] ys = ys
append (x:xs) ys = x:(append xs ys)

-- infix append
[] ++ ys = ys
(x:xs) ++ ys = x:(xs ++ ys)

delete _ [] = []
delete item (x:xs) = 
    if (x == item) then delete item xs else x:(delete item xs)

elem item [] = False
elem item (x:xs) = (x == item) || (elem item xs)

evens [] = []
evens (x:xs) = x:(odds xs)

odds [] = []
odds (_:xs) = evens xs

merge [] ys = ys
merge xs [] = xs
merge u@(x:xs) v@(y:ys) = if x < y then x:(merge xs v) else y:(merge u ys)

mergesort [] = []
mergesort [x] = [x]
mergesort xs = merge (mergesort (evens xs)) (mergesort (odds xs))