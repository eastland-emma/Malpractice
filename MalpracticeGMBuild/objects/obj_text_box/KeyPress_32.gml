/// @description Insert description here
if((room != room_first) || !visible)
{
	return;
}
if (scrolling)
{
	scrolling = false;
	return;
}
audio_play_sound(snd_mouse_click,0,false);
if (dialogue.count() > 0){
	display_next_dialogue();
	scrolling = true;
	if(global.current_patient.patient_id == 3)
	{
		if(global.current_patient.image_index == 1)
			global.current_patient.image_index = 0;
		else
			global.current_patient.image_index = 1;
	}
}
else{
	make_invisible();
	if(_was_final_script)
	{
		_was_final_script = false;
		global.current_patient.leave_pharmacy();
		make_invisible();
	}
}