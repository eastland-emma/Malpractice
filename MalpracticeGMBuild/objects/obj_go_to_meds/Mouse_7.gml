/// @description Move to the oposite room on left click
// You can write your code in this editor
if(global.current_patient.entering_screen || !global.day_active)
	return;
room_goto_next();
global.textbox.make_invisible();
	