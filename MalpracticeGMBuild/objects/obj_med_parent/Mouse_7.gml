/// @description On-click behavior for all medications

//prescribe self to patient (nadia for now)
global.prescription_manager.prescribe(0, self);

//Return to the patient
room_goto_previous();
