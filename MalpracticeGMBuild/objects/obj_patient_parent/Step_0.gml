/// @description Draw the character moving across the screen as appropriate 

//Control up & down movement
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


if(entering_screen)//If entering the screen
{
	if (x >= 900 && speed > 0)
		speed -= .05;
	
	//wait until she stops and spawn the textbox
	if (speed == 0 && spawn_textbox){
		spawn_textbox = false;
		global.textbox.visible=true;
		//instance_create_depth(0,0,0, obj_text_box);
		//make arrow visible
		inst_5DB312C8.visible = true;
	}

}
else //If leaving the screen
{
	//Speed up slowly
	if (x <= 1300 && speed < 5)
		speed += .05;
	
	//wait until she is offscreen
	if (x > 2300)
	{
		//Prepare for reset
		entering_screen = true;
		speed = 0;
		global.textbox.visible = false;
		//Reset in 2 seconds
		alarm_set(0, 2 * 30);
	}
	
}
//Makes sure patients persist but do not appear in the environment after rooms are changed
	if(room != room_first)
	{
		visible=false;
	}
	else
	{
		visible = true;
	}