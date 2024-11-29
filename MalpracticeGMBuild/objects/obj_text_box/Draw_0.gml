/// @description Insert description here
// You can write your code in this editor

draw_self();

draw_set_font(fnt_main);

draw_set_color(c_white);
	
if (scrolling)
{
	obj_text_box.draw_text_scrolling(x + 50,y + 80,current_dialogue, 0.85, 1);
}
else
{
	draw_text(x + 50, y + 80, current_dialogue);
}
	



