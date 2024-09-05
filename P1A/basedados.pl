% Define doenças
doenca(tuberculose).
doenca(pneumonia).
doenca(asma).
doenca(dpoc).
doenca(embolia_pulmonar).
doenca(abcesso_pulmonar).   
doenca(vsr).

% Define sintomas
sintoma(febre).
sintoma(tosse).
sintoma(dor_no_peito).
sintoma(perda_de_apetite).
sintoma(emagrecimento).
sintoma(suores_noturnos).
sintoma(expetoracao).
sintoma(dificuldade_em_respirar).
sintoma(aperto_no_peito).
sintoma(fadiga).
sintoma(dores_de_garganta).
sintoma(cefaleias).
sintoma(infecoes).
sintoma(pieira).
sintoma(arrepios).
sintoma(respiracao_acelerada).
sintoma(ansiedade).
sintoma(nausea).
sintoma(desfalecimento).
sintoma(ritmo_cardiaco_irregular).
sintoma(cianose).
sintoma(tosse_com_sangue).
sintoma(corrimento_nasal).
sintoma(espirros).

% Tratamentos para Abcesso Pulmonar
tratamento(abcesso_pulmonar, normal, [antibioticos, drenagem, cirurgia_opcional]).
tratamento(abcesso_pulmonar, idoso, [antibioticos, drenagem_cautelosa]).
tratamento(abcesso_pulmonar, gravida, [antibioticos_seguros_gravidez, evitar_drenagem_cirurgia]).
tratamento(abcesso_pulmonar, menor, [antibioticos, drenagem_infantil]).

% Tratamentos para Asma
tratamento(asma, normal, [corticoides_inalados, antagonistas_leucotrienos, broncodilatadores]).
tratamento(asma, idoso, [corticoides_inalados, broncodilatadores_monitoramento]).
tratamento(asma, gravida, [corticoides_seguros_gravidez]).
tratamento(asma, menor, [corticoides_inalados, broncodilatadores_infantil]).

% Tratamentos para Bronquite
tratamento(bronquite, normal, [liquidos_abundancia, inaladores_asma, repouso, aspirina, acetaminofeno]).
tratamento(bronquite, idoso, [liquidos_abundancia, inaladores_asma, repouso, acetaminofeno]).
tratamento(bronquite, gravida, [liquidos_abundancia, inaladores_seguros_gravidez, repouso]).
tratamento(bronquite, menor, [liquidos_abundancia, inaladores_asma, repouso, acetaminofeno_infantil]).

% Tratamentos para Doença Pulmonar Obstrutiva Crônica (DPOC)
tratamento(dpoc, normal, [broncodilatadores, oxigenio, ventilacao_nao_invasiva, fisioterapia_respiratoria, vacinacao]).
tratamento(dpoc, idoso, [broncodilatadores, oxigenio, fisioterapia_respiratoria, monitorar_oxigenio]).
tratamento(dpoc, gravida, [broncodilatadores_seguros_gravidez, oxigenio_monitoramento]).
tratamento(dpoc, menor, [broncodilatadores_infantil, oxigenio_supervisao]).

% Tratamentos para Embolia Pulmonar
tratamento(embolia_pulmonar, normal, [ventilacao, anticoagulantes, terapia_trombolitica, cirurgia_opcional]).
tratamento(embolia_pulmonar, idoso, [ventilacao, anticoagulantes_cuidados]).
tratamento(embolia_pulmonar, gravida, [ventilacao, anticoagulantes_seguros_gravidez]).
tratamento(embolia_pulmonar, menor, [ventilacao, anticoagulantes_ajustados, monitoramento]).

% Tratamentos para Pneumonia
tratamento(pneumonia, normal, [antibiotico, medicacao, antivirais_virais]).
tratamento(pneumonia, idoso, [antibiotico, medicacao_monitoramento]).
tratamento(pneumonia, gravida, [antibiotico_seguro_gravidez]).
tratamento(pneumonia, menor, [antibiotico, medicacao_pediatrica]).

% Tratamentos para Tuberculose
tratamento(tuberculose, normal, [medicacao]).
tratamento(tuberculose, idoso, [medicacao_monitoramento_efetos_secundarios]).
tratamento(tuberculose, gravida, [medicacao_segura_gravidez]).
tratamento(tuberculose, menor, [medicacao_ajustada_criancas]).

% Tratamentos para Vírus Sincicial Respiratório (VSR)
tratamento(vsr, normal, [analgesico, ingerir_liquidos, oxigenio]).
tratamento(vsr, idoso, [analgesico_cautela, ingerir_liquidos, condicoes_preexistentes]).
tratamento(vsr, gravida, [analgesico_seguro_gravidez, ingerir_liquidos]).
tratamento(vsr, menor, [analgesico_pediatrico, ingerir_liquidos, oxigenio_supervisao]).
