/// @description Insert description here
// You can write your code in this editor

global.selected_medications = [];
global.all_medications = [obj_alprazolam,obj_cetirizine, obj_enobosarm,obj_escitalopram, obj_ligandrol,obj_loratadine, obj_lorazepam, obj_methandrostenolone, obj_modafinil,obj_montelukast,obj_propranolol,obj_testosterone_cypionate];//Add in more medications as they are made
global.med_info = {name: "default", 
				   info: ""};
function select_medication(_selected, _all)
{
	for(var i=0; i < array_length(_all); i++)
		array_push(_selected, _all[i]);
}

///@description initializes medications to shelves in an orderly way.
function spawn_medications(_selected)
{
	var length = array_length(_selected);
	var _x = 200;
	var _y = 175;
	for(var i =0; i < length; i++)
	{
		instance_create_depth(_x, _y, 1, _selected[i]);
		_x += 150;
		if(_x >= 601)
		{
			_x =200;
			_y += 200;
		}
	}
}

select_medication(global.selected_medications, global.all_medications);
spawn_medications(global.selected_medications);
