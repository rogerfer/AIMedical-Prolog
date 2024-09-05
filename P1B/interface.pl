:-[satisfy, induce_ifthen, hospital_ifthen].
:- dynamic fact/1.

% Initialization directive to call the menu
:- initialization(menu).

% the goal is to classify 
learn_rules:-
	learn(nao),  % negative examples
	learn(sim), % positive examples
        % save new rules:
	tell('hospital_ifthen.pl'),
	listing(<==),
	told.

% example of classifying
q1(Class):- classify([idade=adulto, genero=masculino, tabagismo=sim, sintomas=[espirros,febre,tosse]],Class), write(classify([idade=adulto, genero=masculino, tabagismo=sim, sintomas=[espirros,febre,tosse]],Class)).
q2(Class):- classify([idade=crianca, genero=feminino_nao_gravida, tabagismo=nao, sintomas=[tosse_com_sangue,suores_noturnos,emagrecimento]],Class).
q3(Class):- classify([idade=idoso, genero=masculino, tabagismo=sim, sintomas=[ansiedade,cianose,perda_de_apetite]],Class).
q7(Class):- classify([idade=adulto, genero=feminino_gravida, tabagismo=nao, sintomas=[tosse]],Class).
q5(Class):- classify([idade=idoso, genero=feminino_nao_gravida, tabagismo=sim, sintomas=[corrimento_nasal,espirros,perda_de_apetite]], Class).

q4(Class):- findall(A,fact(A),Z), classify(Z,Class), retractall(fact(_)).



menu :- 
     write(
"
                  Gostaria de saber se deve ir ao hospital?
                  Seja bem-vindo ao sistema de recomendacao! Responda às seguintes questões _

" ),nl,

    write(
"__________________________________
 
                    Indique a sua idade

                    1- 0 a 18
                    2- 19 a 65
                    3- 65+

 
                    0- Sair 


_________________________________"),nl,nl,
    read(Idade),
        ((Idade == 0), halt;
        (Idade == 1), assert(fact(idade=crianca));
        (Idade == 2), assert(fact(idade=adulto));
        (Idade == 3), assert(fact(idade=idoso))), nl,

        

    write(
"__________________________________
 
                    Qual o seu género? E caso seja mulher indique se está grávida 

                    1- Masculino
                    2- Feminino e grávida
                    3- Feminino e não grávida
 
                    0- Sair 


__________________________________"),nl,nl,
    read(Genero),
        ((Genero == 0), halt;
        (Genero == 1), assert(fact(genero=masculino));
        (Genero == 2), assert(fact(genero=feminino_gravida));
        (Genero == 3), assert(fact(genero=feminino_nao_gravida))), nl,


    write(
"__________________________________
 
                    Fuma regularmente?

                    1- Sou fumador
                    2- Não sou fumador
 
                    0- Sair 


__________________________________"),nl,nl,
    read(Tabagismo),
        ((Tabagismo == 0), halt;
        (Tabagismo == 1), assert(fact(tabagismo=fumador));
        (Tabagismo == 2), assert(fact(tabagismo=nao_fumador))), nl,


        repeat,
        ask_symptoms,
        write('RESULTADO'), nl,
        q4(Class),
        write('Ir ao hospital: '), write(Class), nl, nl,
        write("As melhoras! Obrigada!"), nl.
    
    
    
    % Ask for symptoms, now using a repeat loop
    ask_symptoms :-
        repeat,
        write(
    "____________________________________________________________________________________________________
        
                        Quais dos seguintes sintomas possui?
    
                        1- Tosse com sangue
                        2- Arrepios
                        3- Infeções
                        4- Dor de garganta
                        5- Cefaleias
                        6- Respiração acelerada
                        7- Ansiedade
                        8- Náusea
                        9- Desfalecimento
                        10- Ritmo cardíaco irregular 
                        11- Cianose
                        12- Corrimento nasal 
                        13- Espirros
                        14- Suores noturnos
                        15- Emagrecimento
                        16- Pieira
                        17- Aperto no peito 
                        18- Perda de apetite
                        19- Fadiga
                        20- Expetoração
                        21- Febre 
                        22- Dor no peito 
                        23- Dificuldade em respirar
                        24- Tosse
                        0- Sair 
    ____________________________________________________________________________________________________"), nl, nl,
        read(Sintomas),
        (   Sintomas == 0 -> !
        ;   map_sintomas(Sintomas, Fact),
            assert(fact(Fact)),
            fail  % This causes the repeat loop to continue
        ).
    
    map_sintomas(1, sintomas=tosse_com_sangue).
    map_sintomas(2, sintomas=arrepios).
    map_sintomas(3, sintomas=infecoes).
    map_sintomas(4, sintomas=dor_de_garganta).
    map_sintomas(5, sintomas=cefaleias).
    map_sintomas(6, sintomas=respiracao_acelerada).
    map_sintomas(7, sintomas=ansiedade).
    map_sintomas(8, sintomas=nausea).
    map_sintomas(9, sintomas=desfalecimento).
    map_sintomas(10, sintomas=ritmo_cardiaco_irregular).
    map_sintomas(11, sintomas=cianose).
    map_sintomas(12, sintomas=corrimento_nasal).
    map_sintomas(13, sintomas=espirros).
    map_sintomas(14, sintomas=suores_noturnos).
    map_sintomas(15, sintomas=emagrecimento).
    map_sintomas(16, sintomas=pieira).
    map_sintomas(17, sintomas=aperto_no_peito).
    map_sintomas(18, sintomas=perda_de_apetite).
    map_sintomas(19, sintomas=fadiga).
    map_sintomas(20, sintomas=expetoracao).
    map_sintomas(21, sintomas=febre).
    map_sintomas(22, sintomas=dor_no_peito).
    map_sintomas(23, sintomas=dificuldade_em_respirar).
    map_sintomas(24, sintomas=tosse).