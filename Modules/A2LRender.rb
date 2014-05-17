module A2LRender
  Templates="/Templates/"
  def A2LRender._Header(inputs)
    Mustache.template_file=File.dirname(__FILE__) + Templates + "Header.mustache"
    return Mustache.render(inputs)
  end

  def A2LRender._ModCommon(inputs)
    Mustache.template_file=File.dirname(__FILE__) + Templates + "ModCommon.mustache"
    return Mustache.render(inputs)
  end

  def A2LRender._Measurement(inputs)
  	Mustache.template_file=File.dirname(__FILE__) + Templates + "Measurement.mustache"
  	total=""
	for key in inputs.keys()
	    total+=Mustache.render(inputs[key])
	end
	return total
  end
end
