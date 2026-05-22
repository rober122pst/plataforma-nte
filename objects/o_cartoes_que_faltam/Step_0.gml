// 🏃‍♂️ SEGUE O PLAYER: Fica travado do LADO DIREITO dele
if (instance_exists(o_player)) {
    x = o_player.x + 35; 
    y = o_player.y - 25; 
}

// 🔍 CHECA A DISTÂNCIA ATÉ A MÁQUINA MAIS PRÓXIMA
if (instance_exists(o_player) && instance_exists(o_panel)) {
    
    var _maquina_perto = instance_nearest(o_player.x, o_player.y, o_panel);
    var _distancia = point_distance(o_player.x, o_player.y, _maquina_perto.x, _maquina_perto.y);
    
    // 💳 CONTA QUANTOS CARTÕES O PLAYER AINDA TEM
    var _quantidade_cartoes = 0;
    var _tamanho_inv = array_length(o_player.inventory);
    for (var i = 0; i < _tamanho_inv; i++) {
        if (o_player.inventory[i] == 0) { // Ajuste o '0' se o frame do cartão for outro
            _quantidade_cartoes++;
        }
    }
    
    // SÓ ABRE se ainda não tiver aparecido 3 vezes
    if (_distancia <= 64 && _quantidade_cartoes > 0 && vezes_que_apareceu < 3) {
        maquina_alvo = _maquina_perto; 
        
        // 📈 CHEGOU PERTO: Faz o balão crescer
        if (balao_escala < 1) {
            balao_escala += velocidade_animacao;
            if (balao_escala > 1) balao_escala = 1;
        }
    } else {
        // 📉 AFASTOU, ENTREGOU ITENS OU COMPLETOU AS 3 VEZES: Encolhe suavemente
        if (balao_escala > 0) {
            balao_escala -= velocidade_animacao;
            if (balao_escala < 0) balao_escala = 0;
        } else {
            maquina_alvo = noone;
        }
    }
} else {
    if (balao_escala > 0) {
        balao_escala -= velocidade_animacao;
        if (balao_escala < 0) balao_escala = 0;
    } else {
        maquina_alvo = noone;
    }
}

// 🎯 SISTEMA DE CONTAGEM E AUTO-DESTRUIÇÃO
// 1. Detecta quando o balão abriu 100% na tela
if (balao_escala >= 1 && !ja_contou_esta_aparicao) {
    vezes_que_apareceu += 1;
    ja_contou_esta_aparicao = true; // Trava a contagem para não somar infinitamente
}

// 2. Reseta a trava quando o balão fechar totalmente
if (balao_escala <= 0) {
    ja_contou_esta_aparicao = false;
    
    // 💥 Se ele fechou e já cumpriu as 3 aparições, se destrói!
    if (vezes_que_apareceu >= 3) {
        instance_destroy();
    }
}