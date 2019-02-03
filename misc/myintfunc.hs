module Myintfunc where

-- import qualified Prelude


data Comparison = Eq
                  | Lt
                  | Gt
  deriving Show

data Positive = XI Positive
                | XO Positive
                | XH
  deriving Show

psucc :: Positive -> Positive
psucc x =
  case x of
    XI x' -> XO (psucc x')
    XO x' -> XI x'
    XH -> XO XH

pplus :: Positive -> Positive -> Positive
pplus x y =
  case x of
    XI x' ->
      (case y of
         XI y' -> XO (pplus_carry x' y')
         XO y' -> XI (pplus x' y')
         XH -> XO (psucc x'))
    XO x' ->
      (case y of
         XI y' -> XI (pplus x' y')
         XO y' -> XO (pplus x' y')
         XH -> XI x')
    XH -> (case y of
             XI y' -> XO (psucc y')
             XO y' -> XI y'
             XH -> XO XH)

pplus_carry :: Positive -> Positive -> Positive
pplus_carry x y =
  case x of
    XI x' ->
      (case y of
         XI y' -> XI (pplus_carry x' y')
         XO y' -> XO (pplus_carry x' y')
         XH -> XI (psucc x'))
    XO x' ->
      (case y of
         XI y' -> XO (pplus_carry x' y')
         XO y' -> XI (pplus x' y')
         XH -> XO (psucc x'))
    XH ->
      (case y of
         XI y' -> XI (psucc y')
         XO y' -> XO (psucc y')
         XH -> XI XH)

pdouble_minus_one :: Positive -> Positive
pdouble_minus_one x =
  case x of
    XI x' -> XI (XO x')
    XO x' -> XI (pdouble_minus_one x')
    XH -> XH

data Positive_mask = IsNul
                     | IsPos Positive
                     | IsNeg

pdouble_plus_one_mask :: Positive_mask -> Positive_mask
pdouble_plus_one_mask x =
  case x of
    IsNul -> IsPos XH
    IsPos p -> IsPos (XI p)
    IsNeg -> IsNeg

pdouble_mask :: Positive_mask -> Positive_mask
pdouble_mask x =
  case x of
    IsNul -> IsNul
    IsPos p -> IsPos (XO p)
    IsNeg -> IsNeg

pdouble_minus_two :: Positive -> Positive_mask
pdouble_minus_two x =
  case x of
    XI x' -> IsPos (XO (XO x'))
    XO x' -> IsPos (XO (pdouble_minus_one x'))
    XH -> IsNul

pminus_mask :: Positive -> Positive -> Positive_mask
pminus_mask x y =
  case x of
    XI x' ->
      (case y of
         XI y' -> pdouble_mask (pminus_mask x' y')
         XO y' -> pdouble_plus_one_mask (pminus_mask x' y')
         XH -> IsPos (XO x'))
    XO x' ->
      (case y of
         XI y' -> pdouble_plus_one_mask (pminus_mask_carry x' y')
         XO y' -> pdouble_mask (pminus_mask x' y')
         XH -> IsPos (pdouble_minus_one x'))
    XH -> (case y of
             XI p -> IsNeg
             XO p -> IsNeg
             XH -> IsNul)

pminus_mask_carry :: Positive -> Positive -> Positive_mask
pminus_mask_carry x y =
  case x of
    XI x' ->
      (case y of
         XI y' -> pdouble_plus_one_mask (pminus_mask_carry x' y')
         XO y' -> pdouble_mask (pminus_mask x' y')
         XH -> IsPos (pdouble_minus_one x'))
    XO x' ->
      (case y of
         XI y' -> pdouble_mask (pminus_mask_carry x' y')
         XO y' -> pdouble_plus_one_mask (pminus_mask_carry x' y')
         XH -> pdouble_minus_two x')
    XH -> IsNeg

pminus :: Positive -> Positive -> Positive
pminus x y =
  case pminus_mask x y of
    IsNul -> XH
    IsPos z -> z
    IsNeg -> XH

pcompare :: Positive -> Positive -> Comparison -> Comparison
pcompare x y r =
  case x of
    XI x' ->
      (case y of
         XI y' -> pcompare x' y' r
         XO y' -> pcompare x' y' Gt
         XH -> Gt)
    XO x' ->
      (case y of
         XI y' -> pcompare x' y' Lt
         XO y' -> pcompare x' y' r
         XH -> Gt)
    XH -> (case y of
             XI y' -> Lt
             XO y' -> Lt
             XH -> r)

data Z = Z0
         | Zpos Positive
         | Zneg Positive
  deriving Show

zplus :: Z -> Z -> Z
zplus x y =
  case x of
    Z0 -> y
    Zpos x' ->
      (case y of
         Z0 -> Zpos x'
         Zpos y' -> Zpos (pplus x' y')
         Zneg y' ->
           (case pcompare x' y' Eq of
              Eq -> Z0
              Lt -> Zneg (pminus y' x')
              Gt -> Zpos (pminus x' y')))
    Zneg x' ->
      (case y of
         Z0 -> Zneg x'
         Zpos y' ->
           (case pcompare x' y' Eq of
              Eq -> Z0
              Lt -> Zpos (pminus y' x')
              Gt -> Zneg (pminus x' y'))
         Zneg y' -> Zneg (pplus x' y'))

myintfunc :: Z -> Z -> Z
myintfunc x y =
  zplus x y

