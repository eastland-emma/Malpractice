/// @description On-click behavior for all medications

if(!global.day_active)
	return;
//prescribe self to patient (nadia for now)
audio_play_sound(snd_pill_prescribe,0,false);
global.prescription_manager.prescribe(0, self);
//Return to the patient
room_goto_previous();
global.prescription_manager.accept_medication(global.current_patient);
//Allow the textbox to move to it's next dialogue
global.textbox.display_next_dialogue();
global.current_patient.exiting_screen = true;
