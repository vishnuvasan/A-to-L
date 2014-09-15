#Include all the Libraries necessary for A2L Rendering

require File.dirname(__FILE__)+"/A2L.rb"

# => I am more obsessed with Hashes and In Fact almost 95% of the operations
# => in this tool will entirely happen only in Hash
# => If you are not sure of What is a Hash,Please Read about Hashes in Wiki
# => Before Proceeding Further
# => Do no Change the Names of the Hashes used.If you are changing the Names
# => Then you should respectively be changing it in A2LRender.rb
# => Regrets Anyways!!!

#This works based on Different Hash Values
#These Hash Names are HardCoded Like Header,ModCommon,Measurement etc.,
#Based on these Hash Names the A2L will be rendered accordingly
#If you hate these Names and you want to update with your own Hashes then you should be poking 
#your head in to the Modules\A2L_Render.rb and Customizing the Hash Names for their Respective Template

Measurement1=Hash.new

# => Define the HEADER Details of the A2L
Header= {
  			"HEADER"=>"Sample A2L File",
  			"VERSION"=>45,
  			"PROJECT_NO"=>12312
}

# => Define the Common Module Details of the ECU
ModCommon= {
			"MOD_COMMON"=>nil,
			"DEPOSIT_ABSOLUTE"=>nil,
			"BYTE_ORDER"=>"MSB_LAST",
			"ALIGNMENT_BYTE"=>1,
			"ALIGNMENT_WORD"=>2,
			"ALIGNMENT_LONG"=>4,
			"ALIGNMENT_FLOAT32"=>4,
			"ALIGNMENT_FLOAT64"=>4
}

# => Initiate Only 1 Variable in the whole Configuration
# => This Example is useless because in Real Time 
# => a Typical ECU will contain a minimum of 65000 to 2 Lakh Variables

Measurement1 ={1=>{
			"ECU_VARIABLE"=>"Variable 1",
			"DESCRIPTION"=>"This is a Sample Description for this Variable",
			"DATATYPE"=>"uint8",
			"COMPU_METHOD"=>"Sample_Compu_Method",
			"DEFAULT_MIN"=>0,
			"DEFAULT_MAX"=>1,
			"MINIMUM"=>-128,
			"MAXIMUM"=>127,
			"BITMASK"=>"0x0000FF",
			"ECU_ADDRESS"=>"0x0000BB",
			"INTERNAL_TYPE"=>"BYTE",
			"USER_DEFINED"=>"You can give any comment as you wish.This will be appended as a comment in the Description"
}}

################################################################################################################
#									FOR CREATING MULTIPLE VARIABLES  																				
#				
# => In Order to Create One Such you have to use a Two Level Hashing
# => Either you can use your variable or anonymous hashing to create multiple variables
# => In our first case I have created two hashes
# => First Hash Containing Key '1'
# => Second Hash Containing Multiple keys from 'ECU_VARIABLE','DESCRIPTION' till 'INTERNAL_TYPE'
# => The Key value in the First Hash does not matter.It can be anything like 'apple','dog','cement' anything
# => But for Readability I have used number '1' as Key
# => So like this you can create innumerous keys and variable details
# => An Example Implementation is below for Multiple Variables
#
# => Example : Create 10 Variables with Dummy Variable Details
#
# => for i in 1..10
#  		Variable_Details=Hash.new
#  		Variable_Details["ECU_VARIABLE"]='Variable_Name'
#  		Varible_Details["DATATYPE"]='asfdasf'
#  		Measurement[i]=Variable_Details
# => end
#
#
# => The Above Snippet would do the work for you.But the trick is here you should think your own logic
# => to update the Variable_Details Hash with your own Value
################################################################################################################


for i in 2..100
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
  Variable_Details["USER_DEFINED"]="What the Hell is Happening" + i.to_s
  Measurement1[i]=Variable_Details
end


# => Initiate Only 1 Variable in the whole Configuration
# => This Example is useless because in Real Time 
# => a Typical ECU will contain a minimum of 65000 to 2 Lakh Variables

Characteristic1 ={1=>{
			"ECU_VARIABLE"=>"Variable 1",
			"DESCRIPTION"=>"This is a Sample Description for this Variable",
			"DATATYPE"=>"uint8",
			"COMPU_METHOD"=>"Sample_Compu_Method",
			"MAX_DIFF"=>0,
			"MINIMUM"=>-128,
			"MAXIMUM"=>127,
			"BITMASK"=>"0x0000FF",
			"ECU_ADDRESS"=>"0x0000BB",
			"INTERNAL_TYPE"=>"BYTE",
			"USER_DEFINED"=>"You can give any comment as you wish.This will be appended as a comment in the Description"
}}


# => Hash Containing the Interpolation values
Interpolation={1=>2,2=>456,3=>4,5=>6}

# => Hash Containing the Verbal Formula values
Verbal_Formula={1=>{2=>"Sawtooth"},2=>{789=>"Square Wave"},3=>{900=>"Sine wave"},5=>{1055=>"Cos Wave"}}
# => Verbal_Formula={1=>"ts",2=>"23",3=>"asdfasdf"}
# => If you are planning to use Verbal Formula Range then the Hashes should be 2 Level like
# => Verbal_Formula={
# => 		1=>{15=>"A"},  	# This will assign for Values from 1 to 15 as "A"
# => 		16=>{35=>"B"}}	# This will assign for Values from 16 to 35 as "B"

# Verbal_Formula={1=>"Sawtooth",2=>"Square Wave",3=>"Sine wave",5=>"Cos Wave"}
CompuMethod1={1=>{
		"NAME"=>"Sample Compu Method",
		"DESCRIPTION"=>"Sample Description for Compu Method",
		"COMPU_METHOD_TYPE"=>"TAB_VERB",
		"PHYSICAL_REP"=>"%56.6",
		"UNIT"=>"m/s",
		"COEFF_TYPE"=>"COEFFS",
		"COEFF_A"=>0,
		"COEFF_B"=>45,
		"COEFF_C"=>56,
		"COEFF_D"=>12313,
		"COEFF_E"=>13,
		"COEFF_F"=>10,
		"FORMULA"=>"X+4",
		"FORMULA_INV"=>"X-4",
		"COMPU_TAB_REF"=>"ABCD",
		"COMPU_TAB_DESCRIPTION"=>"Sample Tab Verb Formula",
		"INTERPOLATION"=>"DISABLE",
		"INTERPOLATION_VALUES"=>Interpolation, 
		"DEFAULT_VALUE"=>"55",
		"VERB_RANGE"=>"ENABLE",
		"COMPU_VTAB_VALUES"=>Verbal_Formula, 
		"DEFAULT_VALUE"=>""			
}}

CompuMethod1=Hash.new

for i in 2..100
  Compu_Details=Hash.new
  Compu_Details["NAME"]="Compu Method" + i.to_s
  Compu_Details["DESCRIPTION"]=i.to_s + "This is a Sample Description for this Compu Method"
  Compu_Details["COMPU_METHOD_TYPE"]=nil
  Compu_Details["PHYSICAL_REP"]="%4.5"
  Compu_Details["UNIT"]="No Unit" + " " + i.to_s
  Compu_Details["COEFF_TYPE"]="COEFFS"
  Compu_Details["COEFF_ 	A"]=i++
  Compu_Details["COEFF_B"]=i++
  Compu_Details["COEFF_C"]=i++
  Compu_Details["COEFF_D"]=i++
  Compu_Details["COEFF_E"]=i
  CompuMethod1[i]=Compu_Details
end


CCPConfig=Hash.new
CCPConfig["DESCRIPTOR_FOR_CCP"]="Welcome to CCP"


XCPConfig1=Hash.new

XCPConfig1["DESCRIPTOR_FOR_XCP"]="Hi and Welcome to XCP Configuration using A2L Generator"
XCPConfig1["ECU_ACCESS"]="ALLOWED"
XCPConfig1["XCP_READ_ACCESS"]="NOT ALLOWED"
XCPConfig1["XCP_WRITE_ACCESS"]="ALLOWED"
XCPConfig1["DAQ_SUPPORT"]=false

CANAPEIni=true
CreateIni=true
CANAPEExt=true
CANAPE_KWP_On_CAN=true
KWP2000_ETAS=true

A2L.Generate