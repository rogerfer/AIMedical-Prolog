% Carrega os dados do tratamento
:- consult('BaseDados.pl').


% Inicia a interface do utilizador
iniciar :-
    write('Sistema de Busca de Caminho Terapeutico'), nl,
    menu.

% Exibe o menu e captura a escolha do utilizador
menu :-
    write('Digite o estado clinico de origem ou \'sair\' para terminar: '), nl,
    read(EstadoOrigem),
    (   EstadoOrigem == sair
    ->  true  % Encerra o programa
    ;   escolher_tipo_busca(EstadoOrigem)
    ).

% Permite ao utilizador escolher entre a busca mais barata, mais rápida ou a combinada
escolher_tipo_busca(EstadoOrigem) :-
    write('Escolha uma opcao: '), nl,
    write('1 - para custo minimo'), nl,
    write('2 - para tempo minimo'), nl,
    write('3 - para tempo e custo minimo'), nl,
    read(TipoBusca),
    (   TipoBusca == 1
    ->  executar_busca_custo(EstadoOrigem)
    ;   TipoBusca == 2
    ->  executar_busca_tempo(EstadoOrigem)
    ;   TipoBusca == 3
    ->  executar_busca_eficiente(EstadoOrigem)
    ;   write('Opção invalida.'), nl,
        escolher_tipo_busca(EstadoOrigem)
    ).

%%%%%%%%%% Executa a busca pelo menor custo e exibe os resultados%%%%%%%%%%%%%%

%encontra o caminho de menor custo a partir de origem ate o destino 0
% exibe o caminho encontrado e o custo total
% retorna ao menu principal apos exibir os resultados
executar_busca_custo(EstadoOrigem) :-
    menor_custo(EstadoOrigem, 0, Caminho, Custo),
    write('Caminho mais barato encontrado: '), write(Caminho), nl,
    write('Custo total: '), write(Custo), nl,
    menu.



%%%%%%%%%%%%%%%%% Executa a busca pelo menor tempo e exibe os resultados%%%%%%%%%%%%%%%%%%%%
% encontra o caminho + rapido a partir de EstadoOrigem ate o destino 0
% exibe o caminho encontrado e o tempo total
executar_busca_tempo(EstadoOrigem) :-
    menor_tempo(EstadoOrigem, 0, Caminho, Tempo),
    write('Caminho mais rapido encontrado: '), write(Caminho), nl,
    write('Tempo total: '), write(Tempo), nl,
    menu.




% %%%%%%%%%%%%%%Executa a busca eficiente combinando custo e tempo e exibe os resultados%%%%%%%%%%%%%%%%%%%%%%
% encontra o caminho + eficiente (considera custo e tempo) a partir de EstadoOrigem ate o destino 0
% exibe o caminho encontrado, o custo total e o tempo total
executar_busca_eficiente(EstadoOrigem) :-
    caminho_eficiente(EstadoOrigem, 0, Caminho, CustoTotal, TempoTotal),
    write('Caminho eficiente encontrado: '), write(Caminho), nl,
    write('Custo total: '), write(CustoTotal), nl,
    write('Tempo total: '), write(TempoTotal), nl,
    menu.


% Encerra a aplicação
encerrar :-
    write('Obrigado por usar o sistema.'), nl.
