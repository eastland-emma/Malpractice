/// @description Insert description here
// You can write your code in this editor
if (global.dialogue.count() > 0){
	draw_text_reset();
	current_dialogue = global.dialogue.pop();
}
else{
	//instance_destroy(self);
}
