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
				end

				if (template.to_s).upcase=="LINEAR"
					is_name=is_description=is_compu_method_type=is_physical_rep=is_unit="VALID"
					is_coeff_type=is_coeff_a=is_coeff_b="VALID"
					is_coeff_c=is_coeff_d=is_coeff_e=is_coeff_f=""
					is_formula=is_formula_inv=""
				end

				if (template.to_s).upcase=="RAT_FUNC"
					is_name=is_description=is_compu_method_type=is_physical_rep=is_unit="VALID"
					is_coeff_type=is_coeff_a=is_coeff_b=is_coeff_c=is_coeff_d=is_coeff_e=is_coeff_f="VALID"
					is_formula=is_formula_inv=""
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
