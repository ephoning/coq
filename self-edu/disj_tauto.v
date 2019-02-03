(* disjunction proof using tauto tactic example; EPH 05/20/07 *)
Variables  A B C: Prop.
Lemma or_commutative:  A \/ B -> B \/ A.
tauto.
Qed.
(* show constructed proof tree; see tutorial page 15 for some explanation *)
Print or_commutative. 
