state();

var _inputs = [
    EQUIP_1,
    EQUIP_2,
    EQUIP_3,
    EQUIP_4,
];

for (var i = 0; i < array_length(_inputs); i++) {
    if (_inputs[i] && inventory[i] != -1) {
        equiped = i;
        break;
    }
}