module A2L
  Modules="/Modules/"
  require "mustache"
  require File.dirname(__FILE__) + Modules + "A2LRender.rb"
  def A2L.Generate
  	if defined? Header then puts A2LRender._Header(Header) end
  	if defined? ModCommon then puts A2LRender._ModCommon(ModCommon) end
  	if defined? Measurement then puts A2LRender._Measurement(Measurement) end
  end

end
