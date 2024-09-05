% Definição dos tratamentos
%tratamento(origem, destino, nomeTratamento, duracao, unidMonetaria)
tratamento(1, 2, paracetamol, 2, 5).
tratamento(1, 3, brufen, 3, 4).
tratamento(1, 4, aspirina, 4, 2).
tratamento(1, 5, anti_histaminico, 5, 8).
tratamento(1, 6, descanso, 2, 100).
tratamento(2, 7, fisioterapia, 6, 150).
tratamento(2, 0, fisioterapia, 6, 150).
tratamento(2, 8, cine_terapia, 8, 200).
tratamento(2, 0, cine_terapia, 8, 200).
tratamento(3, 7, fisioterapia, 6, 150).
tratamento(3, 0, fisioterapia, 6, 150).
tratamento(3, 9, desporto, 12, 0).
tratamento(4, 11, inalacoes, 10, 50).
tratamento(4, 12, insulina, 30, 34).
tratamento(2, 13, antibiotico, 8, 25).
tratamento(4, 13, antibiotico, 8, 25).
tratamento(5, 13, antibiotico, 8, 25).
tratamento(13, 0, internamento, 3, 250).
tratamento(12, 0, dialise, 10, 100).
tratamento(4, 0, dieta, 30, 0).
tratamento(9, 0, dieta, 30, 0).
tratamento(7, 10, cirurgia, 3, 1200).
tratamento(4, 20, soro, 8, 15).
tratamento(10, 20, soro, 8, 15).
tratamento(11, 20, soro, 8, 15).
tratamento(16, 20, soro, 8, 15).
tratamento(2, 0, oculos, 1000, 500).
tratamento(3, 0, oculos, 1000, 500).
tratamento(4, 0, oculos, 1000, 500).
tratamento(6, 0, oculos, 1000, 500).
tratamento(2, 0, lentes_contacto, 200, 300).
tratamento(3, 0, lentes_contacto, 200, 300).
tratamento(4, 0, lentes_contacto, 200, 300).
tratamento(6, 0, lentes_contacto, 200, 300).
tratamento(6, 0, ambulatorio, 20, 800).
tratamento(15, 0, ambulatorio, 20, 800).
tratamento(7, 0, ambulatorio, 20, 800).
tratamento(17, 0, ambulatorio, 20, 800).
tratamento(18, 0, ambulatorio, 20, 800).
tratamento(20, 0, ambulatorio, 20, 800).





%%%%%%%%%%%%%% Encontrar caminho mais barato%%%%%%%%%%%%%%%%%%%%%%%%

% Sse a origem e o destino sao iguais, o custo total e 0 e o caminho e vazio
% recursao: encontra um tratamento de origem para prox  estado clínico
% garante que prox nao foi visitado antes, evita ciclos
% continua a busca a partir de prox ate o destino, acumulando o custo total
caminho(Origem, Origem, _, 0, []).
caminho(Origem, Destino, Visitados, CustoTotal, [tratamento(Origem, Prox, Tratamento, Tempo, Custo) | Caminho]) :-
    tratamento(Origem, Prox, Tratamento, Tempo, Custo),
    \+ member(Prox, Visitados),
    caminho(Prox, Destino, [Prox|Visitados], CustoResto, Caminho),
    CustoTotal is Custo + CustoResto.



% %%%%%%%%%%% Menor Custo%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% encontra o caminho de menor custo entre origem e destino
% findall para apanhar todos os caminhos possiveis e os seus custos
% ordena os caminhos pelo custo usando o sort e seleciona o caminho com menor custo
menor_custo(Origem, Destino, Caminho, Custo) :-
    findall((C, P), caminho(Origem, Destino, [Origem], C, P), Caminhos),
    sort(Caminhos, [(Custo, Caminho) | _]).





% %%%%%%%%%%%%%%%%%%%%Encontrar caminho mais rápido%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Se a origem e o destino sao iguais, o tempo total e 0 e o caminho e vazio
% recursao: encontra 1 tratamento de origem para prox  estado clínico
% garante que prox nao foi visitado antes, evita ciclos
% continua a busca a partir de prox ate o Destino, acumulando o tempo total
caminho_rapido(Origem, Origem, _, 0, []).
caminho_rapido(Origem, Destino, Visitados, TempoTotal, [tratamento(Origem, Prox, Tratamento, Tempo, Custo) | Caminho]) :-
    tratamento(Origem, Prox, Tratamento, Tempo, Custo),
    \+ member(Prox, Visitados),
    caminho_rapido(Prox, Destino, [Prox|Visitados], TempoResto, Caminho),
    TempoTotal is Tempo + TempoResto.



%%%%%%%%%%%%%%%%% Menor tempo %%%%%%%%%%%%%%%%%%%%%%%%%%

% encontra o caminho + rapido entre origem e destino
% findall para apanhar todos os caminhos possiveis e os seus tempos
% ordena os caminhos pelo tempo usando sort e seleciona o caminho com menor tempo
menor_tempo(Origem, Destino, Caminho, Tempo) :-
    findall((T, P), caminho_rapido(Origem, Destino, [Origem], T, P), Caminhos),
    sort(Caminhos, [(Tempo, Caminho) | _]).
