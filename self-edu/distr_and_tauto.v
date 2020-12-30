(* distributive prop of 'and' proof using tauto tactic example; EPH 05/20/07 *)
Require Import Utf8.
Variables  A B C: Prop.
Lemma distr_and:  A → B ∧ C → (A → B) ∧ (A → C).
tauto.
Qed.
Print distr_and.
