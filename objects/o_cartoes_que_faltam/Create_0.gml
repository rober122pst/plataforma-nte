// Define a fonte que você já usa no jogo
fonte_texto = font_sila;

// Controladores da animação do balão
balao_escala = 0;         // Começa em 0 (invisível)
velocidade_animacao = 0.1; // Velocidade do surgimento

// Guarda qual máquina específica o player se aproximou
maquina_alvo = noone;
// ... (mantenha as outras variáveis que você já tem no Create: fonte_texto, balao_escala, velocidade_animacao, maquina_alvo)

// 🔢 Controladores de repetição do balão
vezes_que_apareceu = 0;       // Começa em zero
ja_contou_esta_aparicao = false; // Evita que o jogo conte +1 a cada frame que ele fica aberto