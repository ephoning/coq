(* scratch proofs *)
Variables  A B : Prop.

Require Import Classical.
Check NNPP.
Lemma Pierce : ((A->B) -> A) -> A.
apply NNPP.
try tauto.
Qed.

(* in constructive logic, there is no excluded middle axiom... => use double negation *)
Lemma NNPierce : ~ ~ (((A->B)->A)->A).
try tauto.
Qed.
