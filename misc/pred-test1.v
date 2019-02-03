Require Import Utf8.
Section Pred_calc.
Variable D : Set.
Variable R : D → D → Prop.
Section R_sym_trans.
Hypothesis R_symmetric : ∀ x y : D, R x y → R y x.
Hypothesis R_transitive : ∀ x y z:D, R x y → R y z → R x z.
Lemma refl_if : ∀ x:D, (∃ y, R x y) → R x x.
intro x.
intro x_Rlinked.
elim x_Rlinked.
intro y.
intro Rxy.
apply R_transitive with y.
assumption.
apply R_symmetric.
assumption.
Qed.
End R_sym_trans.
