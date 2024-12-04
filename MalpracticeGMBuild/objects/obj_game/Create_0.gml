/// @description Insert description here
global.script_name = "nadia_script.txt";
// Create a prescription manager to track everyones current and past prescriptions
global.prescription_manager = new PrescriptionManager();
global.selected_medications = [];
global.all_medications = [obj_alprazolam,obj_cetirizine, obj_enobosarm,obj_escitalopram, obj_ligandrol,obj_loratadine, obj_lorazepam, obj_methandrostenolone, obj_modafinil,obj_montelukast,obj_propranolol,obj_testosterone_cypionate,obj_meclizine,obj_ondansetron,obj_acetazolamide,obj_atorvastatin,obj_doxepin,obj_doxycycline,obj_loperamide,obj_pilocarpine,obj_lithium, obj_sumatriptan, obj_cureall];//Add in more medications as they are made
global.day_active = false; //True if player should be allowed to switch screens and prescribe medications
global.start_day = false; //when start day is true, sends first patient out, then is automatically changed back to false.
//Holds a single instance of each patient so they aren't constantly created and deleted
global.all_patients = [];
//Tracks number of days started
global.day_num = 0;
global.patients_seen = 0;
global.prescriptions_given = 0;
global.symptom = "none";
global.symptom_box = instance_create_depth(400, 900, 0, obj_symptom_box);
global.medicine_lookups = 0;
global.score = 0;
global.display_score = false;
global.correct_prescriptions_given = 0;
//Holds a single instance of each character's memento item.
global.patient_mementos = [];
global.memento_screen = instance_create_depth(690,70,0,obj_memento_screen);
//Used for the final end game screen
global.total_score=0;
global.total_prescriptions_given = 0;
global.total_patients_seen = 0;

//create all patient objects once at the start, use same objects for the whole game
array_push(global.all_patients,instance_create_depth(-400, 800, 100, obj_patient0));
array_push(global.all_patients,instance_create_depth(-400, 800, 100, obj_patient1));
array_push(global.all_patients,instance_create_depth(-400, 800, 100, obj_patient2));
array_push(global.all_patients,instance_create_depth(-400, 800, 100, obj_patient3));
array_push(global.all_patients,instance_create_depth(-400, 800, 100, obj_patient4));

array_push(global.patient_mementos,instance_create_depth(150, 875, -100, obj_memento_nadia));
array_push(global.patient_mementos,instance_create_depth(450, 875, -100, obj_memento_aria));
array_push(global.patient_mementos,instance_create_depth(750, 875, -100, obj_memento_gretsch));
array_push(global.patient_mementos,instance_create_depth(1050, 875, -100, obj_memento_max));
array_push(global.patient_mementos,instance_create_depth(1350, 875, -100, obj_memento_filmore));

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
	var patients_lost =0;
	//Check to see if all characters left
	for(var i =0; i<array_length(global.all_patients);i++)
	{
		if(global.all_patients[i].lost)
			patients_lost++;
	}
	if(patients_lost >= 5)
	{
		finish_game();
	}
	else
	{
		//set up the next day
		global.symptom_box.visible = false;
		instance_create_depth(400, 100, 0, obj_results_box)
		global.day_num += 1;
		global.day_active = false;
		global.display_score = false;
		//play an animation or have a results screen showing day is complete and progress or something.
	
		//start the next day.
	 
		prep_day(); 
	
		//global.start_day = true;
	}
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
		//for(var j = 0; j < array_length(files); j++)
		//{
		//	var _file = files[j];
		//	ds_queue_enqueue(global.scripts, _file);
		//}
		//Line 2 contains patient ids
		ids = string_split(strings[1], " ");
		for(var j = 0; j < array_length(ids); j++)
		{
			if(global.all_patients[real(ids[j])].lost)
			{
				show_debug_message("patient " + string(ids[j]) + " has been lost and won't be included today.");
				continue;
			}
			
			global.all_patients[real(ids[j])].image_index = 0;
			
			//add scripts and patient only if patient hasn't been lost
			var _file = files[j];
		  	ds_queue_enqueue(global.scripts, _file);
				
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
				case 3:
					ds_queue_enqueue(global.patients,global.all_patients[3]);
					break;
				case 4:
					ds_queue_enqueue(global.patients,global.all_patients[4]);
					break;
				case -1:
					ds_queue_enqueue(global.patients,global.all_patients[irandom(4)]);
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
			if (!global.all_patients[i].lost)
				ds_queue_enqueue(global.patients, global.all_patients[i]);
			ds_queue_enqueue(global.scripts, "default_ask.txt");
		}
		global.selected_medications = []; //use all medications (med controller handles this)
		
	}
	
	//load first patient
	global.current_patient = ds_queue_dequeue(global.patients);
	//load first character script into text box
	global.textbox.load_new_script(ds_queue_dequeue(global.scripts), global.current_patient.patient_id);
}

function play_patient_audio()
{
	switch(global.current_patient.patient_id)
	{
		case 0:
			audio_play_sound(snd_nadia_arrive, 1,false);
			break;
		case 1:
			audio_play_sound(snd_aria_arrive, 1,false);
			break;
		case 2:
			audio_play_sound(snd_gretsch_arrive, 1,false);
			break;
		case 3:
			audio_play_sound(snd_max_arrive, 1,false);
			break;
		case 4:
			audio_play_sound(snd_filmore_arrive, 1,false);
			break;	
	}
}
function finish_game()
{
	instance_create_depth(15, 15, 0, obj_end_screen_);
	
}
prep_day();
//instance_create_depth(400, 100, 0, obj_results_box)  //for testing
