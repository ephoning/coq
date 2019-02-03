Section Minimal_Logic.
Variables A B C : Prop.
Check (A -> B).
Goal (A -> B-> C) -> (A ->B) -> A -> C.
intro H.
intros H' HA.
apply H.
exact HA.
apply H'.
assumption.
Save trivial_lemma.
Print trivial_lemma.