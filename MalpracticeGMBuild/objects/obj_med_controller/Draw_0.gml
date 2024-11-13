/// @description Insert description here
// You can write your code in this editor

draw_self();
if (prev_med_info != global.med_info.name)
{
	draw_text_reset();
	prev_med_info = global.med_info.name;
	
	lines = string_length(global.med_info.info);
	for(var i = 0; i < lines; i++)
	{
		var line_count = 0;
		words = string_split(global.med_info.info, " ");
		var textbox = "";
		for(var j = 0; j < array_length(words); j++)
		{
			var word = words[j];
			if(string_length(word) + line_count > max_line_size)
			{
				textbox += "\n";
				line_count = 0;
			}
			line_count += string_length(word) + 1;
			textbox += word + " ";
		}
		current_description = textbox;
	}
}

draw_set_color(c_ltgray);
draw_set_font(fnt_main_h2);
draw_text(x + 50, y + 80, global.med_info.name + ":");
draw_set_color(c_white);
draw_set_font(fnt_main);
obj_med_controller.draw_text_scrolling(x + 50, y + 150, current_description, 1.5, 1);

