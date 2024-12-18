/// @description Either autocomplete if text is scrolling, or move on to the next dialogue
audio_play_sound(snd_mouse_click,0,false);

if (scrolling)
{
	scrolling = false;
	return;
}
//If tutorial not completed, show next dialogue
if (dialogue.count() > 0){
	display_next_dialogue();
	scrolling = true;
}
else//otherwise set up for the first day 
{
	global.start_day = true;
	global.display_score = true;
	instance_destroy(self);
}