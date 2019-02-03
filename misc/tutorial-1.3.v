Require Import Utf8.

(* 1.3 Propositional Calculus *)

Variables A B C : Prop.
Lemma and_commutative : A /\ B → B /\ A.

(* either *)
(*
intro.
elim H.
split.
*)

(* or *)
intro H. elim H. auto.

Qed.

Print and_commutative.

Check conj.

Lemma or_commutative : A ∨ B → B ∨ A.

(* either 'by hand' *)
(*
intro H. elim  H.
intro HA.
clear H.   (* not critical, but removed 'clutter' *)
right.
trivial.
auto.
*)

(* or *)
tauto.

Qed.
Print or_commutative.


Lemma distr_and : A → B /\ C → (A → B) /\ (A → C).
tauto.
Qed.
Print distr_and.

(* 1.3.4 Classical reasoning *)

(* fails  / does not terminate *)
(*
Lemma Peirce : ((A → B) → A) → A.
try tauto.  
*)

Lemma NNPeirce : ~ ~ (((A → B) → A) → A).
tauto.
Qed.
Print NNPeirce.

Require Import Classical.
Check NNPP.

Lemma Peirce : ((A → B) → A) → A.
apply NNPP.
tauto.
Qed.
Print Peirce.

Section club.
Variables Scottish RedSocks WearKilt Married GoOutSunday : Prop.
Hypothesis rule1 : ¬ Scottish → RedSocks.
Hypothesis rule2 : WearKilt \/ ~ RedSocks.
Hypothesis rule3 : Married → ~ GoOutSunday.
Hypothesis rule4 : GoOutSunday ↔ Scottish.
Hypothesis rule5 : WearKilt → Scottish /\ Married.
Hypothesis rule6 : Scottish → WearKilt.
Lemma NoMember : False.
tauto.
Qed.
End club.
Check NoMember.
Print NoMember.

