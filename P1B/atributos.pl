:- dynamic attribute/2. 

attribute(idade, [crianca, adulto, idoso]).
attribute(genero, [masculino, feminino_gravida, feminino_nao_gravida]).
attribute(tabagismo, [fumador, nao_fumador]).
attribute(sintomas, [tosse_com_sangue, arrepios, infecoes, dor_de_garganta, cefaleias, respiracao_acelerada, ansiedade, nauseas, desfalecimento, ritmo_cardiaco_irregular, cianose, corrimento_nasal, espirros, suores_noturnos, emagrecimento, pieira, aperto_no_peito, perda_de_apetite, fadiga, expetoracao, febre, dor_no_peito, dificuldade_em_respirar, tosse]).

:- dynamic example/2. 

example(nao, [idade=adulto, genero=masculino, tabagismo=sim, sintomas=[espirros,febre,tosse]]).
example(sim, [idade=crianca, genero=feminino_nao_gravida, tabagismo=nao, sintomas=[tosse_com_sangue,suores_noturnos,emagrecimento]]).
example(sim, [idade=idoso, genero=masculino, tabagismo=sim, sintomas=[ansiedade,cianose,perda_de_apetite]]).
example(sim, [idade=adulto, genero=feminino_gravida, tabagismo=nao, sintomas=[ansiedade,nauseas,tosse]]).
example(nao, [idade=crianca, genero=masculino, tabagismo=sim, sintomas=[arrepios,dor_de_garganta,dificuldade_em_respirar]]).
example(sim, [idade=adulto, genero=feminino_gravida, tabagismo=nao, sintomas=[ritmo_cardiaco_irregular,aperto_no_peito]]).
example(nao, [idade=adulto, genero=feminino_gravida, tabagismo=nao, sintomas=[tosse]]).
example(sim, [idade=idoso, genero=feminino_nao_gravida, tabagismo=sim, sintomas=[infecoes,desfalecimento,febre]]).
example(nao, [idade=idoso, genero=masculino, tabagismo=sim, sintomas=[suores_noturnos,expetoracao,dor_no_peito]]).
example(nao, [idade=crianca, genero=masculino, tabagismo=nao, sintomas=[pieira,febre,dificuldade_em_respirar]]).
example(nao, [idade=idoso, genero=feminino_nao_gravida, tabagismo=sim, sintomas=[corrimento_nasal,espirros,perda_de_apetite]]).
example(sim, [idade=adulto, genero=feminino_gravida, tabagismo=nao, sintomas=[cefaleias,febre,dor_no_peito]]).
example(sim, [idade=crianca, genero=masculino, tabagismo=sim, sintomas=[respiracao_acelerada,cianose,dor_no_peito]]).
example(nao, [idade=adulto, genero=masculino, tabagismo=sim, sintomas=[tosse_com_sangue,fadiga,expetoracao]]).
