if( pode_sumir = 0){
	
	instance_destroy()

}
if (pode_sumir) {
    if (tempo_espera > 0) {
        tempo_espera -= 1; 
    } 
    else {
     
        if (image_alpha > 0) {
            image_alpha -= 0.02; // Velocidade do sumiço (diminua para ser mais lento)
        } else {
            instance_destroy();
        }
    }
}