/// @description Insert description here
// You can write your code in this editor
draw_self();
draw_set_font(fnt_main_results);
draw_set_color(c_yellow);
draw_set_font(fnt_main);
draw_set_color(c_white);
var arcs_finished = 0;
for(var i =0; i<array_length(global.patient_mementos);i++)
{
	if(global.patient_mementos[i].visible)
	{
		arcs_finished ++;
	}
}
draw_text(x + 40, y + 60,  "All Patients Lost!\n"+
						   "After "+string(global.day_num)+" days, your\npharmacy has closed."+ 
						   "\nYou prescibed drugs\n"+
						   "a total of " + string(global.total_prescriptions_given)+ " times.\n"+
						   "You saw patients\n"+
						   "a total of "+ string(global.total_patients_seen)+" times,\n"+
						   "and earned "+string(global.total_score)+"\n"+
						   "across all days.\n"+
						   "You helped " + string(arcs_finished) + " patients\n"+
						   "reach their goals.");

						   
					
//draw_text(x + 15, y + 350, "You prescibed drugs a total of" + string(global.total_prescriptions_given)+"times.");
//raw_text(x + 15, y + 450, "You saw patients a total of "+string(global.total_patients_seen)+" and earned "+string(global.total_score)+"across all days.");

//draw_text(x + 180, y + 350, "You helped " + string(arcs_finished) + " patients reach their goals.");

//draw_set_font(fnt_main);
//draw_set_color(c_white);
//draw_text(x + 220, y + 650, "Press space to replay");