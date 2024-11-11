/// @description Insert description here
// You can write your code in this editor
draw_self();
//draw_set_color(c_navy);
//draw_set_font(fnt_main_h2);
//draw_text(x + 50, y + 80, global.med_info.name + ":");
draw_set_font(fnt_main_title);
draw_set_color(c_yellow);
draw_text(x + 100, y + 80, "Day " + string(day) + " Complete!" );
draw_set_font(fnt_main_results);
draw_set_color(c_white);
draw_text(x + 15, y + 300, "Prescription Accuracy: " + string(global.patients_seen) + "/" + string(global.prescriptions_given));
draw_text(x + 300, y + 400, "Score: " + string(round((global.patients_seen/global.prescriptions_given) * 1000)));
draw_set_font(fnt_main);
draw_set_color(c_white);
draw_text(x + 220, y + 650, "Press space to continue");