// 1. Reseta o tempo da seta no o_gui (para ela sumir)
if (instance_exists(o_gui)) {
    o_gui.tempo_para_ajuda = 0;
    o_gui.mostrar_seta = false;
}

// 2. Destrói a sílaba
instance_destroy();