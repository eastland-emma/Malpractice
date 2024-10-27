/// @description Insert description here
// Set script to the intro one- other objects will set this script to their own scripts as the current script finishes
global.script_name = "nadia_script.txt";
// Create a prescription manager to track everyones current and past prescriptions
global.prescription_manager = new PrescriptionManager();
global.selected_medications = [];
global.all_medications = [obj_alprazolam,obj_cetirizine, obj_enobosarm,obj_escitalopram, obj_ligandrol,obj_loratadine, obj_lorazepam, obj_methandrostenolone, obj_modafinil,obj_montelukast,obj_propranolol,obj_testosterone_cypionate,obj_meclizine,obj_ondansetron];//Add in more medications as they are made
global.day_active = false; //True if player should be allowed to switch screens and prescribe medications
global.start_day = true; //when start day is true, sends first patient out, then is automatically changed back to false.




if(day_num == 0)
{
	instance_create_depth(920, 540, 0, obj_tutorial_text_box);
	global.start_day = false;
}

function finish_day()
{
	show_debug_message("day complete");
	
	//set up the next day
	day_num += 1;
	//play an animation or have a results screen showing day is complete and progress or something.
	
	//start the next day.
	 
	//prep_day(); 
	
	//global.start_day = true;
}

function prep_day()
{
	// Create a global array of patients so we refer to the same one every time
	global.patients = [];
	patient_num = 0;
	global.scripts = [];
	var todaysFilename = "day" + string(day_num) + ".txt";
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
				array_push(global.patients,instance_create_depth(-400, 800, 100, obj_patient0));
				break;
			case 1:
				array_push(global.patients,instance_create_depth(-400, 800, 100, obj_patient1));
				break;
			default:
				break;
		}
	}
	//Line 3 controlling meds that spawn
	meds = string_split(strings[2], " ");
	global.selected_medications = meds;
	//show_debug_message("these are the meds" + str(global.selected_medications);
	
	global.textbox = instance_create_depth(0,0,0, obj_text_box);
	global.textbox.make_invisible();
	global.current_patient = global.patients[patient_num];
}

prep_day();