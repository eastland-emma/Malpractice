/// @description Insert description here
global.script_name = "nadia_script.txt";
// Create a prescription manager to track everyones current and past prescriptions
global.prescription_manager = new PrescriptionManager();
global.selected_medications = [];
global.all_medications = [obj_alprazolam,obj_cetirizine, obj_enobosarm,obj_escitalopram, obj_ligandrol,obj_loratadine, obj_lorazepam, obj_methandrostenolone, obj_modafinil,obj_montelukast,obj_propranolol,obj_testosterone_cypionate,obj_meclizine,obj_ondansetron];//Add in more medications as they are made
global.day_active = false; //True if player should be allowed to switch screens and prescribe medications
global.start_day = true; //when start day is true, sends first patient out, then is automatically changed back to false.
global.all_patients = [];
global.day_num = 0;
global.patients_seen = 0;
global.prescriptions_given = 0;
global.symptom = "none";
global.symptom_box = instance_create_depth(400, 900, 0, obj_symptom_box);

//create all patient objects once at the start, use same objects for the whole game
array_push(global.all_patients,instance_create_depth(-400, 800, 100, obj_patient0));
array_push(global.all_patients,instance_create_depth(-400, 800, 100, obj_patient1));
array_push(global.all_patients,instance_create_depth(-400, 800, 100, obj_patient2));

global.textbox = instance_create_depth(0,0,0, obj_text_box);
global.textbox.make_invisible();


if(global.day_num == 0)
{
	instance_create_depth(920, 540, 0, obj_tutorial_text_box);
	global.start_day = false;
}

function finish_day()
{
	show_debug_message("day complete");
	
	//set up the next day
	global.symptom_box.visible = false;
	instance_create_depth(400, 100, 0, obj_results_box)
	global.day_num += 1;
	global.day_active = false;
	//play an animation or have a results screen showing day is complete and progress or something.
	
	//start the next day.
	 
	prep_day(); 
	
	//global.start_day = true;
}

function prep_day()
{
	// Create a global array of patients for the day so we refer to the same one every time
	global.patients = ds_queue_create();
	global.scripts = ds_queue_create();
	var todaysFilename = "day" + string(global.day_num) + ".txt";
	//try to Load day file
	try
	{
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
			ds_queue_enqueue(global.scripts, _file);
		}
		//Line 2 contains patient ids
		ids = string_split(strings[1], " ");
		for(var j = 0; j < array_length(ids); j++)
		{
			switch(ids[j])
			{
				case 0: 
					ds_queue_enqueue(global.patients,global.all_patients[0]);
					break;
				case 1:
					ds_queue_enqueue(global.patients,global.all_patients[1]);
					break;
				case 2:
					ds_queue_enqueue(global.patients,global.all_patients[2]);
					break;
				case -1:
					ds_queue_enqueue(global.patients,global.all_patients[irandom(2)]);
					break;
				default:
					break;
			}
		}
		//Line 3 controlling meds that spawn
		meds = string_split(strings[2], " ");
		global.selected_medications = meds;
	}
	catch(_exception)
	{
		show_debug_message("no file for this day, using default values. Exception was: " + string(_exception));
		global.patients = ds_queue_create(); //use all patients
		for (i = 0; i < array_length(global.all_patients); i++)
		{
			ds_queue_enqueue(global.patients, global.all_patients[i]);
			ds_queue_enqueue(global.scripts, "default_ask.txt");
		}
		global.selected_medications = []; //use all medications (med controller handles this)
		
	}
	global.patients_seen = ds_queue_size(global.patients);
	
	//load first patient
	global.current_patient = ds_queue_dequeue(global.patients);
	//load first character script into text box
	global.textbox.load_new_script(ds_queue_dequeue(global.scripts))
}

prep_day();
//instance_create_depth(400, 100, 0, obj_results_box)  //for testing
