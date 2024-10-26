/// @description Insert description here
// Set script to the intro one- other objects will set this script to their own scripts as the current script finishes
global.script_name = "nadia_script.txt";
// Create a prescription manager to track everyones current and past prescriptions
global.prescription_manager = new PrescriptionManager();


// Create a global array of patients so we refer to the same one every time
// Create a nadia instance and place it into an array so we can control it 
global.patients = [];
patient_num = 0;
//array_push(global.patients,instance_create_depth(-250, 800, 100, obj_patient0));
//array_push(global.patients,instance_create_depth(-250, 800, 100, obj_patient1));
//Load todays file
global.scripts = [];
var todaysFilename = "day" + string(_dayNum) + ".txt";
	//Load file
	text = buffer_load(todaysFilename);
	//Split file on the new lines
	strings = string_split(buffer_read(text,buffer_string), "\n");
	file_find_close();
	//Process each sentence
	files = string_split(strings[0], " ");
	//Line 1 contains the names of files we need to read in
	for(var j = 0; j < array_length(files); j++)
	{
		var _file = files[j];
		array_push(global.scripts, _file);
	}
	//Line 2 contains patient ids
	ids = string_split(strings[1], " ");
	for(var j = 0; j < array_length(ids); j++)
	{
		switch(ids[j])
		{
			case 0: 
				array_push(global.patients,instance_create_depth(-250, 800, 100, obj_patient0));
				break;
			case 1:
				array_push(global.patients,instance_create_depth(-250, 800, 100, obj_patient1));
				break;
			default:
				break;
		}
	}
	////Line 3 contains medications to provide for the day
	//meds = string_split(strings[2], " ");
	//for(var j = 0; j < array_length(meds); j++)
	//{
	//	switch(ids[j])
	//	{
	//		case 0: 
	//			array_push(global.patients,instance_create_depth(-250, 800, 100, obj_patient0));
	//			break;
	//		case 1:
	//			array_push(global.patients,instance_create_depth(-250, 800, 100, obj_patient1));
	//			break;
	//		default:
	//			break;
	//	}
	//}
global.tutorial_over = true;
if(_dayNum == 0)
{
	instance_create_depth(920, 540, 0, obj_tutorial_text_box);
	global.tutorial_over = false;
}
if(global.tutorial_over == true){
global.current_patient = global.patients[0];
global.current_patient.entering_screen = true;
global.current_patient.speed = 5;

global.textbox = instance_create_depth(0,0,0, obj_text_box);
global.textbox.make_invisible();
global.textbox.persistent = true;
}


