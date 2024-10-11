/// @description Draw medication information to the screen

// Font setup
draw_set_font(fnt_main);
draw_set_color(c_black);

//Draw the medication info to the screen
draw_text(800, 400,"Are you sure you want to prescribe " + global.med_info.name + " to the patient?");
draw_text(800, 600, global.med_info.info);