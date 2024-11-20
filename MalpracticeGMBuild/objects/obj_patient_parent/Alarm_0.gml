/// @description 'respawn' and begin moving
speed = 5;
direction = 330;


x = -300;
y = 800;
oscillating_count=0;

entering_screen = true;
spawn_textbox = true;
is_up = true;
	
image_index = 0;
visible = true;

global.textbox.load_new_script(global.script_name, -1);