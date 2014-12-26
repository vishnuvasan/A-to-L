module A2LRender
  require File.dirname(__FILE__)+"/Log.rb"

  Templates="/Templates/"

  def A2LRender._ASAP2Version(inputs)
    Mustache.template_file=File.dirname(__FILE__) + Templates + "ASAP2-Version.mustache"
    for key in inputs.keys
      #Remove the Decimal Dot with a Space
      inputs[key]=(inputs[key].to_s).sub('.',' ')
    end
    return Mustache.render(inputs)
  end

  def A2LRender._Begin_Project(inputs)
    Mustache.template_file=File.dirname(__FILE__) + Templates + "Begin-Project.mustache"
    return Mustache.render(A2LRender._to_s(inputs))
  end

  def A2LRender._Begin_Module(inputs)
    Mustache.template_file=File.dirname(__FILE__) + Templates + "Begin-Module.mustache"
    return Mustache.render(A2LRender._to_s(inputs))
  end

  def A2LRender._Header(inputs)
    Mustache.template_file=File.dirname(__FILE__) + Templates + "Header.mustache"
    return Mustache.render(A2LRender._to_s(inputs))
  end

  def A2LRender._Begin_A2ML()
    Mustache.template_file=File.dirname(__FILE__) + Templates + "Begin-A2ML.mustache"
    return Mustache.render()
  end

  def A2LRender._CCPConf(inputs)
    Mustache.template_file=File.dirname(__FILE__) + Templates + "CCP-Configuration.mustache"
    return Mustache.render(A2LRender._to_s(inputs))

  end

  def A2LRender._XCPConf(inputs)
    Mustache.template_file=File.dirname(__FILE__) + Templates + "XCP-Configuration.mustache"
    for key in inputs.keys
      
      if inputs["ECU_ACCESS"]=="ALLOWED" then
        inputs["ECU_ACCESS"]="_ALLOWED"
      elsif((inputs["ECU_ACCESS"]==nil) or (inputs["ECU_ACCESS"]=="NOT ALLOWED")) then
        inputs["ECU_ACCESS"]=""
      end
      
      if inputs["XCP_READ_ACCESS"]=="ALLOWED" then
        inputs["XCP_READ_ACCESS"]="_ALLOWED"
      elsif((inputs["XCP_READ_ACCESS"]==nil) or (inputs["XCP_READ_ACCESS"]=="NOT ALLOWED"))
        inputs["XCP_READ_ACCESS"]=""
      end

      if inputs["XCP_WRITE_ACCESS"]=="ALLOWED" then
        inputs["XCP_WRITE_ACCESS"]="_ALLOWED"
      elsif((inputs["XCP_WRITE_ACCESS"]==nil) or (inputs["XCP_WRITE_ACCESS"]=="NOT ALLOWED"))
        inputs["XCP_WRITE_ACCESS"]=""
      end
      
      if inputs["DAQ_SUPPORT"]==true then
        inputs["DAQ_SUPPORT"]="DAQ_"
      elsif inputs["DAQ_SUPPORT"]==false then
        inputs["DAQ_SUPPORT"]=""
      end
    end
    return Mustache.render(A2LRender._to_s(inputs))
end


def A2LRender._CANAPEIni()
  Mustache.template_file=File.dirname(__FILE__) + Templates + "CANAPE-Ini-Vector.mustache"
  return Mustache.render()
end

def A2LRender._CreateIni()
  Mustache.template_file=File.dirname(__FILE__) + Templates + "Create-Ini-Vector.mustache"
  return Mustache.render()
end

def A2LRender._CANAPEExt()
  Mustache.template_file=File.dirname(__FILE__) + Templates + "CANAPE-Ext-Vector.mustache"
  return Mustache.render()
end

def A2LRender._CANAPE_KWP_On_CAN()
  Mustache.template_file=File.dirname(__FILE__) + Templates + "CANAPE-KWP-On-CAN-Vector.mustache"
  return Mustache.render()
end

def A2LRender._KWP2000_ETAS()
  Mustache.template_file=File.dirname(__FILE__) + Templates + "KWP2000-ETAS.mustache"
  return Mustache.render()
end

def A2LRender._ETK_ETAS()
  Mustache.template_file=File.dirname(__FILE__) + Templates + "ETK-ETAS.mustache"
  return Mustache.render()
end

def A2LRender._End_A2ML()
  Mustache.template_file=File.dirname(__FILE__) + Templates + "End-A2ML.mustache"
  return Mustache.render()
end

def A2LRender._Visu_Package_Info(inputs)
  Mustache.template_file=File.dirname(__FILE__) + Templates + "Visu-Package-Info.mustache"
  return Mustache.render(A2LRender._to_s(inputs))
end

def A2LRender._CCP_Visu()
  Mustache.template_file=File.dirname(__FILE__) + Templates + "CCP-Visu.mustache"
  return Mustache.render()
end

def A2LRender._ASAP1B_KW2000()
  Mustache.template_file=File.dirname(__FILE__) + Templates + "ASAP1B-KW2000.mustache"
  return Mustache.render()
end

def A2LRender._ASAP1B_CCP()
  Mustache.template_file=File.dirname(__FILE__) + Templates + "ASAP1B-CCP.mustache"
  return Mustache.render()
end

def A2LRender._CANAPE_Create_Ini()
  Mustache.template_file=File.dirname(__FILE__) + Templates + "CANAPE-Create-Ini.mustache"
  return Mustache.render()
end

  def A2LRender._ModCommon(inputs)
    Mustache.template_file=File.dirname(__FILE__) + Templates + "ModCommon.mustache"
    return Mustache.render(A2LRender._to_s(inputs))
  end

  def A2LRender._Measurement(inputs)
  	Mustache.template_file=File.dirname(__FILE__) + Templates + "Measurement.mustache"
  	total=""
    for key in inputs.keys
      if(inputs[key]["USER_DEFINED"]==nil) then
          inputs[key]["USER_DEFINED"]=""
      end

      total+=Mustache.render(A2LRender._to_s(inputs[key]))
    end
    return total
  end


  def A2LRender._Characteristic(inputs)
    Mustache.template_file=File.dirname(__FILE__) + Templates + "Characteristic.mustache"
    total=""
    for key in inputs.keys
      if(inputs[key]["USER_DEFINED"]==nil) then
          inputs[key]["USER_DEFINED"]=""
      end

      total+=Mustache.render(A2LRender._to_s(inputs[key]))
    end
    return total
  end  
  
  def A2LRender._CompuMethod(inputs)
    #Put the Errors of A2L Creation in to a Log 

    Mustache.template_file=File.dirname(__FILE__) + Templates + "CompuMethod-Rational.mustache"
    total=""

  	for key in inputs.keys

      #Compu Method Type ==> IDENTICAL
      if((inputs[key]["COMPU_METHOD_TYPE"].upcase=="IDENTICAL") or (inputs[key]["COMPU_METHOD_TYPE"].upcase=="IDENT")) then
        inputs[key]["COMPU_METHOD_TYPE"]="IDENTICAL"
        Log._Validate(inputs,"IDENTICAL")
        Mustache.template_file=File.dirname(__FILE__) + Templates + "CompuMethod-Identical.mustache"
      end   

      #Compu Method Type ==> LINEAR
      if((inputs[key]["COMPU_METHOD_TYPE"].upcase=="LINEAR") or (inputs[key]["COMPU_METHOD_TYPE"].upcase=="LIN")) then
        inputs[key]["COMPU_METHOD_TYPE"]="LINEAR"
        inputs[key]["COEFF_TYPE"]="COEFFS_LINEAR"
        Log._Validate(inputs,"LINEAR")
        Mustache.template_file=File.dirname(__FILE__) + Templates + "CompuMethod-Linear.mustache"
      end

      #Compu Method Type ==> RAT_FUNC
      if((inputs[key]["COMPU_METHOD_TYPE"].upcase=="RAT_FUNC") or (inputs[key]["COMPU_METHOD_TYPE"].upcase=="RATIONAL") or (inputs[key]["COMPU_METHOD_TYPE"].upcase=="RAT")) then
        inputs[key]["COMPU_METHOD_TYPE"]="RAT_FUNC"
        inputs[key]["COEFF_TYPE"]="COEFFS"
        Log._Validate(inputs,"RAT_FUNC")
        Mustache.template_file=File.dirname(__FILE__) + Templates + "CompuMethod-Rational.mustache"
      end      

      #Compu Method Type ==> FORM
      if((inputs[key]["COMPU_METHOD_TYPE"].upcase=="FORM") or (inputs[key]["COMPU_METHOD_TYPE"].upcase=="FORMULA")) 
        inputs[key]["COMPU_METHOD_TYPE"]="FORM"
        Log._Validate(inputs,"FORM")
        Mustache.template_file=File.dirname(__FILE__) + Templates + "CompuMethod-Form.mustache"        
      end


      #Compu Method Type ==> INTERPOLATION
      if((inputs[key]["COMPU_METHOD_TYPE"].upcase=="TAB_INTP") or (inputs[key]["COMPU_METHOD_TYPE"].upcase=="INTERPOLATION")) then  
        inputs[key]["COMPU_METHOD_TYPE"]="TAB_INTP"

        if(inputs[key]["INTERPOLATION"]=="ENABLE") then
          inputs[key]["COMPU_TAB_TYPE"]="TAB_INTP"
        elsif(inputs[key]["INTERPOLATION"]=="DISABLE") then     
          inputs[key]["COMPU_TAB_TYPE"]="TAB_NOINTP"
        end

        if defined? inputs[key]["INTERPOLATION_VALUES"] then
          puts inputs[key]["INTERPOLATION_SIZE"]=inputs[key]["INTERPOLATION_VALUES"].length
        else
          inputs[key]["INTERPOLATION_SIZE"]=""
        end

        if defined? inputs[key]["INTERPOLATION_VALUES"] then
          values=""
          desired_size=0
          actual_size=inputs[key]["INTERPOLATION_VALUES"].length
          for index in inputs[key]["INTERPOLATION_VALUES"].keys
            desired_size+=1
            if desired_size==1 then pad_space="" else pad_space="    " end
            if desired_size==actual_size then pad_line="" else pad_line="\n" end
            values+=pad_space+index.to_s + " "
            values+=inputs[key]["INTERPOLATION_VALUES"][index].to_s + pad_line
          end 
          inputs[key]["INTERPOLATION_VALUES"]=values
        end

        if(inputs[key]["DEFAULT_VALUE"]==nil) or (inputs[key]["DEFAULT_VALUE"]=="") then
          inputs[key]["DEFAULT_VALUE"]=""
        elsif inputs[key]["DEFAULT_VALUE"]!=nil then
          inputs[key]["DEFAULT_VALUE"]="DEFAULT_VALUE_NUMERIC " + inputs[key]["DEFAULT_VALUE"].to_s
        end

        Log._Validate(inputs,"TAB_INTP")
        Mustache.template_file=File.dirname(__FILE__) + Templates + "CompuMethod-TabIntp.mustache"         
      end    

      #Compu Method Type ==> VERBAL
      if((inputs[key]["COMPU_METHOD_TYPE"].upcase=="TAB_VERB") or (inputs[key]["COMPU_METHOD_TYPE"].upcase=="VERBAL")) then  
        inputs[key]["COMPU_METHOD_TYPE"]=inputs[key]["COMPU_METHOD_TYPE_1"]="TAB_VERB"

        if (inputs[key]["VERB_RANGE"]=="ENABLE") then
          inputs[key]["MODE"]="COMPU_VTAB_RANGE"
          inputs[key]["COMPU_METHOD_TYPE_1"]="" 
        else
          inputs[key]["MODE"]="TAB_VERB"
        end

        if defined? inputs[key]["COMPU_VTAB_VALUES"] then
          puts inputs[key]["COMPU_VTAB_SIZE"]=inputs[key]["COMPU_VTAB_VALUES"].length
        else
          inputs[key]["COMPU_VTAB_SIZE"]=""
        end

        if defined? inputs[key]["COMPU_VTAB_VALUES"] and inputs[key]["VERB_RANGE"]!="ENABLE" then
          values=""
          desired_size=0
          actual_size=inputs[key]["COMPU_VTAB_VALUES"].length
          for index in inputs[key]["COMPU_VTAB_VALUES"].keys
            desired_size+=1
            if desired_size==1 then pad_space="" else pad_space="    " end
            if desired_size==actual_size then pad_line="" else pad_line="\n" end
            values+=pad_space+index.to_s + " "
            values+='"' + inputs[key]["COMPU_VTAB_VALUES"][index].to_s + '"' + pad_line
          end 
          inputs[key]["COMPU_VTAB_VALUES"]=values
        end

        if defined? inputs[key]["COMPU_VTAB_VALUES"] and inputs[key]["VERB_RANGE"]=="ENABLE" then
          values=""
          desired_size=0
          actual_size=inputs[key]["COMPU_VTAB_VALUES"].length

          for index in inputs[key]["COMPU_VTAB_VALUES"].keys

            desired_size+=1
            if desired_size==1 then pad_space="" else pad_space="    " end
            if desired_size==actual_size then pad_line="" else pad_line="\n" end
            
            values+=pad_space+index.to_s + " "

            for index1 in inputs[key]["COMPU_VTAB_VALUES"][index].keys
              values+=index1.to_s + " "
              values+='"' + inputs[key]["COMPU_VTAB_VALUES"][index][index1].to_s + '"' + pad_line
            end

          end 
          inputs[key]["COMPU_VTAB_VALUES"]=values
        end

        if(inputs[key]["DEFAULT_VALUE"]==nil) or (inputs[key]["DEFAULT_VALUE"]=="") then
          inputs[key]["DEFAULT_VALUE"]=""
        elsif inputs[key]["DEFAULT_VALUE"]!=nil then
          inputs[key]["DEFAULT_VALUE"]="DEFAULT_VALUE " + inputs[key]["DEFAULT_VALUE"].to_s
        end

        Log._Validate(inputs,"TAB_VERB")
        Mustache.template_file=File.dirname(__FILE__) + Templates + "CompuMethod-TabVerb.mustache"    

      end

      #By Default the Compu Method Type would be RAT_FUNC.
      if((inputs[key]["COMPU_METHOD_TYPE"]=="")or(inputs[key]["COMPU_METHOD_TYPE"]==nil)) then 
        inputs[key]["COMPU_METHOD_TYPE"]="RAT_FUNC" 
      end
      
      #By Default the Coeffs would be COEFFS.If the User wants to change it,He/She can
      if((inputs[key]["COEFFS"]=="")or(inputs[key]["COEFFS"]==nil)) then 
        inputs[key]["COEFFS"]="COEFFS" 
      end   
      
      total+=Mustache.render(A2LRender._to_s(inputs[key]))
  	
    end
    return total
  end  

  def A2LRender._End_Module()
    Mustache.template_file=File.dirname(__FILE__) + Templates + "End-Module.mustache"
    return Mustache.render()
  end 

  def A2LRender._End_Project()
    Mustache.template_file=File.dirname(__FILE__) + Templates + "End-Project.mustache"
    return Mustache.render()
  end

  def A2LRender._XCP_Interface_Configuration()
    Mustache.template_file=File.dirname(__FILE__) + Templates + "XCP-Interface-Configuration.mustache"
    return Mustache.render()
  end

  def A2LRender._to_s(inputs)
    for key in inputs.keys
      if inputs[key]==nil then
          inputs[key]=""
      end
      inputs[key]=inputs[key].to_s
    end
    return inputs
  end

  def A2LRender._Begin_ModPar(inputs)
    Mustache.template_file=File.dirname(__FILE__) + Templates + "Begin-ModPar.mustache"
    Mustache.render(A2LRender._to_s(inputs))
  end

  def A2LRender._Data_Memory(inputs)
    Mustache.template_file=File.dirname(__FILE__) + Templates + "Data-Memory.mustache"
    total=""
    for key in inputs.keys
      total+=Mustache.render(A2LRender._to_s(inputs[key]))
    end
    return total
  end

  def A2LRender._Variable_Memory(inputs)
    Mustache.template_file=File.dirname(__FILE__) + Templates + "Variable-Memory.mustache"
    total=""
    for key in inputs.keys
      total+=Mustache.render(A2LRender._to_s(inputs[key]))
    end
    return total
  end

  def A2LRender._System_Constant(inputs)
    Mustache.template_file=File.dirname(__FILE__) + Templates + "System-Constant.mustache"
    total=""
    for key in inputs.keys
      total+=Mustache.render(A2LRender._to_s(inputs[key]))
    end
    return total
  end

  def A2LRender._Calibration_Method(inputs)
    Mustache.template_file=File.dirname(__FILE__) + Templates + "Calibration-Method.mustache"
    return Mustache.render(A2LRender._to_s(inputs))
  end

  def A2LRender._End_ModPar()
    Mustache.template_file=File.dirname(__FILE__) + Templates + "End-ModPar.mustache"
    return Mustache.render()
  end

end
