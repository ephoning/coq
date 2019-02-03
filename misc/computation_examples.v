(*
 some examples of how to perform computation
*)
Eval compute in (fun _:nat => 1 + 1).

Eval compute in 1 + 1.

(* this is not allowed:
1 + 1.
*)

Eval compute in (fun x y:nat => x * y) 6 7. 

(* *** curried *** *)
Definition times_c := (fun x y:nat => x * y) .
Eval compute in times_c 6 7.

Definition times42 := times_c 42.
Eval compute in times42 3. 


(* *** not curried *** *)

(* broken  / does NOT work *)
(* Definition times_nc := (fun (x:nat , y:nat) => x + y). *)

(* this DOES work *)
Definition times_nc := (fun (p:nat*nat) => (fst p) + (snd p)).
Eval compute in times_nc (2,3).

Definition asum := (1 + 1).
Eval compute in asum.
Type asum.
Print asum.
Type (1 + 1).

(* not well formed:
Print (1 + 1).
*)
