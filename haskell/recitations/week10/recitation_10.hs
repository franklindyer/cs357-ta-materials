-- Emacs workflow

-- Do you want to print something? Noooo
-- Use ghci and interact with
-- your code instead :D

-- Definition of append using
-- pattern matching












append2 [] ys = ys
append2 (x : xs) ys = x : (x : (append2 xs ys))

-- You can do programming without
-- pattern matching, it's optional!
append3 xs ys =
  if (null xs) then
    ys
  else
    (head xs) : (append2 (tail xs) ys)

-- Elaborate on null, head and tail

-- Indentation is really important!

-- Order of patterns matter
ok 0 = 0
ok n = ok (n - 1)

notOk n = notOk (n - 1)
notOk 0 = 0

-- Still you want to print "something" to screen?
-- Ok here's how we do it ...
main = do
  putStrLn "something"
  return ()

-- Discuss format for homework submission

-- Activity
-- Write a function named 'myreverse'
-- that reverses a list. This should
-- have the following signature
-- myreverse :: [a] -> [a]

mylength :: [a] -> Integer
mylength [] = 0
mylength (_ : xs) = 1 + mylength xs
