/// @description Insert description here
// You can write your code in this editor

global.selected_medications = [];
global.all_medications = [obj_alprazolam,obj_cetirizine, obj_enobosarm,obj_escitalopram, obj_ligandrol,obj_loratadine, obj_lorazepam, obj_methandrostenolone, obj_modafinil,obj_montelukast,obj_propranolol,obj_testosterone_cypionate];//Add in more medications as they are made
global.med_info = {name: "Select medicine", 
				   info: "Hover for more details, click the medication to prescribe."};
prev_med_info = "start";
current_description = "start";
function select_medication(_selected, _all)
{
	for(var i=0; i < array_length(_all); i++)
		array_push(_selected, _all[i]);
}

///@description initializes medications to shelves in an orderly way.
function spawn_medications(_selected)
{
	var length = array_length(_selected);
	var _x = 150;
	var _y = 125;
	for(var i =0; i < length; i++)
	{
		instance_create_depth(_x, _y, 1, _selected[i]);
		_x += 150;
		if(_x >= 801)
		{
			_x =150;
			_y += 135;
		}
	}
}

select_medication(global.selected_medications, global.all_medications);
spawn_medications(global.selected_medications);


/// code for scrolling effect

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