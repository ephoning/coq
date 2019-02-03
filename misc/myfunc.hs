module Myfunc where

-- import qualified Prelude

data Nat = O 
         | S Nat
  deriving Show

plus :: Nat -> Nat -> Nat
plus n m =
  case n of
    O -> m
    S p -> S (plus p m)

myfunc :: Nat -> Nat -> Nat
myfunc x y =
  plus x y

