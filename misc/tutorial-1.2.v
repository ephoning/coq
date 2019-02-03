Require Import Utf8.

(* 1.2 Minimal Logic*)
Section Minimal_Logic.
Variables A B C : Prop.
Check (A → B).
Goal (A -> B -> C) -> (A -> B) -> A -> C.
intro H.
(* alternative for the 2 lines below: intros H' H''  *)
intro H'.
intro H''.
apply H.
exact H''.
apply H'.
assumption.
(* "proff completed". at this point, either Abort or Save: *)
Save my_trivial_lemma.

Print my_trivial_lemma.

(* alternative approach to the same proof *)
Lemma a_distr_impl : (A -> B -> C) -> (A -> B) -> A -> C.
intros.
apply H; [ assumption | apply H0; assumption ].
Save.

Print a_distr_impl.

(* alternative approach to the same proof using built-in tactic*)
Lemma b_distr_impl : (A -> B -> C) -> (A -> B) -> A -> C.
auto.
(* (skip Save for this last lemma) *)
(* show last 3 declarations *)
Inspect 3.
Inspect 10. (* show some more... *)