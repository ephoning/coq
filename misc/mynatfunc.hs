module Mynatfunc where

import qualified Prelude

data Nat = O
         | S Nat

plus :: Nat -> Nat -> Nat
plus n m =
  case n of
    O -> m
    S p -> S (plus p m)

mynatfunc :: Nat -> Nat -> Nat
mynatfunc x y =
  plus x y

