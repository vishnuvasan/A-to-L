module A2L

  Modules="/Modules/"
  
  require "mustache"
  require File.dirname(__FILE__) + Modules + "A2LRender.rb"


  def A2L.Generate
  	
  	if defined? Header then 
  		puts A2LRender._Header(Header) 
  	end

    if defined? CCPConfig then
      puts A2LRender._CCPConf(CCPConfig)
    end
  	
    if defined? XCPConfig then
      puts A2LRender._XCPConf(XCPConfig)
    end

    if defined? CANAPEIni then
      puts A2LRender._CANAPEIni()
    end

    if defined? CreateIni then
      puts A2LRender._CreateIni()
    end

  	if defined? ModCommon then 
  		puts A2LRender._ModCommon(ModCommon) 
  	end
  	
  	if defined? Measurement then 
  		puts A2LRender._Measurement(Measurement) 
  	end

    if defined? Characteristic then 
      puts A2LRender._Characteristic(Characteristic) 
    end   
	
  	if defined? CompuMethod then 
  		puts A2LRender._CompuMethod(CompuMethod) 
  	end
  	
  end

end
