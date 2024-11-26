///@description Driver object for the Dialogue system
function Dialogue() constructor
{
	//Hold future dialog
	queued_dialog = [];
	symptom_reveal = -1;
	
	//Allows new dialog to be added to a script
	add = function( _text)
	{
		array_push(queued_dialog,_text);
	}
	
	//Allows you to access the next dialog
	pop = function()
	{
		var _temp = array_first(queued_dialog);
		array_delete(queued_dialog, 0, 1);
		symptom_reveal--;
		if (symptom_reveal == 0)
		{
			show_debug_message("make box visible");
			symptom_reveal = -1;
			global.symptom_box.visible = true;
		}
		return _temp;
	}
	
	//lets you check the number of values in the script
	count = function()
	{
		return array_length(queued_dialog);
	}
	
	//empties text for the dialouge
	clear = function()
	{
		queued_dialog = [];
	}
	
	set_symptom_reveal = function(reveal)
	{
		symptom_reveal = reveal + 1;
	}

}