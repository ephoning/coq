Fixpoint beq_nat (n m : nat) : bool :=
  match n with
  | O => match m with
         | O => true
         | S m' => false
         end
  | S n' => match m with
            | O => false
            | S m' => beq_nat n' m'
            end
  end.

(*
  Using destruct is sufficient here...

  differentiating properties(?):
  - function 'beq_nat' is using 'match'
    => use case analysis => use 'destruct' ?
  - beq_nat is recursive
  - nat = bool
*)

Theorem plus_1_neq_0 : forall n : nat,
  beq_nat (n + 1) 0 = false.
Proof.
  intro n. destruct n as [| n'].  (* creates 2 subgoals *)
  - simpl.
    reflexivity.
  - simpl.
    reflexivity.
Qed.

(* Try using induction instead *)

Theorem plus_1_neq_0' : forall n : nat,
  beq_nat (n + 1) 0 = false.
Proof.
  intro n. induction n. (* creates the same 2 subgoals as with 'destruct'
                           but the induction hypothesis can not be used
                         *)
  - simpl. reflexivity.
  - (* induction hyp. at this point:   IHn : beq_nat (n + 1) 0 = false *)

(* ==================================================================================== *)

Fixpoint add (n m: nat) : nat :=
  match n with
  | O => m
  | S p => S (add p m)
  end.

(* attempt using destruct' - similar to proving plus_1_neq_0 *)
Lemma add_0': forall n: nat,
    add n O = n.
Proof.
  intro n.
  destruct n.
  - simpl. reflexivity.
  - simpl.
    (* at this point, to prove: 'S (add n 0) = S n' => no progress => stuck / abort, so abort *)
Abort.

(*
  HAVE to us induction to get anywhere...

  differentiating properties(?):
  - add is defined using 'match'
  - add is  recursive
  - nat = nat
  - 
 *)

(* CORRECT: *)
Lemma add_0: forall n :nat,
    add n O = n.
Proof.
  intro n.
  induction n.
  - simpl. reflexivity.
  - simpl. rewrite -> IHn. reflexivity.
Qed.


(*
===================================================
associativity and commutativity of addition v
*)

Theorem add_comm : forall n m : nat,
    n + m = m + n.
Proof.
  intros.
  induction n.
  - simpl.

Theorem add_assoc : forall n m o : nat,
    (n + m) + o = n + (m + o).
Proof.
  intros.
  destruct n.
  - simpl.
    reflexivity.
  - destruct m.
    + simpl.
      rewrite -> plus.
Lemma add_0 : forall n : nat ,
    0 + n = n.
Proof.
  intros.
  destruct n.
  -
    Abort.
