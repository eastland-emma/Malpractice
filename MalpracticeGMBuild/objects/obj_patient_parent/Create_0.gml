/// @description  initializes objects for movement
persistent = true;
direction = 330;
speed = 0;

leave_pharmacy = function()
{
	//Cure any remaining symptoms
	global.prescription_manager.attempt_prescribe(instance_create_depth(0,0,0, obj_cureall));
	//Make the memento visible
	global.patient_mementos[patient_id].visible = true;
	//lose patient
	lost = true;
}
