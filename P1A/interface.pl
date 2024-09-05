:- dynamic fact/1.
:- [basedados].
:- [condicoes].
:- [forward].
:- [proof].

% Menu de consulta
menu :-
    nl, nl,
    write('********************************************************************************************************'), nl,
    write('**                     Bem vindo ao programa de Recomendacao de Tratamento Medico!                    **'), nl,
    write('**                      Responda a algumas perguntas para que possamos ajuda-lo.                      **'), nl,
    write('********************************************************************************************************'), nl,
    write('**  Menu:                                                                                             **'), nl,
    write('**   1- Iniciar                                                                                       **'), nl,
    write('**   2- Sair                                                                                          **'), nl,
    read(Y), retractall(fact(_)), % apaga facts dinâmicos
    avaliarEscolha(Y).

avaliarEscolha(1) :- perguntas, resultado.
avaliarEscolha(2) :- write('**                              Foi um prazer ser útil! Volte sempre!                                 **'), nl, halt.
avaliarEscolha(_) :- write('*************************  Introduziu uma opção inválida, por favor comece de novo *************************'), nl, menu.

% Perguntas de sintomas
perguntas :- 
    p_febre, p_tosse, p_dor_no_peito, p_perda_de_apetite, p_emagrecimento, p_suores_noturnos,
    p_expetoracao, p_dificuldade_em_respirar, p_aperto_no_peito, p_fadiga, p_dores_de_garganta,
    p_cefaleias, p_infeccoes, p_pieira, p_arrepios, p_respiracao_acelerada, p_ansiedade, p_nausea,
    p_desfalecimento, p_ritmo_cardiaco_irregular, p_cianose, p_tosse_com_sangue, p_corrimento_nasal, p_espirros.

% Cada pergunta define um fato
pergunta(Texto, Sintoma) :-
    write(Texto), nl,
    write('1- Sim.'), nl,
    write('2- Nao.'), nl,
    write('A sua opcao e: '), read(P1),
    ((P1 == 1, assert(fact(sintoma(Sintoma))), write('Fato assertado: '), write(Sintoma), nl); P1 == 2).

p_febre :- pergunta('Tem febre?', febre).
p_tosse :- pergunta('Tem tosse?', tosse).
p_dor_no_peito :- pergunta('Doi-lhe o peito?', dor_no_peito).
p_perda_de_apetite :- pergunta('Perdeu o apetite?', perda_de_apetite).
p_emagrecimento :- pergunta('Perdeu peso?', emagrecimento).
p_suores_noturnos :- pergunta('Tem suores noturnos?', suores_noturnos).
p_expetoracao :- pergunta('Tem expectoracao?', expetoracao).
p_dificuldade_em_respirar :- pergunta('Tem dificuldade em respirar?', dificuldade_em_respirar).
p_aperto_no_peito :- pergunta('Sente aperto no peito?', aperto_no_peito).
p_fadiga :- pergunta('Sente fadiga?', fadiga).
p_dores_de_garganta :- pergunta('Doi-lhe a garganta?', dores_de_garganta).
p_cefaleias :- pergunta('Tem cefaleias?', cefaleias).
p_infeccoes :- pergunta('Tem infeccoes?', infeccoes).
p_pieira :- pergunta('Tem pieira?', pieira).
p_arrepios :- pergunta('Tem arrepios?', arrepios).
p_respiracao_acelerada :- pergunta('Tem respiracao acelerada?', respiracao_acelerada).
p_ansiedade :- pergunta('Sente ansiedade?', ansiedade).
p_nausea :- pergunta('Sente nausea?', nausea).
p_desfalecimento :- pergunta('Sente desfalecimento?', desfalecimento).
p_ritmo_cardiaco_irregular :- pergunta('Tem ritmo cardiaco irregular?', ritmo_cardiaco_irregular).
p_cianose :- pergunta('Tem cianose?', cianose).
p_tosse_com_sangue :- pergunta('Tem tosse com sangue?', tosse_com_sangue).
p_corrimento_nasal :- pergunta('Tem corrimento nasal?', corrimento_nasal).
p_espirros :- pergunta('Tem espirros?', espirros).

% Diagnóstico e apresentação de resultados
resultado :- 
    result,
    findall(Doenca, (fact(doenca(Doenca)), doenca(Doenca)), Doencas),
    get_tratamentos(normal, Doencas, Tratamentos), % Inicialmente, obtemos o tratamento normal
    (Tratamentos == [] -> write('Nao foi possivel identificar a doenca especifica. Por favor, consulte um medico para obter um diagnostico preciso.')
    ; apresentar_resultados(Tratamentos), tipo_individuo(Tipo), get_tratamentos(Tipo, Doencas, TratamentosTipo), apresentar_resultados_tipo(Tipo, TratamentosTipo)),
    retractall(fact(_)).

% Perguntar tipo de indivíduo
tipo_individuo(Tipo) :-
    write('Qual e o seu tipo?'), nl,
    write('1- Regular.'), nl,
    write('2- Idoso.'), nl,
    write('3- Gravida.'), nl,
    write('4- Menor.'), nl,
    write('A sua opcao e: '), read(P1),
    (P1 == 1 -> Tipo = normal
    ; P1 == 2 -> Tipo = idoso
    ; P1 == 3 -> Tipo = gravida
    ; P1 == 4 -> Tipo = menor).

% Obtenção de tratamentos
get_tratamentos(_, [], []).
get_tratamentos(Tipo, [D|R], [(D, Tratamento)|R2]) :- 
    tratamento(D, Tipo, Tratamento), 
    get_tratamentos(Tipo, R, R2).

% Apresentação dos resultados
apresentar_resultados([]).
apresentar_resultados([(D, T)|R]) :-
    write('Pode ter '), write(D), write('. O tratamento recomendado e: '),  
    write(T), nl,
    apresentar_resultados(R).

% Apresentação dos resultados para um tipo específico
apresentar_resultados_tipo(_, []).
apresentar_resultados_tipo(Tipo, [(D, T)|R]) :-
    write('Para o tipo '), write(Tipo), write(', pode ter '), write(D), write('. O tratamento recomendado e: '),  
    write(T), nl,
    apresentar_resultados_tipo(Tipo, R).

% Inicialização do menu
:- menu.
