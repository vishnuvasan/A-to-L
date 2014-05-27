module Log
	"Module for the Data Validation and Log File Processing"
	l="log.puts"
	  
	def Log._Validate(inputs,template,filename="Data_Validation_A2L.log")
	    "Validate the Input Data Before Rendering and Update the Log Files"
	
		#All the Keys are explicitly converted to Strings to Handle the Exception of nil/Null values   

	    open(filename,"a+") do |log|

			for key in inputs.keys
				log.puts "===================================" 
				log.puts "COMPU TYPE : "+ (template.to_s).upcase + "  KEY : #{key}"
				log.puts "==================================="

				if (template.to_s).upcase=="IDENTICAL"
					is_name=is_description=is_compu_method_type=is_physical_rep=is_unit="VALID"
					is_coeff_type=is_coeff_a=is_coeff_b=is_coeff_c=is_coeff_d=is_coeff_e=is_coeff_f=""
					is_formula=is_formula_inv=""
					is_compu_tab_ref=is_compu_tab_description=is_interpolation=is_interpolation_values=""
				end

				if (template.to_s).upcase=="LINEAR"
					is_name=is_description=is_compu_method_type=is_physical_rep=is_unit="VALID"
					is_coeff_type=is_coeff_a=is_coeff_b="VALID"
					is_coeff_c=is_coeff_d=is_coeff_e=is_coeff_f=""
					is_formula=is_formula_inv=""
					is_compu_tab_ref=is_compu_tab_description=is_interpolation=is_interpolation_values=""
				end

				if (template.to_s).upcase=="RAT_FUNC"
					is_name=is_description=is_compu_method_type=is_physical_rep=is_unit="VALID"
					is_coeff_type=is_coeff_a=is_coeff_b=is_coeff_c=is_coeff_d=is_coeff_e=is_coeff_f="VALID"
					is_formula=is_formula_inv=""
					is_compu_tab_ref=is_compu_tab_description=is_interpolation=is_interpolation_values=""
				end	

				if (template.to_s).upcase=="FORM"
					is_name=is_description=is_compu_method_type=is_physical_rep=is_unit="VALID"
					is_coeff_type=is_coeff_a=is_coeff_b=is_coeff_c=is_coeff_d=is_coeff_e=is_coeff_f=""
					is_formula=is_formula_inv="VALID"
					is_compu_tab_ref=is_compu_tab_description=is_interpolation=is_interpolation_values=""
				end					

				if (template.to_s).upcase=="TAB_INTP"
					is_name=is_description=is_compu_method_type=is_physical_rep=is_unit="VALID"
					is_coeff_type=is_coeff_a=is_coeff_b=is_coeff_c=is_coeff_d=is_coeff_e=is_coeff_f=""
					is_formula=is_formula_inv=""
					is_compu_tab_ref=is_compu_tab_description=is_interpolation=is_interpolation_values="VALID"
					is_default_value="VALID"					
				end			

				if defined? inputs[key]["NAME"]
				  log.puts _Format_Line("NAME",_Format_Line(is_name,inputs[key]["NAME"].to_s))
				end

				if defined? inputs[key]["DESCRIPTION"]
				  log.puts _Format_Line("DESCRIPTION",_Format_Line(is_description,inputs[key]["DESCRIPTION"].to_s))
				end

				if defined? inputs[key]["COMPU_METHOD_TYPE"]
				  log.puts _Format_Line("COMPU_METHOD_TYPE",_Format_Line(is_compu_method_type,inputs[key]["COMPU_METHOD_TYPE"].to_s))
				end

				if defined? inputs[key]["PHYSICAL_REP"] then
				  log.puts _Format_Line("PHYSICAL_REP",_Format_Line(is_physical_rep,inputs[key]["PHYSICAL_REP"].to_s))   
				end

				if defined? inputs[key]["UNIT"]
				  log.puts _Format_Line("UNIT",_Format_Line(is_unit,inputs[key]["UNIT"].to_s))
				end 

				if defined? inputs[key]["COEFF_TYPE"]
				  log.puts _Format_Line("COEFF_TYPE",_Format_Line(is_coeff_type,inputs[key]["COEFF_TYPE"].to_s))
				end

				if defined? inputs[key]["COEFF_A"]
				  log.puts _Format_Line("COEFF_A",_Format_Line(is_coeff_a,inputs[key]["COEFF_A"].to_s))
				end

				if defined? inputs[key]["COEFF_B"]
				  log.puts _Format_Line("COEFF_B",_Format_Line(is_coeff_b,inputs[key]["COEFF_B"].to_s))
				end

				if defined? inputs[key]["COEFF_C"]
				  log.puts _Format_Line("COEFF_C",_Format_Line(is_coeff_c,inputs[key]["COEFF_C"].to_s))
				end

				if defined? inputs[key]["COEFF_D"]
				  log.puts _Format_Line("COEFF_D",_Format_Line(is_coeff_d,inputs[key]["COEFF_D"].to_s))
				end

				if defined? inputs[key]["COEFF_E"]
				  log.puts _Format_Line("COEFF_E",_Format_Line(is_coeff_e,inputs[key]["COEFF_E"].to_s))
				end

				if defined? inputs[key]["COEFF_F"]
				  log.puts _Format_Line("COEFF_F",_Format_Line(is_coeff_f,inputs[key]["COEFF_F"].to_s))
				end

				if defined? inputs[key]["FORMULA"]
				  log.puts _Format_Line("FORMULA",_Format_Line(is_formula,inputs[key]["FORMULA"].to_s))
				end

				if defined? inputs[key]["FORMULA_INV"]
				  log.puts _Format_Line("FORMULA_INV",_Format_Line(is_formula_inv,inputs[key]["FORMULA_INV"].to_s))
				end

				if defined? inputs[key]["COMPU_TAB_REF"]
				  log.puts _Format_Line("COMPU_TAB_REF",_Format_Line(is_compu_tab_ref,inputs[key]["COMPU_TAB_REF"].to_s))
				end

				if defined? inputs[key]["COMPU_TAB_DESCRIPTION"]
				  log.puts _Format_Line("COMPU_TAB_DESCRIPTION",_Format_Line(is_compu_tab_description,inputs[key]["COMPU_TAB_DESCRIPTION"].to_s))
				end

				if defined? inputs[key]["INTERPOLATION"]
				  log.puts _Format_Line("INTERPOLATION",_Format_Line(is_interpolation,inputs[key]["INTERPOLATION"].to_s))
				end				

				if defined? inputs[key]["INTERPOLATION_VALUES"]
				  log.puts _Format_Line("INTERPOLATION_VALUES",_Format_Line(is_interpolation_values,inputs[key]["INTERPOLATION_VALUES"].to_s))
				end		

				if defined? inputs[key]["DEFAULT_VALUE"]
				  log.puts _Format_Line("DEFAULT_VALUE",_Format_Line(is_default_value,inputs[key]["DEFAULT_VALUE"].to_s))
				end		

			end
	  	end
	end

	def Log._Format_Line(left,right,padlength=25,pad=" ")
	  "Pad Spaces in between Two String for Beautification"
	  pad1=pad
	  ((padlength.to_i)-(left.to_s.length)).times { pad+=pad1 }
	  return ":" + left.to_s + ":" + pad.to_s + right.to_s
	end

end
