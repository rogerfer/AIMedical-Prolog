:- op(800, fx, if).
:- op(700, xfx, then).
:- op(300, xfy, or).
:- op(500, xfy, and).

if sintoma(tosse_com_sangue) then doenca(tuberculose).
if sintoma(arrepios) then doenca(pneumonia).
if sintoma(infecoes) then doenca(dpoc).
if sintoma(dores_de_garganta) then doenca(bronquite).
if sintoma(cefaleias) then doenca(bronquite).
if sintoma(respiracao_acelerada) then doenca(embolia_pulmonar).
if sintoma(ansiedade) then doenca(embolia_pulmonar).
if sintoma(nausea) then doenca(embolia_pulmonar).
if sintoma(desfalecimento) then doenca(embolia_pulmonar).
if sintoma(ritmo_cardiaco_irregular) then doenca(embolia_pulmonar).
if sintoma(cianose) then doenca(embolia_pulmonar).
if sintoma(corrimento_nasal) then doenca(vsr).
if sintoma(espirros) then doenca(vsr).


if sintoma(emagrecimento) and sintoma(dor_no_peito) then doenca(abcesso_pulmonar).
if sintoma(suores_noturnos) and sintoma(dor_no_peito) then doenca(abcesso_pulmonar).
if sintoma(suores_noturnos) and sintoma(fadiga) then doenca(tuberculose).
if sintoma(aperto_no_peito) and sintoma(dor_no_peito) then doenca(asma).
if sintoma(aperto_no_peito) and sintoma(fadiga) then doenca(asma).
if sintoma(aperto_no_peito) and sintoma(expetoracao) then doenca(dpoc).
if sintoma(perda_de_apetite) and sintoma(fadiga) then doenca(tuberculose).
if sintoma(perda_de_apetite) and sintoma(dor_no_peito) then doenca(abcesso_pulmonar).
if sintoma(pieira) and (sintoma(perda_de_apetite) or sintoma(febre)) then doenca(vsr).
if sintoma(pieira) and (sintoma(expetoracao) or sintoma(infecoes) or sintoma(dificuldade_em_respirar) or sintoma(aperto_no_peito)) then doenca(dpoc).
if sintoma(fadiga) and (sintoma(febre) or sintoma(expetoracao)) then doenca(tuberculose).
if sintoma(fadiga) and (sintoma(tosse) or sintoma(dor_no_peito) or sintoma(dificuldade_em_respirar)) then doenca(bronquite).
if sintoma(emagrecimento) and (sintoma(fadiga) or sintoma(perda_de_apetite) or sintoma(suores_noturnos)) then doenca(tuberculose).
if sintoma(pieira) and (sintoma(expetoracao) or sintoma(infecoes) or sintoma(dificuldade_em_respirar) or sintoma(aperto_no_peito)) then doenca(dpoc).
if sintoma(pieira) and sintoma(perda_de_apetite) and sintoma(febre) then doenca(vsr).
if sintoma(expetoracao) and (sintoma(dificuldade_em_respirar) or sintoma(dor_no_peito)) then doenca(pneumonia).
if sintoma(suores_noturnos) and sintoma(febre) and sintoma(tosse) then doenca(abcesso_pulmonar).
if sintoma(suores_noturnos) and sintoma(perda_de_apetite) and sintoma(expetoracao) then doenca(tuberculose).
if sintoma(pieira) and sintoma(tosse) and (sintoma(expetoracao) or sintoma(infecoes) or sintoma(dificuldade_em_respirar) or sintoma(aperto_no_peito)) then doenca(dpoc).
if sintoma(pieira) and sintoma(tosse) and (sintoma(perda_de_apetite) or sintoma(febre)) then doenca(vsr).
if sintoma(fadiga) and sintoma(tosse) and sintoma(dor_no_peito) and sintoma(dificuldade_em_respirar) then doenca(asma).
if sintoma(emagrecimento) and sintoma(dor_no_peito) and (sintoma(febre) or sintoma(tosse) or sintoma(expetoracao)) then doenca(abcesso_pulmonar).
if sintoma(aperto_no_peito) and (sintoma(tosse) or sintoma(dificuldade_em_respirar)) and sintoma(dor_no_peito) then doenca(asma).
if sintoma(emagrecimento) and sintoma(fadiga) and sintoma(perda_de_apetite) and sintoma(suores_noturnos) then doenca(tuberculose).
if sintoma(expetoracao) and sintoma(dificuldade_em_respirar) and sintoma(dor_no_peito) then doenca(pneumonia).
if sintoma(expetoracao) and (sintoma(dificuldade_em_respirar) or sintoma(dor_no_peito)) then doenca(pneumonia).
if sintoma(expetoracao) and sintoma(tosse) and not(sintoma(febre)) then doenca(dpoc).
if sintoma(expetoracao) and sintoma(dificuldade_em_respirar) and sintoma(dor_no_peito) then doenca(pneumonia).
if sintoma(dor_no_peito) and sintoma(dificuldade_em_respirar) and not(sintoma(tosse)) then doenca(embolia_pulmonar).
if sintoma(dor_no_peito) and sintoma(tosse) and not(sintoma(dificuldade_em_respirar)) then doenca(abcesso_pulmonar).
if sintoma(dor_no_peito) and sintoma(tosse) and sintoma(dificuldade_em_respirar) then doenca(asma).
if sintoma(dificuldade_em_respirar) and sintoma(tosse) and not(sintoma(aperto_no_peito)) then doenca(bronquite).
if sintoma(perda_de_apetite) and (sintoma(tosse) or sintoma(febre)) and (not(sintoma(dor_no_peito)) and not(sintoma(emagrecimento)) and not(sintoma(suores_noturnos)) and not(sintoma(expetoracao)) and not(sintoma(fadiga))) then doenca(vsr).
if sintoma(perda_de_apetite) and (sintoma(tosse) and sintoma(febre)) and (not(sintoma(dor_no_peito)) and not(sintoma(emagrecimento)) and not(sintoma(suores_noturnos)) and not(sintoma(expetoracao)) and not(sintoma(fadiga))) then doenca(vsr).
if sintoma(febre) and sintoma(tosse) and not(sintoma(dor_no_peito)) and not(sintoma(dificuldade_em_respirar)) then doenca(vsr).
if sintoma(febre) and sintoma(tosse) and sintoma(dor_no_peito) and not(sintoma(dificuldade_em_respirar)) then doenca(abcesso_pulmonar).
if sintoma(febre) and sintoma(tosse) and sintoma(dor_no_peito) and sintoma(dificuldade_em_respirar) then doenca(pneumonia).
if sintoma(expetoracao) and sintoma(febre) and sintoma(tosse) and not(sintoma(dor_no_peito)) and not(sintoma(dificuldade_em_respirar)) then doenca(tuberculose).
if sintoma(expetoracao) and sintoma(febre) and sintoma(tosse) and sintoma(dificuldade_em_respirar) and sintoma(dor_no_peito) then doenca(pneumonia).
if sintoma(expetoracao) and sintoma(febre) and sintoma(tosse) and (sintoma(dificuldade_em_respirar) or sintoma(dor_no_peito)) then doenca(pneumonia).
if sintoma(expetoracao) and sintoma(febre) and sintoma(tosse) and sintoma(dor_no_peito) and not(sintoma(dificuldade_em_respirar)) then doenca(abcesso_pulmonar).
if sintoma(febre) and sintoma(tosse) and sintoma(dor_no_peito) and sintoma(perda_de_apetite) and sintoma(emagrecimento) and sintoma(suores_noturnos) and sintoma(expetoracao) then doenca(abcesso_pulmonar).
if sintoma(tosse) and sintoma(dificuldade_em_respirar) and sintoma(dor_no_peito) and sintoma(aperto_no_peito) and sintoma(fadiga) then doenca(asma).
if sintoma(tosse) and sintoma(dificuldade_em_respirar) and sintoma(dor_no_peito) and sintoma(dores_de_garganta) and sintoma(cefaleias) and sintoma(fadiga) then doenca(bronquite).
if sintoma(tosse) and sintoma(expetoracao) and sintoma(infecoes) and sintoma(dificuldade_em_respirar) and sintoma(pieira) and sintoma(aperto_no_peito) then doenca(dpoc).
if sintoma(dificuldade_em_respirar) and sintoma(dor_no_peito) and sintoma(respiracao_acelerada) and sintoma(ansiedade) and sintoma(nausea) and sintoma(desfalecimento) and sintoma(ritmo_cardiaco_irregular) and sintoma(cianose) then doenca(embolia_pulmonar).




