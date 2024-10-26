/// @description Insert description here
audio_play_sound(snd_mouse_click,0,false);
//Check if we need to move rooms

if (dialogue.count() > 0){
	display_next_dialogue();
}
else
{
	global.tutorial_over = true;
	instance_destroy(self);
}