/// @description Insert description here
// You can write your code in this editor
if(global.start_day) //start the first patient walking out
{
	global.start_day = false;
	global.current_patient.speed = 5;
	global.current_patient.entering_screen = true;
	global.day_active = true;
}

if(global.current_patient.finished)
{
	//freeze controls when patient is leaving
	global.day_active = false;
	global.current_patient.finished = false;
	show_debug_message("patient finished \n");
	if(ds_queue_empty(global.patients)) //all patients have been seen
		finish_day();
	else
	{
		//global.textbox.load_new_script(ds_queue_dequeue(global.scripts));
		global.current_patient = ds_queue_dequeue(global.patients);
		global.textbox.load_new_script(ds_queue_dequeue(global.scripts));
		if(global.current_patient.patient_id == 0)
		{
			object_set_sprite(obj_text_box, spr_textbox_nadia);
			global.textbox.image_xscale =10;
			global.textbox.image_yscale =10;
		}
		else
		{
			object_set_sprite(obj_text_box, spr_textbox);
			global.textbox.image_xscale =1;
			global.textbox.image_yscale =1;
		}
		global.current_patient.speed = 5;
		global.current_patient.entering_screen = true;
	}
}