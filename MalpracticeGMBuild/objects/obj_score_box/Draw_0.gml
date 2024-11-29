/// @description Insert description here
// You can write your code in this editor
if (!global.display_score)
	return;
draw_self();
draw_set_font(fnt_main);
draw_set_color(c_white);
draw_text(x + 20, y + 30, "Score: " + string(global.score));
