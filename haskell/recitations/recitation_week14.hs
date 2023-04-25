-- @Jose: Review Num using
-- :i Num

-- @Jose: Review Functor using
-- :i Functor

class Funct f g where
  fgMap :: (a -> g b) -> f a -> g b

instance (Funct [] Maybe) where
  fgMap f [] = Nothing
  fgMap f (x : _) = f x

data BinTree a =
  Empty
  | Leaf a
  | Fork (BinTree a) (BinTree a)
  deriving Show

instance (Funct [] BinTree) where
  fgMap _ [] = Empty
  fgMap f (x : xs) = Fork (f x) (fgMap f xs)

-- Recitation activity 
-- Provide an instance for (Funct BinTree [])
-- such that
-- For every xs :: [a],
-- (fgMap (\x -> x : []) $ fgMap Leaf xs) == xs
instance (Funct BinTree []) where
  fgMap _ _ = undefined
