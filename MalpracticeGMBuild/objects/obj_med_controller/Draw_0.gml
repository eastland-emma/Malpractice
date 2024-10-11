/// @description Insert description here
// You can write your code in this editor
draw_set_font(fnt_main_h2);
draw_set_color(c_black);
draw_text(x + 10, y + 10, global.med_info.name + ":");

draw_set_font(fnt_main);

draw_text(x+ 10, y + 80,"Description: " + global.med_info.info);

draw_text(x+ 10, y + 120, "Click on " + global.med_info.name + " to perscribe it.");