show_input = false;
input_timer = 0;
input_frame = 0;
resultado_correto = "7";
raio = 40;
mostrar_monitor = false;
input_texto = "";
resolvido = false;
escala = 0;
escala_alvo = 5;
maquina_ativada = false;
mostrar_aviso_cartao = false;
// Variáveis do mouse
puzzle_cartao_aberto = false;
cartao_x = 0;
cartao_y = 0;
segurando_cartao = false;
cor_feedback = c_white;
// ... mantenha as suas outras variáveis do Create ...

monitor_ja_apareceu = false; // Garante que a conta matemática só aconteça uma vez
gerar_conta = function() {
    var num1 = irandom_range(1, 10);
    var num2 = irandom_range(1, 10);
    var tipos = ["+", "-", "*", "/"];
    var tipo = tipos[irandom(3)];

    switch(tipo) {
        case "+":
            resultado_correto = string(num1 + num2);
            pergunta_texto = string(num1) + " + " + string(num2);
            break;
        case "-":
            // Garante que o resultado não seja negativo (para crianças)
            var maior = max(num1, num2);
            var menor = min(num1, num2);
            resultado_correto = string(maior - menor);
            pergunta_texto = string(maior) + " - " + string(menor);
            break;
        case "*":
            resultado_correto = string(num1 * num2);
            pergunta_texto = string(num1) + " x " + string(num2);
            break;
        case "/":
            // Garante que a divisão seja exata e fácil
            var mult = num1 * num2; 
            resultado_correto = string(num1);
            pergunta_texto = string(mult) + " / " + string(num2);
            break;
    }
}