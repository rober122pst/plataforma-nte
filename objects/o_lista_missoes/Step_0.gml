// 🔍 SISTEMA AUTOMÁTICO DE PALAVRAS POR ID DA SALA (SEM AS-PAS E SEM ERROS)
// O GameMaker reconhece direto os nomes das fases do seu Asset Browser.

if (room == rm_fone) {
    palavra_da_fase = "FONE";
} 
else if (room == rm_oculos) {
    palavra_da_fase = "OCULOS"; // Mantido sem acento para a fonte não bugar
} 
else if (room == o_botas) {
    palavra_da_fase = "BOTAS";
} 
else if (room == rm_capa) {
    palavra_da_fase = "CAPA";
}
else {
    palavra_da_fase = "PROCURAR"; // Caso o player esteja no menu ou mapa de testes
}