/// @description Insert description here
// You can write your code in this editor
previous_prescriptions = new ds_queue();

///@description 
function prescribe(obj_patient_parent, obj_medication){
	//Place the most recently prescribed into the queue and remove the oldest one if we have more than 5 medications
	ds_queue_enqueue(obj_patient_parent.previous_prescriptions, obj_patient_parent.current_prescription);
	if(ds_queue_size(obj_patient_parent.previous_prescriptions)>5)
		ds_queue_dequeue(obj_patient_parent.previous_prescriptions);
		
	current_prescription = obj_medication;
}