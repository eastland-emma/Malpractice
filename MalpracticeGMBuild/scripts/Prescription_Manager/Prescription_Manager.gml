// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function PrescriptionManager()constructor{
	//Array represents all prescriptions
	patient0 = [];
	
	patients = [patient0];
	
	//Add a new medication to the patients list of medication
	prescribe = function(_patient_id, _medication){
		array_push(patients[_patient_id], _medication);
		show_debug_message("Prescribed: "+_medication.medication_name);
	}
	
	//Return whatever the current prescription for this character
	current_prescription = function(_patient_id){
		patient = patients[_patient_id];
		return patient[array_length(patient)-1];
	}
	
	//Accept the medication, give the player feedback and get a new symptom set up
	accept_medication = function(_patient_obj)
	{
		//get the current_medication for this patient
		_med = current_prescription(_patient_obj.patient_id);
		//Set new symptom
		_patient_obj.current_symptom = _med.causes_symptoms[irandom(array_length(_med.causes_symptoms)-1)];
		//debug only
		show_debug_message(_patient_obj.name_first+"'s current symptom is "+_patient_obj.current_symptom);
		
		//Have the character comment on the prescription
		global.textbox.dialogue.add(_med.medication_name + ", huh?\nI guess I'll give it\na try.");
	}
}