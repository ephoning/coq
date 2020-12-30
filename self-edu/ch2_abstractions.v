(* see chapter 2 Coq book
    just some experiments to see how much bracketing is needed and
   what some of the acceptable notations are like
*)
Require Import Utf8.

Require Import ZArith.

Check fun n:nat => (n*n)%nat.

Check fun n p:nat => fun z:Z => (Z_of_nat (n+p) + z)%Z.
Check fun n:nat => fun p:nat=> fun z:Z => (Z_of_nat (n+p) + z)%Z.
Check fun (n:nat) (z:Z) => (Z_of_nat n + z)%Z.

Check fun (f g:nat → nat) (n:nat) => f (g n).

(* anonymous variable *)
Check fun _:Z => 3%Z.

Check 3 = 3.

Check (Z->Z->Z).

(* does not work nested
Check (Check Set).
*)
