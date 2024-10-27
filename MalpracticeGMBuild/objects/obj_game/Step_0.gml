/// @description Insert description here
// You can write your code in this editor
if(global.start_day) //start the first patient walking out
{
	global.start_day = false;
	global.current_patient.speed = 5;
	global.current_patient.entering_screen = true;
	global.day_active = true;
}

if(global.current_patient.finished)
{
	global.day_active = false;
	show_debug_message("patient finished \n");
	patient_num += 1;
	if(patient_num >= array_length(global.patients)) //all patients have been seen
		finish_day();
	else
	{
		global.current_patient = global.patients[patient_num];
		global.current_patient.speed = 5;
		global.current_patient.entering_screen = true;
	}
}