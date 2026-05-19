// 1. Efeito de Entrada (Fade-in)
// Se o tempo ainda for maior que 50, ele foca em aparecer
if (tempo > 50) {
    if (image_alpha < 1) image_alpha += 0.05;
} 

// 2. Efeito de Saída (Fade-out)
// Quando faltarem apenas 50 frames, ele começa a sumir
else {
    if (image_alpha > 0) {
        image_alpha -= 0.02; // Diminui a transparência aos poucos
    }
}

// 3. Lógica de seguir o o_player (Mantenha como está)
if (instance_exists(o_player)) {
    angulo += 0.2;//velocidade da angulação
    var alvo_x = o_player.x + lengthdir_x(60, angulo);
    var alvo_y = o_player.y + lengthdir_y(30, angulo) - 20;
    x = lerp(x, alvo_x, 1);
    y = lerp(y, alvo_y, 0.1);
}

// 4. Contagem de vida e destruição final
if (tempo > 0) {
    tempo -= 1;
} else {
    // Só destrói o objeto de fato quando o tempo zerar
    instance_destroy();
}