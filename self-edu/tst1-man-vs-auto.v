(* by hand *)
Require Import Utf8.
Variables A B C : Prop.
Goal A → (A → B) → B.
intro H.
intro H'.
apply H'.
apply H.
Show Proof.
(* Show Tree. *)
Qed.

Theorem e1: ∀ A B : Prop,  A → (A → B) → B.
auto.  (* <- works *)
(* intuition. <- works too *)
Show Proof. 
(*
    results in: fun (A0 B0 : Prop) (H : A0) (H0 : A0 -> B0) => H0 H
    notice the similarities with the manual proof:
    A0 <-> A
    B0  <-> B
    H   <-> H
    H0 <-> H'
    '=> H0 H' <-> apply H'. apply H.
*)
(*Show Tree.*)
Qed.

Inspect 2.
