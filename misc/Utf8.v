(* -*- coding:utf-8 -*- *)
(************************************************************************)
(*  v      *   The Coq Proof Assistant  /  The Coq Development Team     *)
(* <O___,, *   INRIA - CNRS - LIX - LRI - PPS - Copyright 1999-2010     *)
(*   \VV/  **************************************************************)
(*    //   *      This file is distributed under the terms of the       *)
(*         *       GNU Lesser General Public License Version 2.1        *)
(************************************************************************)

(* Logic *)
Notation "\u2200 x , P" := (forall x , P)
  (at level 200, x ident, right associativity) : type_scope.
Notation "\u2200 x y , P" := (forall x y , P)
  (at level 200, x ident, y ident, right associativity) : type_scope.
Notation "\u2200 x y z , P" := (forall x y z , P)
  (at level 200, x ident, y ident, z ident, right associativity) : type_scope.
Notation "\u2200 x y z u , P" := (forall x y z u , P)
  (at level 200, x ident, y ident, z ident, u ident, right associativity)
  : type_scope.
Notation "\u2200 x : t , P" := (forall x : t , P)
  (at level 200, x ident, right associativity) : type_scope.
Notation "\u2200 x y : t , P" := (forall x y : t , P)
  (at level 200, x ident, y ident, right associativity) : type_scope.
Notation "\u2200 x y z : t , P" := (forall x y z : t , P)
  (at level 200, x ident, y ident, z ident, right associativity) : type_scope.
Notation "\u2200 x y z u : t , P" := (forall x y z u : t , P)
  (at level 200, x ident, y ident, z ident, u ident, right associativity)
  : type_scope.

Notation "\u2203 x , P" := (exists x , P)
  (at level 200, x ident, right associativity) : type_scope.
Notation "\u2203 x : t , P" := (exists x : t, P)
  (at level 200, x ident, right associativity) : type_scope.

Notation "x \u2228 y" := (x \/ y) (at level 85, right associativity) : type_scope.
Notation "x \u2227 y" := (x /\ y) (at level 80, right associativity) : type_scope.
Notation "x \u2192 y" := (x -> y) (at level 90, right associativity): type_scope.
Notation "x \u2194 y" := (x <-> y) (at level 95, no associativity): type_scope.
Notation "\u00ac x" := (~x) (at level 75, right associativity) : type_scope.
Notation "x \u2260 y" := (x <> y) (at level 70) : type_scope.

(* Abstraction *)
(* Not nice
Notation  "'\u03bb' x : T , y" := ([x:T] y) (at level 1, x,T,y at level 10).
Notation  "'\u03bb' x := T , y" := ([x:=T] y) (at level 1, x,T,y at level 10).
*)

(* Arithmetic *)
Notation "x \u2264 y" := (le x y) (at level 70, no associativity).
Notation "x \u2265 y" := (ge x y) (at level 70, no associativity).

(* test *)
(*
Goal \u2200 x, True -> (\u2203 y , x \u2265 y + 1) \u2228 x \u2264 0.
*)

(* Integer Arithmetic *)
(* TODO: this should come after ZArith
Notation "x \u2264 y" := (Zle x y) (at level 1, y at level 10).
*)
