// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
///@description Driver object for the Dialogue system
function Dialogue() constructor
{
	queued_dialog = [];
	
	add = function( _text)
	{
		array_push(queued_dialog,_text);
	}
	
	pop = function()
	{
		var _temp = array_first(queued_dialog);
		array_delete(queued_dialog, 0, 1);
		return _temp;
	}
		
	count = function()
	{
		return array_length(queued_dialog);
	}

}