/// @description Insert description here
// You can write your code in this editor
draw_self();
if(!played_click)
{
audio_play_sound(snd_mouse_click,0,false);
played_click = true;
}
//draw_set_color(c_navy);
//draw_set_font(fnt_main_h2);
//draw_text(x + 50, y + 80, global.med_info.name + ":");
draw_set_font(fnt_main_results);
draw_set_color(c_yellow);
draw_text(x + 250, y + 80, "Day " + string(day) + " Complete!" );
draw_set_font(fnt_main_results);
draw_set_color(c_white);
draw_text(x + 15, y + 250, "Prescription Accuracy: " + string(patients_seen) + "/" + string(prescriptions_given));
draw_text(x + 180, y + 350, "Medicine Lookups: " + string(medicine_lookups));
draw_text(x + 300, y + 450, "Score: " + string(global.score));
draw_set_font(fnt_main);
draw_set_color(c_white);
draw_text(x + 220, y + 650, "Press space to continue");