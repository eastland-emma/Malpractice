/// @description Insert description here
// You can write your code in this editor

///@description 
function prescribe(patient, medication){
    //Place the most recently prescribed into the queue and remove the oldest one if we have more than 5 medications
    ds_queue_enqueue(patient.previous_prescriptions, patient.current_prescription);
    if(ds_queue_size(patient.previous_prescriptions)>5)
        ds_queue_dequeue(patient.previous_prescriptions);

    patient.current_prescription = medication;
}

direction = 330;
speed = 5;