(* note: Haskell extraction of this function requires the following fix-ups:
  - rename of module from /Users/.../myfunc to Myfunc
  - removed 'import qualified Prelude'
  - add 'deriving show' to 'Nat' data type definition
  call, e.g. in GHCI as follows:
     > myfunc (S (S O)) (S O)
       (S (S (S O)))
     (note: 'O' is uppercase 'o', and NOT '0' (i.e. zero))
*)
Extraction Language Haskell.
Definition mynatfunc := (fun x y : nat => x + y).
Extraction "/Users/ehoning/unsecured/projects/coq/mynatfunc.hs" mynatfunc.

(* note: need to add 'deriving Show' to ALL defined types
  example usage:
  > myintfunc Z0 Z0
       Z0
  > myintfunc (Zpos XH) (Zpos XH)
      Zpos (X0 XH)
  > myintfunc (Zpos XH) (Zpos X0 XH)
      Zpos (XI XH)
  > myintfunc (Zneg XH) (Zpos XH)
      Z0
*)
Require Import ZArith.
Definition myintfunc := (fun x y : Z => Zplus x y).
Extraction "/Users/ehoning/projects/coq/myintfunc.hs" myintfunc.


(* note: scheme extraction attempt results in scheme source with the
   following 'disclaimer':
;; This extracted scheme code relies on some additional macros
;; available at http://www.pps.jussieu.fr/~letouzey/scheme
(load "macros_extr.scm")

needs ivestigation
*)
(*
Extraction Language Scheme.
Definition Myfunc := (fun x y : nat => x + y).
Extraction "/Users/ehoning/projects/coq/myfunc" Myfunc.
*)