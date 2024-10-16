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
		previous_symptom = _patient_obj.current_symptom;
		status =check_treatment_status(_patient_obj.patient_id);
		//Set new symptom
		if(status)
		{
			_patient_obj.current_symptom = _med.causes_symptoms[irandom(array_length(_med.causes_symptoms)-1)];
			global.textbox.dialogue.add(_med.medication_name + ", huh?\nI guess I'll give it\na try.");
		}
		else
		{
			global.textbox.dialogue.add("Does "+ _med.medication_name + "\neven treat "+previous_symptom+"?\nMaybe I should\nsee someone else.");
		
		}
		
		
	}
	
	//Check treatment status. 1 if the symptom is treated by the most recently described drug. 
	check_treatment_status = function(_patient_id)
	{
		_drug_prescribed = current_prescription(_patient_id);
		patient_symptom = global.patients[_patient_id].current_symptom;
		return array_contains(_drug_prescribed.treats_symptoms, patient_symptom);
	}
	//Check history of dependence
}