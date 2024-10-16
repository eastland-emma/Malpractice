/// @description Move to the oposite room on left click
// You can write your code in this editor
global.textbox.visible=false;
if(room = room_first)
{
	image_index = 1;
	x = 200;
	room_goto_next();
}
else
{
	image_index = 0;
	x = 1720;
	room_goto_previous();
}
	