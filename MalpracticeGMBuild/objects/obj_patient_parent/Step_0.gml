/// @description Insert description here
// You can write your code in this editor

if(is_up)
{
	direction += 2;
}
else
{
	direction -= 2;
}

if(oscillating_count > 30)
{
	is_up = !(is_up);
	oscillating_count = 0;
}

oscillating_count++;

//direction += 2;
//if(direction > 390)
//	direction = 330;
	
if (x >= 900 && speed > 0)
	speed -= .05;
	
if (speed == 0 && spawn_textbox){
	spawn_textbox = false;
	instance_create_depth(0,0,0, obj_text_box);
}
if(room != room_first)
{
	visible=false;
}
else
visible = true;
