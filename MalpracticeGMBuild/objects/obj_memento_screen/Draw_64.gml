/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_font(fnt_main_results);
draw_set_color(c_yellow);
draw_text(x + 30, y + 60, memento_name);
draw_set_font(fnt_main);
draw_set_color(c_white);
var arcs_finished = 0;
for(var i =0; i<array_length(global.patient_mementos);i++)
{
	if(global.patient_mementos[i].visible)
	{
		arcs_finished ++;
	}
}
_line_count = 0;
words = string_split(memento_desc, " ");
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
draw_text(x + 40, y + 200, _printable_text);

draw_text(x + 40, y + 400, "Click memento again \n       to close");

						   
					
//draw_text(x + 15, y + 350, "You prescibed drugs a total of" + string(global.total_prescriptions_given)+"times.");
//raw_text(x + 15, y + 450, "You saw patients a total of "+string(global.total_patients_seen)+" and earned "+string(global.total_score)+"across all days.");

//draw_text(x + 180, y + 350, "You helped " + string(arcs_finished) + " patients reach their goals.");

//draw_set_font(fnt_main);
//draw_set_color(c_white);
//draw_text(x + 220, y + 650, "Press space to replay");