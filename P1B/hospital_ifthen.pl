:- dynamic (<==)/2.

nao<==[
    [idade=adulto, genero=masculino, tabagismo=sim, sintomas=[espirros,febre,tosse]],
    [idade=crianca, genero=masculino, tabagismo=sim, sintomas=[arrepios,dor_de_garganta,dificuldade_em_respirar]],
    [idade=adulto, genero=feminino_gravida, tabagismo=nao, sintomas=[tosse]],
    [idade=idoso, genero=masculino, tabagismo=sim, sintomas=[suores_noturnos,expetoracao,dor_no_peito]],
    [idade=crianca, genero=masculino, tabagismo=nao, sintomas=[pieira,febre,dificuldade_em_respirar]],
    [idade=idoso, genero=feminino_nao_gravida, tabagismo=sim, sintomas=[corrimento_nasal,espirros,perda_de_apetite]],
    [idade=adulto, genero=masculino, tabagismo=sim, sintomas=[tosse_com_sangue,fadiga,expetoracao]]
].

sim<==[
    [idade=crianca, genero=feminino_nao_gravida, tabagismo=nao, sintomas=[tosse_com_sangue,suores_noturnos,emagrecimento]],
    [idade=idoso, genero=masculino, tabagismo=sim, sintomas=[ansiedade,cianose,perda_de_apetite]],
    [idade=adulto, genero=feminino_gravida, tabagismo=nao, sintomas=[ansiedade,nauseas,tosse]],
    [idade=adulto, genero=feminino_gravida, tabagismo=nao, sintomas=[ritmo_cardiaco_irregular,aperto_no_peito]],
    [idade=idoso, genero=feminino_nao_gravida, tabagismo=sim, sintomas=[infecoes,desfalecimento,febre]],
    [idade=adulto, genero=feminino_gravida, tabagismo=nao, sintomas=[cefaleias,febre,dor_no_peito]],
    [idade=crianca, genero=masculino, tabagismo=sim, sintomas=[respiracao_acelerada,cianose,dor_no_peito]]
].