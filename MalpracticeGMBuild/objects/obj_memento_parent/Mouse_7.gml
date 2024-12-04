/// @description Insert description here
// You can write your code in this editor
if(!visible)
	return;
global.memento_screen.old_memento_name = global.memento_screen.memento_name;
global.memento_screen.memento_name = item_name;
global.memento_screen.memento_desc = description;

if(global.memento_screen.memento_name == global.memento_screen.old_memento_name)
	global.memento_screen.visible = !global.memento_screen.visible;
	
switch(patient_num)
	{
	case 0:
		global.memento_screen.sprite_index = spr_textbox_nadia;
		break;
	case 1:
		global.memento_screen.sprite_index = spr_textbox_gretsch;
		break;
	case 2:
		global.memento_screen.sprite_index = spr_textbox_aria;
		break;
	case 3:
		global.memento_screen.sprite_index = spr_textbox_max
		break;
	case 4:
		global.memento_screen.sprite_index = spr_textbox_filmore;
		break;
	}
