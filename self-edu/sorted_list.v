Require Import List  ZArith RelationClasses Morphisms
               Extraction.
Open Scope Z_scope.

Inductive sorted: list Z  -> Prop :=
  | sorted0 : sorted(nil)
  | sorted1 : forall z : Z, sorted(z :: nil)
  | sorted2 : forall (z1 z2 : Z) (l : list Z),  z1 <= z2 -> sorted(z2 :: l) -> sorted (z1 :: z2 :: l).

Goal sorted (1 :: 2 :: nil).
Proof.
  apply sorted2.
  apply Z.le.
