/// @description Insert description here
// You can write your code in this editor
show_debug_message(dialogue.count())
if (dialogue.count() > 0){
	display_next_dialogue();
}
else{
	//instance_destroy(self);
	visible = false;
}