/// @description Insert description here
// You can write your code in this editor
if(global.current_patient.finished == true){
	show_debug_message("patient finished \n");
	patient_num += 1;
	global.current_patient = global.patients[patient_num];
	global.current_patient.speed = 5;
	global.current_patient.entering_screen = true;
}