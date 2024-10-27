/// @description Insert description here
// You can write your code in this editor
global.med_info = {name: "Select medicine", 
				   info: "Hover for more details, click the medication to prescribe."};
prev_med_info = "start";
current_description = "start";
current_meds = []; //this is the list of medication objects that is actually going to be spawned.

///@description adds all possible medications to the selected medications array
function all_medication()
{
	for(var i=0; i < array_length(global.all_medications); i++)
		array_push(current_meds, global.all_medications[i]);
}

///@description Spawns all medications in the selected_medications array
function spawn_medications()
{
	var length = array_length(current_meds);
	var _x = 150;
	var _y = 125;
	for(var i = 0; i < length; i++)
	{
		instance_create_depth(_x, _y, 1, (current_meds[i]));
		_x += 150;
		if(_x >= 1101)
		{
			_x =150;
			_y += 135;
		}
	}
}

///@description turns strings into obj_game objects and prepares them to be spawned
function prep_medications()
{
	//turn all medication list into actual off screen instances so names can be
	//compared with strings from the file parsing
	med_instances = [];
	if(array_length(global.selected_medications) < 1)
	{
		current_meds = global.all_medications;
	}
		
	for(i = 0; i < array_length(global.all_medications); i++)
	{
		cur_med = instance_create_depth(-500, -500, 1, (global.all_medications[i]));
		array_push(med_instances, cur_med)
	}
	
	//compare medication names specified in file, and add matches into list to be spawned.
	for(var i=0; i < array_length(global.selected_medications); i++)
	{
		for(var j=0; j < array_length(med_instances); j++)
		{
			cur_med = med_instances[j];
			if(cur_med.medication_name == global.selected_medications[i])
				array_push(current_meds, global.all_medications[j]);				
		}
	}
}

prep_medications()
spawn_medications();


event_inherited();