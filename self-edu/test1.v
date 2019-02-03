(* fully spelled out proof example; EPH 05/20/07 *)
Variables  A B : Prop.
Lemma and_commutative:  A /\ B -> B /\ A.
intro H.
elim H.
intro HA.
intro HB.
apply conj.
apply HB.
apply HA.
Qed.


