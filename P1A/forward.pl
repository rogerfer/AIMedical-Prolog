:- op(800, fx, if).
:- op(700, xfx, then).
:- op(300, xfy, or).
:- op(500, xfy, and).

:- dynamic fact/1.

% Encadeamento para frente: derivar novos fatos a partir das regras e fatos existentes
result :- 
    new_derived_fact(P), !, % Procurar um novo fato derivado 'P'
    assert(fact(P)), % Adicionar o fato 'P'
    result.

result.

new_derived_fact(Concl) :-
    if Cond then Concl, % Se Cond então Concl (regra)
    \+ fact(Concl), % Verificar se Concl ainda não é um fato
    composed_fact(Cond). % Verificar se todas as partes de Cond são verdadeiras

composed_fact(Cond) :- % Passar a verificação ao fato
    fact(Cond). % Verificar se Cond já é um fato

composed_fact(Cond1 and Cond2) :- % Lidar com a conjunção (and)
    composed_fact(Cond1), % Verificar Cond1
    composed_fact(Cond2). % Verificar Cond2

composed_fact(Cond1 or Cond2) :- % Lidar com a disjunção (or)
    composed_fact(Cond1);   % Verificar Cond1
    composed_fact(Cond2). % Verificar Cond2
