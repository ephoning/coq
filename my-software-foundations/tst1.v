Inductive day : Type :=
| monday : day
| tuesday : day
| wednesday : day
| thursday : day
| friday : day
| saturday : day
| sunday : day .

Definition next_weekday (d: day) : day :=
  match d with
  | monday => tuesday
  | tuesday => wednesday
  | wednesday => thursday
  | thursday => friday
  | friday => saturday
  | saturday => sunday
  | sunday => monday
  end .


Section eph.

 (* Polymorphic list:

Inductive list (X: Type) : Type :=
| nil : list X
| cons : X -> list X -> list X.

Check nil nat : list nat.
 *)

 Inductive list : Type :=
| nil : list
| cons : nat -> list -> list.

Check (cons 1 (cons 2 nil)).

Notation "[ x ; .. ; y ]" := (cons x .. (cons y nil) ..).

Theorem silly1 : forall (n m o p :nat),
    n = m ->
    (forall (q r: nat), q = r -> [q;o] = [r;p]) -> [n;o] = [m;p].
Proof.
  intros n m o p eq1 eq2.
  apply eq2.
  apply eq1. (* or: assumption *)
Qed.

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

(* use 'symmetry' to swap: a = b to b = a ; this to allow for proper matching when needed: *)

Theorem silly3_firsttry : forall (n : nat),
     true = beq_nat n 5 ->
     beq_nat (S (S n)) 7 = true.
Proof.
  intros n H.
  symmetry.
  rewrite H.
  simpl.
  reflexivity.
Qed.

(* The 'apply with' tactic *)

Example trans_eq_example : forall (a b c d e f : nat),
    [a;b] = [c;d] ->
    [c;d] = [e;f] ->
    [a;b] = [e;f].
Proof.
  intros a b c d e f eq1 eq2.
  rewrite -> eq1.
  rewrite -> eq2.
  reflexivity.
Qed.

(* make 'transitivity into a lemma once and for all *)
Theorem tran_eq : forall (X: Type) (n m o : X),
    n = m -> m = o -> n = o.
Proof.
  intros X n m o eq1 eq2.
  rewrite -> eq1.
  rewrite eq2.
  reflexivity.
Qed.


Example trans_eq_example' : forall (a b c d e f : nat),
    [a;b] = [c;d] ->
    [c;d] = [e;f] ->
    [a;b] = [e;f].
Proof.
  intros a b c d e f eq1 eq2.
  apply eq1 with .    (* <--- continue here *)

