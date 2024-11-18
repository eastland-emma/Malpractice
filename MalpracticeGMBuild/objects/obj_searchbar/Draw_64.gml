/// @description Display the user's currently typed search to the user
draw_self();

draw_set_font(fnt_main);
draw_set_color(c_white);

draw_text(x + 50, y + 30, "Search for: " + usr_text);