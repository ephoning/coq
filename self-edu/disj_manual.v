(* fully spelled out disjunction proof example; EPH 05/20/07 *)
Require Import Utf8.
Variables  A B : Prop.
Lemma or_commutative:  A ∨ B → B ∨ A.
intro H.
elim H.
intro HA.
clear H. (* no longer needed; 'clear' reduces screen clutter *)
apply or_intror. (* right. *)
apply HA.
intro HB.
clear H. (* no longer needed; 'clear' reduces screen clutter *)
apply or_introl. (* left. *)
apply HB.
Qed.

Print or_commutative.
