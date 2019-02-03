;; This extracted scheme code relies on some additional macros
;; available at http://www.pps.jussieu.fr/~letouzey/scheme
(load "macros_extr.scm")

(define plus (lambdas (n m) (match n
                               ((O) m)
                               ((S p) `(S ,(@ plus p m))))))
  
(define myfunc (lambdas (x y) (@ plus x y)))

