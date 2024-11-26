/// @description Hover behavior for medications

//Display medication info to screen
audio_play_sound(snd_pill_hover, 0, false)
if (!looked_up)
{
	global.med_info = {name: medication_name,
					   info: medication_info};
}
else
{
	global.med_info = {name: medication_name,
					   info: symptoms_string};
}
global.current_med = self;
	
