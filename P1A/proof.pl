% demo(P, Proof) Proof é uma prova de que P é verdadeiro

:- op(800, xfx, <=).

demo(P, P)  :-
   fact(P).

demo(P, P <= CondProof)  :-
   if Cond then P,
   demo(Cond, CondProof).

demo(P1 and P2, Proof1 and Proof2)  :-
   demo(P1, Proof1),
   demo(P2, Proof2).

demo(P1 or P2, Proof)  :-
   demo(P1, Proof)
   ;
   demo(P2, Proof).
