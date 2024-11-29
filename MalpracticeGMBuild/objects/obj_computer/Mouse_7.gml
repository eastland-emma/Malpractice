/// @description do computer things on click
audio_play_sound(snd_mouse_click,0,false);
if (global.current_med == noone) //if no med has been selected, do nothing
	return;
if (global.current_med.looked_up == true or !global.day_active) //if med has already been looked up, or day isn't active, don't do anything
	return;
else
{
	global.score -= 20;
	audio_play_sound(snd_lookup,0,false);
	global.current_med.look_up();
	global.medicine_lookups++;
}

//var current_med = instance_create_depth(-150, -150, 0,obj_alprazolam);
//switch(global.med_info.name)
//{
//	case("Alprazolam"):
//		break;
//	case("Cetrizine"):
//		instance_destroy(current_med);
//		current_med = instance_create_depth(-150, -150, 0,obj_cetirizine);
//		break;
//	case("Enobosarm"):
//		instance_destroy(current_med);
//		current_med = instance_create_depth(-150, -150, 0,obj_enobosarm);
//		break;
//	case("Escitalopram"):
//		instance_destroy(current_med);
//		current_med = instance_create_depth(-150, -150, 0,obj_escitalopram);
//		break;
//	case("Ligandrol"):
//		instance_destroy(current_med);
//		current_med = instance_create_depth(-150, -150, 0,obj_ligandrol);
//		break;
//	case("Loratadine"):
//		instance_destroy(current_med);
//		current_med = instance_create_depth(-150, -150, 0,obj_loratadine);
//		break;
//	case("Lorazepam"):
//		instance_destroy(current_med);
//		current_med = instance_create_depth(-150, -150, 0,obj_lorazepam);
//		break;
//	case("Meclizine"):
//		instance_destroy(current_med);
//		current_med = instance_create_depth(-150, -150, 0,obj_meclizine);
//		break;
//	case("Methandrostenolone"):
//		instance_destroy(current_med);
//		current_med = instance_create_depth(-150, -150, 0,obj_methandrostenolone);
//		break;
//	case("Modafinil"):
//		instance_destroy(current_med);
//		current_med = instance_create_depth(-150, -150, 0,obj_modafinil);
//		break;
//	case("Montelukast"):
//		instance_destroy(current_med);
//		current_med = instance_create_depth(-150, -150, 0,obj_montelukast);
//		break;
//	case("Ondansetron"):
//		instance_destroy(current_med);
//		current_med = instance_create_depth(-150, -150, 0,obj_ondansetron);
//		break;
//	case("Propranolol"):
//		instance_destroy(current_med);
//		current_med = instance_create_depth(-150, -150, 0,obj_propranolol);
//		break;
//	case("Testos. cypionate"):
//		instance_destroy(current_med);
//		current_med = instance_create_depth(-150, -150, 0,obj_testosterone_cypionate);
//		break;
//	default:
//		break;
//}
//global.med_info.info ="Treats:" + string(current_med.treats_symptoms) +"/nCauses:"+string(current_med.causes_symptoms);
//global.

