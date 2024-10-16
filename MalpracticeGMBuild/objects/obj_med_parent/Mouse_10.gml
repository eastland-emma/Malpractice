/// @description Hover behavior for medications

//Display medication info to screen
audio_play_sound(snd_pill_hover, 0, false)
global.med_info = {name: medication_name,
				   info: medication_info};