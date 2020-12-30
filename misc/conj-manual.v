(* fully spelled out conjunction proof example; EPH 05/20/07 *)
Require Import utf8.
Variables  A B : Prop.
Lemma and_commutative:  A /\ B → B /\ A.
intro H.
elim H.
intro HA.
intro HB.
apply conj. (* split *)
apply HB.
apply HA.
Qed.
Print and_commutative.
