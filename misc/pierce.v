Require Import Utf8.
Section Pierce.
Variables P Q : Prop.

Check ((P → Q) → P) → P.
Check P → Q → P → P.
Check P → Q.
Check P → Q → P.
Theorem drop : P → Q → P.
intros.
assumption.
Qed.

Print drop .

Goal P -> P -> P.
intros.
apply H.
Qed.
Print Unnamed_thm.





Goal ((P → Q) → P) → P.
intros.
apply H.
intros.
apply Q.