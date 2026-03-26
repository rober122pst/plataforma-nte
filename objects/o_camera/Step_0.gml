if (!instance_exists(target)) exit;

var base_w = width;
var base_h = height;

cam_zoom = lerp(cam_zoom, zoom_target, 0.03);

var cam_w = base_w * cam_zoom;
var cam_h = base_h * cam_zoom;

x = lerp(x, target.x, 0.1);
y = lerp(y, target.y - cam_h/4, 0.1);

camera_set_view_size(cam, cam_w, cam_h);

camera_set_view_pos(
    cam,
    clamp(x - cam_w / 2, 0, room_width  - cam_w),
    clamp(y - cam_h / 2, 0, room_height - cam_h)
);