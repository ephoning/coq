Require Import Bool ZArith.

Definition Zsqr (z:Z) : Z := z*z.

Definition my_func (f: Z -> Z) (z:Z) : Z := f (f z).

Eval cbv delta in (Zsqr 1).

Eval cbv delta [Zsqr] in (Zsqr 1).

Eval cbv delta [my_func Zsqr] in (my_func Zsqr 1).

Eval cbv delta [my_func Zsqr] in (my_func Zsqr).

Eval cbv delta [my_func Zsqr] in my_func.
