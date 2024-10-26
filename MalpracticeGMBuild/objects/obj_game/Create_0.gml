/// @description Insert description here
// Set script to the intro one- other objects will set this script to their own scripts as the current script finishes
global.script_name = "nadia_script.txt";

// Create a prescription manager to track everyones current and past prescriptions
global.prescription_manager = new PrescriptionManager();

//Create a flag that lets scripts report if they've finished
global.script_completed = true;

//// Create a global array of patients so we refer to the same one every time
//// Create a nadia instance and place it into an array so we can control it 
//global.patients = [];
//array_push(global.patients,instance_create_depth(0, 800, 100, obj_patient0));
//array_push(global.patients,instance_create_depth(0, 800, 100, obj_patient1));

//Load todays file
global.todaysPatients =[];
var todaysFilename = "day" + _dayNum + ".txt";
	//Load file
	text = buffer_load(todaysFilename);
	//Split file on the new lines
	strings = string_split(buffer_read(text,buffer_string), "\n");
	file_find_close();
	lines = array_length(strings);
	//Process each sentence
	for(var i = 0; i < lines; i++)
	{
		var _line_count = 0;
		words = string_split(strings[i], " ");
		var _printable_text = "";
		for(var j = 0; j < array_length(words); j++)
		{
			var _word = words[j];
			
			
			
			_line_count += string_length(_word) + 1;
			_printable_text += _word + " ";
		}

		strings[i] = _printable_text;
	}


//Make the textbox a global for easy manuveurability
global.textbox = instance_create_depth(0,0,0, obj_text_box);
global.textbox.visible = false;
global.textbox.persistent = true;