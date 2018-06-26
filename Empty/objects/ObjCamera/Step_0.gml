x = lerp(x,Xto,0.1);
y = lerp(y,Yto,0.1);


if(!instance_exists(SelectedObj))
{
	SelectedObj = noone;
}

//Zoom += (mouse_wheel_up() - mouse_wheel_down())
if(mouse_wheel_up())
{
	var Oz = Zoom;
	Zoom *= (.9 * mouse_wheel_up());
}
if(mouse_wheel_down())
{
	var Oz = Zoom;
	Zoom *= (1.1 * mouse_wheel_down());
}
Zoom = clamp(Zoom,.08,4);

if(mouse_check_button_pressed(mb_middle) and !Grabbed)
{
	Grabbed = true;
	GrabX = window_mouse_get_x()
	GrabY = window_mouse_get_y()
	SelectedObj = noone
}

if(Grabbed)
{
	//x = GrabX - (window_mouse_get_x())// - GrabX);
	//y = GrabY - (window_mouse_get_y())// - GrabY);
	x = Xto - ((window_mouse_get_x() - GrabX )) * Zoom;
	y = Yto - ((window_mouse_get_y() - GrabY )) * Zoom;
}

if(mouse_check_button_released(mb_middle))
{
	Grabbed = false;
	Xto = x
	Yto = y
}



if(SelectedObj!=noone)
{
	var NewW = global.ViewW * Zoom;
	var NewH = global.ViewH * Zoom;
	
	Xto = SelectedObj.x + (NewW - global.ViewW) * 0.5 - global.ViewW*(Zoom/2)//*Zoom
	Yto = SelectedObj.y + (NewH - global.ViewH) * 0.5 - global.ViewH*(Zoom/2)//*Zoom
}


camera_set_view_pos(view_camera[0], x,y);


var NewW,NewH,ShftX,ShftY;

NewW = global.ViewW * Zoom;
NewH = global.ViewH * Zoom;


ShftX = camera_get_view_x(view_camera[0]) - (NewW - global.ViewW) * 0.5;
ShftY = camera_get_view_y(view_camera[0]) - (NewH - global.ViewH) * 0.5;

camera_set_view_size(view_camera[0],NewW,NewH);


camera_set_view_pos(view_camera[0], ShftX,ShftY);


global.MouseX = camera_get_view_x(view_camera[0]) + window_mouse_get_x()*Zoom;//window_mouse_get_x();
global.MouseY = camera_get_view_y(view_camera[0]) + window_mouse_get_y()*Zoom;


