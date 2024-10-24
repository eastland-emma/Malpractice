/// @description Insert description here
// Set script to the intro one- other objects will set this script to their own scripts as the current script finishes
global.script_name = "nadia_script.txt";

// Create a prescription manager to track everyones current and past prescriptions
global.prescription_manager = new PrescriptionManager();


// Create a global array of patients so we refer to the same one every time
// Create a nadia instance and place it into an array so we can control it 
global.patients = [];
array_push(global.patients,instance_create_depth(0, 800, 100, obj_patient0));
array_push(global.patients,instance_create_depth(0, 800, 100, obj_patient1));

//Make the textbox a global for easy manuveurability
global.textbox = instance_create_depth(0,0,0, obj_text_box);
global.textbox.visible = false;
global.textbox.persistent = true;

