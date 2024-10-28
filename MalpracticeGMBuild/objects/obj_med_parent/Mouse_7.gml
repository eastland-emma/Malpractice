/// @description On-click behavior for all medications

if(!global.day_active)
	return;
//prescribe self to patient (nadia for now)
audio_play_sound(snd_pill_prescribe,0,false);
global.prescription_manager.attempt_prescribe(self);
//Return to the patient
room_goto_previous();
