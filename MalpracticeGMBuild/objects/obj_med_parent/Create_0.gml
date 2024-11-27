/// @description On the creation of a medication, set up the lists for the medication
treats_symptoms = [];
causes_symptoms = [];

symptoms_string = "Treats: ";

function look_up()
{
	len = array_length(treats_symptoms);
	for (i = 0; i < len; i++)
	{
		symptoms_string += treats_symptoms[i];
		if (i != len -1)
			symptoms_string += ", ";
	}
	global.med_info = {name: medication_name,
					   info: symptoms_string};
	looked_up = true;
}
