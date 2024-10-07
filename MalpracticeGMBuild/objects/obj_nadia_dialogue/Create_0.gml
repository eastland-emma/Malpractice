/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

nadiadialogue = new Dialogue();
text = buffer_load("nadia_script.txt.txt");
strings = string_split(buffer_read(text,buffer_string), "\n");
file_find_close();
lines = array_length(strings);

for(var i =0; i<lines;i++)
{
	nadiadialogue.add(strings[i]);
}
current_dialogue = nadiadialogue.pop();





