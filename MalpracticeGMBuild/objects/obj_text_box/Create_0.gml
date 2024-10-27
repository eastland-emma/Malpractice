persistent = true;
dialogue = new Dialogue();
x = 60;
y = 60;

event_inherited();

function load_new_script(_filename)
{
	//clear dialouge
	dialogue = new Dialogue();
	//Load file
	text = buffer_load(_filename);
	//Split file on the new lines
	show_debug_message(_filename);
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
			//Check for a variable in the text
			if(string_char_at(_word, 0) == "*")
			{
				_word = global.current_patient.current_symptom;
			}
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

display_next_dialogue = function()
{
	make_visible();
	draw_text_reset();
	current_dialogue = dialogue.pop();
}


function make_visible()
{
	//if conditions are met, make visible
	visible = true;
}
function make_invisible()
{
	//if conditions are met, make invisible
	visible = false;
}
//load_new_script(global.script_name);