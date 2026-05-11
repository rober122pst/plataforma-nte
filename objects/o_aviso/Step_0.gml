if (tempo_restante > 0) {
    tempo_restante -= 1;
} else {
    // Quando o tempo acaba, o objeto é excluído
    instance_destroy(); 
    
    // Se você quiser que ele mude de sala em vez de sumir, use:
    // room_goto(NomeDaSuaProximaRoom);
}