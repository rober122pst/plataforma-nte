if (!fim_ativado) {
    fim_ativado = true;
    
    // Trava o movimento do jogador
    if (instance_exists(o_player)) {
        o_player.pode_mover = false;
        o_player.hspd = 0;
        o_player.vspd = 0;
    }
}