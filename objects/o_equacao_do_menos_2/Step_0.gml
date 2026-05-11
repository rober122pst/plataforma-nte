// 1. Garante que as variáveis existam (Segurança)
if (!variable_instance_exists(id, "num1")) num1 = "?";
if (!variable_instance_exists(id, "num2")) num2 = "?";

// 2. Lógica de Vitória (Opcional)
// Se os dois números já foram preenchidos, vamos checar o resultado
if (num1 != "?" && num2 != "?") {
    
    // Converte os textos para números reais para fazer o cálculo
    var valor1 = real(num1);
    var valor2 = real(num2);
    
    // Checa se a conta (valor1 - valor2) é igual a 2
    if (valor1 - valor2 == 2) {
        // AQUI VOCÊ COLOCA O QUE ACONTECE QUANDO GANHA
        // Exemplo: Abrir uma porta, tocar um som ou mudar de cor
        image_blend = c_lime; // Fica verde pra mostrar que acertou!
    } else {
        // Se a conta estiver errada
        image_blend = c_white; 
    }
}