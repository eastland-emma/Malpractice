/// @description do computer things on click
audio_play_sound(snd_mouse_click,0,false);
if (global.current_med == noone) //if no med has been selected, do nothing
	return;
if (global.current_med.looked_up == true or !global.day_active) //if med has already been looked up, or day isn't active, don't do anything
	return;
else
{
	global.score -= 20;
	global.total_score -=20;
	audio_play_sound(snd_lookup,0,false);
	global.current_med.look_up();
	global.medicine_lookups++;
}


