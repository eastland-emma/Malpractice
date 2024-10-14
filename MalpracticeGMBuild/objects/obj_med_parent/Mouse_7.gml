/// @description On-click behavior for all medications

//prescribe self to patient (nadia for now)
global.prescription_manager.prescribe(0, self);
//Return to the patient
room_goto_previous();
global.prescription_manager.accept_medication(global.patients[0]);
//Allow the textbox to move to it's next dialogue
global.textbox.display_next_dialogue();
