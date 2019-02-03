(*
   associativity and commutativity of addition
 *)


Lemma add_0: forall n :nat,
    n + O = n.
Proof.
  intros.
  induction n.
  - simpl. reflexivity.
  - simpl. rewrite -> IHn. reflexivity.
Qed.

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

