/// @description Insert description here
audio_play_sound(snd_mouse_click,0,false);
//Check if we need to move rooms
if (scrolling)
{
	//show_debug_message("scrolling set false in textbox");
	scrolling = false;
	return;
}
if (dialogue.count() > 0){
	show_debug_message("scrolling set true in textbox");
	display_next_dialogue();
	scrolling = true;
}
else
{
	global.start_day = true;
	instance_destroy(self);
}