(*
	an attempt to define a limited Type equality check
*)
Require Import Utf8.

Require Import ZArith.


Definition isNat (t:Type) : Z :=
  match t with
      nat => 1%Z
    | _ => 0%Z
end.

Require Import Coq.Bool.Bool.

Variables T1 T2 : Type.

Variable eqT: Type → Type → Prop.
Axiom eqTRefl: ∀ T : Type, eqT T T.

Check eqT.
Check eqTRefl.
Eval compute in eqT nat nat.
Eval compute in eqTRefl nat.

Eval cbv delta in eqT nat nat.

Check false.
Check False.

Definition eqT := fun t1 t2 : Type =>
  match t1 t2 with
  (eqT t1 t2) => true |
  _ => false
 end.
