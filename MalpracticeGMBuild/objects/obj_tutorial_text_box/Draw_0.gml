/// @description Procedure for drawing and handling autocomplete

//Draw as GUI
draw_self();

//Font set up
draw_set_font(fnt_main);
draw_set_color(c_white);

//Control whether we wait for text to scroll or just display.
if (scrolling)
{
	obj_tutorial_text_box.draw_text_scrolling(x + 50,y + 80,current_dialogue, 0.85, 1);
}
else
{
	draw_text(x + 50, y + 80, current_dialogue);
}