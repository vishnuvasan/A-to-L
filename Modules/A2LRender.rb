module A2LRender
  require File.dirname(__FILE__)+"/Log.rb"

  Templates="/Templates/"

  def A2LRender._Header(inputs)
    Mustache.template_file=File.dirname(__FILE__) + Templates + "Header.mustache"
    return Mustache.render(A2LRender._to_s(inputs))
  end

  def A2LRender._ModCommon(inputs)
    Mustache.template_file=File.dirname(__FILE__) + Templates + "ModCommon.mustache"
    return Mustache.render(A2LRender._to_s(inputs))
  end

  def A2LRender._Measurement(inputs)
  	Mustache.template_file=File.dirname(__FILE__) + Templates + "Measurement.mustache"
  	total=""
    for key in inputs.keys
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
        Mustache.template_file=File.dirname(__FILE__) + Templates + "CompuMethod-Rational.mustache"
      end      

      #Compu Method Type ==> FORM
      if(inputs[key]["COMPU_METHOD_TYPE"].upcase=="FORM") then
        inputs[key]["COMPU_METHOD_TYPE"]=inputs[key]["COMPU_METHOD_TYPE"].upcase
        Mustache.template_file=File.dirname(__FILE__) + Templates + "CompuMethod-Form.mustache"        
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

  # def A2LRender._CompuMethodForm(inputs)
  #   Mustache.template_file=File.dirname(__FILE__) + Templates + "CompuMethod-Form.mustache"
  #   total=""
  #   for key in inputs.keys

  #     #By Default the Compu Method Type would be FORM.
  #     if((inputs[key]["COMPU_METHOD_TYPE"]=="")or(inputs[key]["COMPU_METHOD_TYPE"]==nil)) then 
  #       inputs[key]["COMPU_METHOD_TYPE"]="FORM" 
  #     end
      
  #     total+=Mustache.render(A2LRender._to_s(inputs[key]))
    
  #   end
  #   return total
  # end

  def A2LRender._CompuMethodIntp(inputs)
    Mustache.template_file=File.dirname(__FILE__) + Templates + "CompuMethod-TabIntp.mustache"
    total=""
    for key in inputs.keys

      #By Default the Compu Method Type would be TAB_INTP.
      if((inputs[key]["COMPU_METHOD_TYPE"]=="")or(inputs[key]["COMPU_METHOD_TYPE"]==nil)) then 
        inputs[key]["COMPU_METHOD_TYPE"]="TAB_INTP" 
      end

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
      
      total+=Mustache.render(A2LRender._to_s(inputs[key]))
    end
    
    return total
  end  

  def A2LRender._CompuMethodVerb(inputs)
    Mustache.template_file=File.dirname(__FILE__) + Templates + "CompuMethod-TabVerb.mustache"
    total=""
    for key in inputs.keys

      #By Default the Compu Method Type would be TAB_VERB.
      if((inputs[key]["COMPU_METHOD_TYPE"]=="")or(inputs[key]["COMPU_METHOD_TYPE"]==nil)) then 
        inputs[key]["COMPU_METHOD_TYPE"]=inputs[key]["COMPU_METHOD_TYPE_1"]="TAB_VERB" 
      elsif (inputs[key]["COMPU_METHOD_TYPE"]=="TAB_VERB") then
        inputs[key]["COMPU_METHOD_TYPE_1"]="TAB_VERB"
      end

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

          # puts "values " + values.to_s

          for index1 in inputs[key]["COMPU_VTAB_VALUES"][index].keys
            values+=index1.to_s + " "
            values+='"' + inputs[key]["COMPU_VTAB_VALUES"][index][index1].to_s + '"' + pad_line
          end

        end 
        inputs[key]["COMPU_VTAB_VALUES"]=values
      end


      # if defined? inputs[key]["COMPU_VTAB_VALUES"] and inputs[key]["VERB_RANGE"]=="ENABLE" then
      #   values=""
      #   desired_size=0
      #   actual_size=inputs[key]["COMPU_VTAB_VALUES"].length
      #   for index in inputs[key]["COMPU_VTAB_VALUES"].keys
      #     desired_size+=1


      if(inputs[key]["DEFAULT_VALUE"]==nil) or (inputs[key]["DEFAULT_VALUE"]=="") then
        inputs[key]["DEFAULT_VALUE"]=""
      elsif inputs[key]["DEFAULT_VALUE"]!=nil then
        inputs[key]["DEFAULT_VALUE"]="DEFAULT_VALUE " + inputs[key]["DEFAULT_VALUE"].to_s
      end      
      
      total+=Mustache.render(A2LRender._to_s(inputs[key]))
    end

    return total
  end
  
  def A2LRender._to_s(inputs)
    for key in inputs.keys
      inputs[key]=inputs[key].to_s
    end
    return inputs
  end

end
