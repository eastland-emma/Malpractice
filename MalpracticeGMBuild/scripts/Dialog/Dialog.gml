///@description Driver object for the Dialogue system
function Dialogue() constructor
{
	//Hold future dialog
	queued_dialog = [];
	
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
		return _temp;
	}
	
	//lets you check the number of values in the script
	count = function()
	{
		return array_length(queued_dialog);
	}

}