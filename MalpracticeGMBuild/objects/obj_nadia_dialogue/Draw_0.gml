/// @description Insert description here
// You can write your code in this editor

draw_set_font(fnt_Arial);

draw_set_color(c_white);
obj_text_box.draw_text_scrolling(10,10, current_dialogue, 0.5, 1);

if keyboard_check_pressed(vk_space){
	draw_text_reset();
	current_dialogue = nadiadialogue.pop();
}