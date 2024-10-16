dialogue = new Dialogue();
x = 60;
y = 60;

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
			//Check for a variable in the text
			if(string_char_at(_word, 0) == "*")
			{
				_word = global.patients[0].current_symptom;
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
	visible = true;
	draw_text_reset();
	current_dialogue = dialogue.pop();
}
//#########################################################
 
///     Description:    Draws text scrolling from the first to last character in a string.
///     Usage:          draw_text_scrolling(0, 0, "Hello World", 0.5, 20, undefined)
 
///     @param text x
///     The x position of the text being drawn.
 
///     @param text y
///     The y position of the text being drawn.
 
///     @param text string
///     The text string to be scrolled across the screen.
 
///     @param text speed
///     The speed of the text scrolling. (Range: [0.0] to [1.0])
 
///     @param text sleep
///     The time in frames to sleep on pausing characters. (Ex. [.] [,] [!] [?])
 
///     @param text sound
///     The sound to play after each character scroll. (Ex. [undefined] [sound_talk])
 
//########################################################
function draw_text_scrolling(text_x, text_y, text_str, text_spd, text_slp, text_snd){
 
    #region SOURCE CODE
 
    //Checks if the index counter has been defined.
    if !variable_instance_exists(self.id, "_text_char"){
    
        //Defines the counter variables.
        _text_char      = 0;
        _text_prev      = 0;
        _text_sleep     = 0;
    
    }
 
    //Gets the current character index.
    var text_ind = floor(_text_char);
    var text_chr = string_char_at(text_str, text_ind);
 
    //Checks if the text index isn't the final char.
    if (text_ind != string_length(text_str)){
 
        //Checks if the text is not sleeping.
        if (_text_sleep == 0){
 
            //Checks if the following character is a sleep identifier.
            if !((text_chr == ".") || (text_chr == ",") || (text_chr == "?") || (text_chr == "!")){
    
                //Increments the character counter.
                _text_char += text_spd;
        
                //Maxes out the character counter at the string length.
                _text_char = min(_text_char, string_length(text_str));
        
                //Checks if the character has been fully incremented.
                if (text_ind > _text_prev) && (text_snd != undefined) && audio_exists(text_snd){
            
                    //Plays the text sound.
                    audio_stop_sound(text_snd);
                    audio_play_sound(text_snd, 0, false);
            
                }
        
                //Sets the previous value to the char index.
                _text_prev = text_ind;
    
            }else{
        
                //Starts the sleeping process.
                _text_sleep = text_slp;
        
            }
    
        }else{
    
            //Checks if the final frame of waiting.
            if (_text_sleep == 1){
        
                //Increments the character past the sleep identifier.
                _text_char = text_ind + 1;
        
            }
    
            //Decrements the text sleep.
            _text_sleep--;
    
        }
    
    }
 
    //Draws the scrolling text.
    draw_text(text_x, text_y, string_copy(text_str, 1, text_ind));
 
    #endregion
    
}

function draw_text_reset(){
    
    #region SOURCE CODE
 
    //Checks if the variable has been defined.
    if variable_instance_exists(self.id, "_text_char"){
    
        //Resets the defined variables for text scrolling.
        _text_char      = 0;
        _text_prev      = 0;
        _text_sleep     = 0;
    
    }
 
    #endregion
 
}
//########################################################
///
///     Created by Kupoapo
///
//########################################################

load_new_script(global.script_name);