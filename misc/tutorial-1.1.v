(* examples of syntax usage - from Tutorial.pdf *)

(* 1.1.1 Declarations *)
Check 0.
Check 1+0.
Check O.
Check nat.
Check Set.
Check Type.
Section Declaration.
Variable n : nat.
Hypothesis pos_n : (gt n 0).
Check gt.
Check (nat -> Prop).
Check gt n 0.
Check plus.
Check S.

(* 1.1.2 Definitions *)
Definition one := S O.
Definition two := S one.
Definition three := S (S (S O)).
Check three.
Definition double (n:nat) := plus n n.
Definition add_n (m:nat) := plus n m.
Check (forall m:nat, gt m 0).
(* Reset Declaration.    <-- fails, check this! *)

