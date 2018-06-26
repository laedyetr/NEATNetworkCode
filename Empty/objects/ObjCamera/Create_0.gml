
Cam = camera_create();


global.ViewW = 1024;
global.ViewH = 768;

camera_set_view_size(view_camera[0],global.ViewW,global.ViewH);
display_set_gui_size(global.ViewW,global.ViewH);

Zoom = 0.5;
Grabbed = false;
GrabX = x
GrabY = y
x-=global.ViewW / 2;
y-=global.ViewH / 2;

var Vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0)

var Pm = matrix_build_projection_ortho(global.ViewW,global.ViewH,1,32000)

camera_set_view_mat(Cam,Vm);
camera_set_proj_mat(Cam,Pm);

view_camera[0] = Cam;


SelectedObj = noone

Xto = x+32;
Yto = y;

global.MouseX = 0;
global.MouseY = 0;