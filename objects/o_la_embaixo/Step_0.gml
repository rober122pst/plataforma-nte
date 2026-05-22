if (tempo > 50) {
    if (image_alpha < 1) image_alpha += 0.05;
} 
else {
    if (image_alpha > 0) {
        image_alpha -= 0.02; 
    }
}
if (tempo > 0) {
    tempo -= 1;
} else {
    instance_destroy();
}