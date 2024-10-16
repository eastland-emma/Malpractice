/// @description Insert description here
audio_play_sound(snd_mouse_click,0,false);
if (dialogue.count() > 0){
	display_next_dialogue();
}
else{
	visible = false;
}