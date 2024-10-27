/// @description Move to the oposite room on left click
// You can write your code in this editor
if(!global.day_active)
	return;
room_goto_previous();
global.textbox.make_visible();
	