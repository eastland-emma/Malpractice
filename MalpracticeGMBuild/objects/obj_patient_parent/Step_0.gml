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
	
if (x >= 700 && speed > 0)
	speed -= .05;
