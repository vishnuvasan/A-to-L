#Include all the Libraries necessary for A2L Rendering
require File.dirname(__FILE__)+"/A2L.rb"

#This works based on Different Hash Values
#These Hash Names are HardCoded Like Header,ModCommon,Measurement etc.,
#Based on these Hash Names the A2L will be rendered accordingly
#If you hate these Names and you want to update with your own Hashes then you should be poking 
#your head in to the Modules\A2L_Render.rb and Customizing the Hash Names for their Respective Template

Measurement=Hash.new

#Update the HEADER Details of the A2L
Header= {
  			"HEADER"=>"Sample A2L File",
  			"VERSION"=>45,
  			"PROJECT_NO"=>12312
}

ModCommon= {
			"MOD_COMMON"=>nil,
			"DEPOSIT_ABSOLUTE"=>nil,
			"BYTE_ORDER_MSB_LAST"=>nil,
			"ALIGNMENT_BYTE"=>1,
			"ALIGNMENT_WORD"=>2,
			"ALIGNMENT_LONG"=>4,
			"ALIGNMENT_FLOAT32"=>4,
			"ALIGNMENT_FLOAT64"=>4
}

#Initiate Only 1 Variable in the whole Configuration
#This Example is useless because in Real Time a Typical ECU will contain a minimum of 65000 to 2 Lakh Variables
#Measurement ={1=>{
#			"ECU_VARIABLE"=>"Variable 1",
#			"DESCRIPTION"=>"This is a Sample Description for this Variable",
#			"DATATYPE"=>"uint8",
#			"COMPU_METHOD"=>"Sample_Compu_Method",
#			"DEFAULT_MIN"=>0,
#			"DEFAULT_MAX"=>1,
#			"MINIMUM"=>-128,
#			"MAXIMUM"=>127,
#			"BITMASK"=>"0x0000FF",
#			"ECU_ADDRESS"=>"0x0000BB",
#			"INTERNAL_TYPE"=>"BYTE"
#}}

#
#				FOR CREATING MULTIPLE VARIABLES
#				
#In Order to Create One Such you have to use a Two Level Hashing
#Either you can use your variable or anonymous hashing to create multiple variables
#In our first case I have created two hashes
#First Hash Containing Key '1'
#Second Hash Containing Multiple keys from 'ECU_VARIABLE','DESCRIPTION' till 'INTERNAL_TYPE'
#The Key value in the First Hash does not matter.It can be anything like 'apple','dog','cement' anything
#But for Readability I have used number '1' as Key
#So like this you can create innumerous keys and variable details
#An Example Implementation is below for Multiple Variables
#
#Example : Create 10 Variables with Dummy Variable Details
#
#for i in 1..10
#  Variable_Details=Hash.new
#  Variable_Details["ECU_VARIABLE"]='Variable_Name'
#  Varible_Details["DATATYPE"]='asfdasf'
#  Measurement[i]=Variable_Details
#end
#
#
#The Above Snippet would do the work for you.But the trick is here you should think your own logic
#to update the Variable_Details Hash with your own Value

for i in 1..100
  Variable_Details=Hash.new
  Variable_Details["ECU_VARIABLE"]="Variable" + i.to_s
  Variable_Details["DESCRIPTION"]=i.to_s + "This is a Sample Description for this Variable"
  Variable_Details["DATATYPE"]="uint8" + i.to_s
  Variable_Details["COMPU_METHOD"]="Sample_Compu_Method" + i.to_s
  Variable_Details["DEFAULT_MIN"]=0
  Variable_Details["DEFAULT_MAX"]=1
  Variable_Details["MINIMUM"]=-128
  Variable_Details["MAXIMUM"]=127
  Variable_Details["BITMASK"]="0x0000FF"
  Variable_Details["ECU_ADDRESS"]="0x0000BB"
  Variable_Details["INTERNAL_TYPE"]="BYTE"
  Measurement[i]=Variable_Details
end

A2L.Generate

