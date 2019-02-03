Require Import Utf8.
(* Utf8 is required for uicode characters used below; such as ∀, ∃, etc. *)


Check True \/ False.

Check True ∨ False.
Check True ∧ False.

Check (3,3=5): nat * Prop.

Check (fun x:nat => x = 3).

Check (∀ x:nat, x < 3 ∨ (∃ y:nat, x = y + 3)).

Check (let f := fun x => (x * 3,x) in f 3).

Locate "_ <= _".

Check and.

Eval compute in let f := fun x => (x * 3, x) in f 3.

Definition example1 := fun x : nat => x*x+2*x+1.
Definition example2 (x : nat) := x*x+2*x+1.

Eval compute in example1 42.



Inductive list : Set :=
  | nil : list
  | cons : nat -> list -> list.


Fixpoint append (ls1 ls2 : list) {struct ls1} : list :=
  match ls1 with
    | nil => ls2
    | cons x ls1' => cons x (append ls1' ls2)
  end.


induction ls1;
simpl; intros.

 trivial.