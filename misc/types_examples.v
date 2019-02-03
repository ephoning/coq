Require Utf8.

Require Import Coq.Bool.Bool.

Variables P S : Prop.

Type (P -> S).

(* type hierarchy example *)
Type (fun _:nat => 42).
Type (nat -> nat).
Type Set.
Type Type.


Require Import ZArith.
Print ZArith.
Definition zid := fun x:Z => x.
Type zid.
Eval compute in zid 3.
Eval compute in zid 3%Z.

(* tuple types and some functions defined on tuples
*)
Print fst.
Eval compute in fst (1,2).
Eval compute in snd (3,4).
(*
 Definition swap (p: nat*nat)  := (snd p, fst p).
*)

Definition v := (42,67).
Check v.

(* defined in this way, we can skip passing in type parameter values *)
Set Implicit Arguments.
Definition swap_imp := fun (A B : Set) (p : A * B) => (snd p, fst p).
Unset Implicit Arguments.
Eval compute in swap_imp v.
Print swap_imp.
Check swap_imp.

(* defined in this way, we have to pass type parameters *)
Definition swap := fun (A B : Set) (p : A * B) => (snd p, fst p).
Eval compute in swap nat nat v.
Print swap.
Check swap.

Variables A B : Type.
Variable x : A * B.
Check x.
Print x.

(* investigate tuple on Type level; e.g. can we introspect Types themselves
   in functions? *)

Check (nat,nat).

Check prod.
Print prod.
Check prod nat nat.

Check pair.
Print pair.

(* attempt at extracting info from a tuple type: its "length" *)
Check fst.


Definition ppp (p:Type) : Z := 0%Z.
Eval compute in ppp nat.
Eval compute in ppp (prod nat nat).
(* error: 'pair 42 24' is NOT a  Type: Eval compute in ppp (pair 42 24). *)
 
(* Type introspection *)
Eval compute in nat = nat.
Eval compute in 1%Z = 1%Z.

Eval compute in nat = (prod nat nat).

Check 1 = 1.
Eval compute in 1=1 .

Check eq.
(* example use of conditional statement *)
(* simple - boolean val *)
(* Eval compute in if false then 1%Z else 0%Z. *)
(* simple - Z instance equality *)

Check true.
Check bool.
Check nat = nat.
Check eq.
Check Prop.

Check eqb.


Definition eqPair 

Eval compute in if (eq nat nat)  then true else false.

(*
Definition my_eq (a b: Type) : bool :=
   if a = b then true else false.
*)

Check (pair (A:Type) (B:Type)).
Check (prod (A:Type) (B:Type)).
Check pair.
Check prod.

Set Implicit Arguments.
Fixpoint tuple_len (A B: Type) (p :prod A B) : Z :=
    match p with
      pair X Y => 2%Z
(*      (pair (pair X Y) Z) => 1 + tuple_len (pair X Y) |
      (pair X (pair Y Z)) => 1 + tuple_len (pair Y Z) |
      (pair X Y) => 2%Z *)
    end.
Unset Implicit Arguments.
Check pair.
Eval compute in tuple_len (pair nat nat).
Eval compute in tuple_len (pair nat (pair nat nat)).
Eval compute in tuple_len (pair (pair nat nat) Z).
