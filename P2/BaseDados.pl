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


%%%%%%%%%%%%%%%%% Encontrar caminho mais barato%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Se a origem e o destino são iguais, o custo total é 0 e o caminho é vazio.
caminho(Origem, Origem, _, 0, []).
%recursao: encontra 1 tratamento de Origem para prox estado clinico.
%garante que Prox não foi visitado antes (evita ciclos).
%continua a busca a partir de prox até destino, acumulando o custo total.
caminho(Origem, Destino, Visitados, CustoTotal, [tratamento(Origem, Prox, Tratamento, Tempo, Custo) | Caminho]) :-
    tratamento(Origem, Prox, Tratamento, Tempo, Custo),
    \+ member(Prox, Visitados),
    caminho(Prox, Destino, [Prox|Visitados], CustoResto, Caminho),
    CustoTotal is Custo + CustoResto.



%%%%%%%%%%%%%%%%%%%%%% Predicado Menor Custo%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Encontra caminho de menor custo entre origem e destino.
% findall para apanhar todos os caminhos possíveis e os seus custos.
% Ordena os caminhos pelo custo usando sort e seleciona o caminho com menor custo.
menor_custo(Origem, Destino, Caminho, Custo) :-
    findall((C, P), caminho(Origem, Destino, [Origem], C, P), Caminhos),
    sort(Caminhos, [(Custo, Caminho) | _]).






%%%%%%%%%%%%%%%%%% Encontrar caminho mais rápido%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% origem e destino são iguais, o tempo total é 0 e o caminho é vazio.
caminho_rapido(Origem, Origem, _, 0, []).
%recursao: encontra 1 tratamento de origem para prox.
% garante que Prox não foi visitado antes, vai evitar ciclos.
%continua a busca a partir de Prox até Destino, acumulando o tempo total.
caminho_rapido(Origem, Destino, Visitados, TempoTotal, [tratamento(Origem, Prox, Tratamento, Tempo, Custo) | Caminho]) :-
    tratamento(Origem, Prox, Tratamento, Tempo, Custo),
    \+ member(Prox, Visitados),
    caminho_rapido(Prox, Destino, [Prox|Visitados], TempoResto, Caminho),
    TempoTotal is Tempo + TempoResto.





%%%%%%%%%%%%%%%%% Predicado Menor Tempo%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% encontrar o caminho mais rápido entre origem e destino
% findall para apanhar todos os caminhos possíveis e os tempos
% rdena caminhos pelo tempo usando sort e seleciona o caminho com menor tempo.
menor_tempo(Origem, Destino, Caminho, Tempo) :-
    findall((T, P), caminho_rapido(Origem, Destino, [Origem], T, P), Caminhos),
    sort(Caminhos, [(Tempo, Caminho) | _]).




%%%%%%%%%%%%%%% Peso para o custo e tempo%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% define a importância relativa do custo e do tempo ao calcular o caminho eficiente
%soma de cada dos pesos deve ser igual a 1, para garantir 100% de importancia
peso_custo(0.5).
peso_tempo(0.5).




% %%%%%%%%%Encontrar o caminho + eficiente combinando custo e tempo, retornando custo e tempo separadamente

% findall para apanhar todos os caminhos possíveis com seus custos e tempos
%Ordena os caminhos pela eficiencia combinada de custo e tempo usando o sort, e seleciona o mais eficiente.
caminho_eficiente(Origem, Destino, Caminho, CustoTotal, TempoTotal) :-
    findall((Custo, Tempo, Caminho), caminho_combinado(Origem, Destino, [Origem], Custo, Tempo, Caminho), Caminhos),
    sort(Caminhos, [(CustoTotal, TempoTotal, Caminho) | _]).





% %%%%%%%%%%%%%%%%%%%Caminho Combinado%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% origem e o destino são iguais, os custos e tempos totais são 0 e o caminho e vazio
% recursao: encontra 1 tratamento de origem para prox estado clínico
% garante que Prox nao foi visitado antes, evita ciclos
% continua a busca a partir de prox ate o destino e acumula os custos e tempos totais
caminho_combinado(Origem, Origem, _, 0, 0, []).
caminho_combinado(Origem, Destino, Visitados, CustoTotal, TempoTotal, [tratamento(Origem, Prox, Tratamento, Tempo, Custo) | Caminho]) :-
    tratamento(Origem, Prox, Tratamento, Tempo, Custo),
    \+ member(Prox, Visitados),
    caminho_combinado(Prox, Destino, [Prox | Visitados], CustoResto, TempoResto, Caminho),
    CustoTotal is Custo + CustoResto,
    TempoTotal is Tempo + TempoResto.
