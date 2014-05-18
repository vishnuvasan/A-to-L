module A2L

  Modules="/Modules/"
  
  require "mustache"
  require File.dirname(__FILE__) + Modules + "A2LRender.rb"


  def A2L.Generate
  	
  	if defined? Header then 
  		puts A2LRender._Header(Header) 
  	end
  	
  	if defined? ModCommon then 
  		puts A2LRender._ModCommon(ModCommon) 
  	end
  	
  	if defined? Measurement then 
  		puts A2LRender._Measurement(Measurement) 
  	end
	
  	if defined? CompuMethod then 
  		puts A2LRender._CompuMethod(CompuMethod) 
  	end
  	
  	if defined? CompuMethodForm then
  		puts A2LRender._CompuMethodForm(CompuMethodForm)
  	end

  	if defined? CompuMethodIntp then
  		puts A2LRender._CompuMethodIntp(CompuMethodIntp)
  	end

    if defined? CompuMethodVerb then
      puts A2LRender._CompuMethodVerb(CompuMethodVerb)
    end  

  end

end
