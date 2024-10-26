/// @description Insert description here
if((room != room_first) || !visible)
{
	return;
}
audio_play_sound(snd_mouse_click,0,false);
if (dialogue.count() > 0){
	display_next_dialogue();
}
else{
	make_invisible();
}