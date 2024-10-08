// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function PrescriptionManager()constructor{
	//array represents all prescriptions
	patient0 = [];
	
	patients = [patient0];
	
	prescribe = function(_patient, _medication){
		show_debug_message("here");
		array_push(patients[_patient], _medication);
		show_debug_message("Prescribed: "+_medication.medication_name);
	}
	
	current_prescription = function(_patient){
		patient = patients[_patient];
		return patient[array_length(patient)-1];
	}
}