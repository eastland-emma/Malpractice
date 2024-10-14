/// @description Move to the oposite room on left click
// You can write your code in this editor
global.textbox.visible=false;
if(room = room_first)
{
	room_goto_next();
	image_xscale = -1;
	x = 200;
}
else
{
	room_goto_previous();
	image_xscale = 1;
	x = 1720;
}
	