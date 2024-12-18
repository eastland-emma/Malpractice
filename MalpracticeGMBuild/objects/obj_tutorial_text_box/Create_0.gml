/// @description Create textbox and load tutorial script
// You can write your code in this editor
persistent = true;

// Inherit the parent event
event_inherited();//Text scrolling stuff
current_dialogue = "";
dialogue = new Dialogue();
//Spawn position
x = 60;
y = 60;

///@description Loads a new script and formats it to fit the tutorial textbox
load_new_script = function(_filename)
{
	//Load file
	text = buffer_load(_filename);
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
			if(string_length(_word) + _line_count > max_line_size)
			{
				_printable_text += "\n";
				_line_count = 0;
			}
			_line_count += string_length(_word) + 1;
			_printable_text += _word + " ";
		}
		strings[i] = _printable_text;
	}

	for(var i = 0; i < lines; i++)
	{
		dialogue.add(strings[i]);
	}
	current_dialogue = dialogue.pop();
}

load_new_script("tutorial.txt"); 

///@description tutorial function that pulls the next dialogue from the top of the dialogue queue and interprets some flags
display_next_dialogue = function()
{
	visible = true;
	current_dialogue = dialogue.pop();
	if(string_char_at(current_dialogue,0) =="-")
	{
		handle_tutorial_move(-1);
	}
	if(string_char_at(current_dialogue,0) =="+")
	{
		handle_tutorial_move(1);
	}
	draw_text_reset();
}



///@description handles movement between front and backroom for seamless navigation in tutorial
handle_tutorial_move = function(_direction_of_move)
{
	if(_direction_of_move >= 1)
		room_goto_next();
	if(_direction_of_move <= -1)
		room_goto_previous();
	display_next_dialogue();
		
}