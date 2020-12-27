###################
# Temperature sensor module: VMB1TS
$json{ModuleTypes}{'0C'}{Channels}{"01"}{Name} = "Temperature" ;
$json{ModuleTypes}{'0C'}{Channels}{"01"}{Type} = "Temperature" ;
$json{ModuleTypes}{'0C'}{Thermostat} = "yes" ;

# Do not add the extra channels! The code is written for Touch Panels and this will not work
#$json{ModuleTypes}{'0C'}{Channels}{"01"}{Name} = "Heater" ;
#$json{ModuleTypes}{'0C'}{Channels}{"01"}{Type} = "ThermostatChannel" ;
#$json{ModuleTypes}{'0C'}{Channels}{"02"}{Name} = "Boost Heater" ;
#$json{ModuleTypes}{'0C'}{Channels}{"02"}{Type} = "ThermostatChannel" ;
#$json{ModuleTypes}{'0C'}{Channels}{"03"}{Name} = "Central heating" ;
#$json{ModuleTypes}{'0C'}{Channels}{"03"}{Type} = "ThermostatChannel" ;
#$json{ModuleTypes}{'0C'}{Channels}{"04"}{Name} = "Cooler" ;
#$json{ModuleTypes}{'0C'}{Channels}{"04"}{Type} = "ThermostatChannel" ;
#$json{ModuleTypes}{'0C'}{Channels}{"05"}{Name} = "Pump" ;
#$json{ModuleTypes}{'0C'}{Channels}{"05"}{Type} = "ThermostatChannel" ;
#$json{ModuleTypes}{'0C'}{Channels}{"06"}{Name} = "Low alarm" ;
#$json{ModuleTypes}{'0C'}{Channels}{"06"}{Type} = "ThermostatChannel" ;
#$json{ModuleTypes}{'0C'}{Channels}{"07"}{Name} = "High alarm" ;
#$json{ModuleTypes}{'0C'}{Channels}{"07"}{Type} = "ThermostatChannel" ;

################### Relays: Channel names
# 1-channel relay module: VMB1RY
$json{ModuleTypes}{'02'}{Channels}{"01"}{Name} = "Relay" ;
$json{ModuleTypes}{'02'}{Channels}{"01"}{Type} = "Relay" ;

# 4-channel relay module: VMB4RY
$json{ModuleTypes}{'08'}{General} = "Relay4" ;

# 4-channel voltage-out relay module: VMB4RYLD
$json{ModuleTypes}{'10'}{General} = "Relay4" ;
$json{ModuleTypes}{'10'}{Channels}{"05"}{Name} = "Virtual relay" ;
$json{ModuleTypes}{'10'}{Channels}{"05"}{Type} = "Relay" ;

# 4-channel relay module: VMB4RYNO
$json{ModuleTypes}{'11'}{General} = "Relay4" ;
$json{ModuleTypes}{'11'}{Channels}{"05"}{Name} = "Virtual relay" ;
$json{ModuleTypes}{'11'}{Channels}{"05"}{Type} = "Relay" ;

# 1-channel relay module: VMB1RYNO
$json{ModuleTypes}{'1B'}{General} = "Relay1" ;

# 1 channel relay module: VMB1RYNOS
$json{ModuleTypes}{'29'}{General} = "Relay1" ;

# 1 channel relay module: VMB1RYS
$json{ModuleTypes}{'41'}{General} = "Relay1" ;
$json{ModuleTypes}{'41'}{Channels}{"05"}{Name} = "Virtual relay" ;
$json{ModuleTypes}{'41'}{Channels}{"05"}{Type} = "Relay" ;
$json{ModuleTypes}{'41'}{Channels}{"06"}{Name} = "Input button" ;
$json{ModuleTypes}{'41'}{Channels}{"06"}{Type} = "Button" ;

################### Dimmers: Channel names
# 1-channel 0(1)-10V control: VMB1DM
$json{ModuleTypes}{'07'}{Channels}{"01"}{Name} = "Dimmer" ;
$json{ModuleTypes}{'07'}{Channels}{"01"}{Type} = "Dimmer" ;

# 1-channel LED: VMB1LED
$json{ModuleTypes}{'0F'}{Channels}{"01"}{Name} = "Dimmer" ;
$json{ModuleTypes}{'0F'}{Channels}{"01"}{Type} = "Dimmer" ;

# 4-channel 0(1)-10V control: VMB4DC
$json{ModuleTypes}{'12'}{Channels}{"01"}{Name} = "Dimmer 1" ;
$json{ModuleTypes}{'12'}{Channels}{"01"}{Type} = "Dimmer" ;
$json{ModuleTypes}{'12'}{Channels}{"02"}{Name} = "Dimmer 2" ;
$json{ModuleTypes}{'12'}{Channels}{"02"}{Type} = "Dimmer" ;
$json{ModuleTypes}{'12'}{Channels}{"03"}{Name} = "Dimmer 3" ;
$json{ModuleTypes}{'12'}{Channels}{"03"}{Type} = "Dimmer" ;
$json{ModuleTypes}{'12'}{Channels}{"04"}{Name} = "Dimmer 4" ;
$json{ModuleTypes}{'12'}{Channels}{"04"}{Type} = "Dimmer" ;

# 1-channel Dimmer: VMBDME
$json{ModuleTypes}{'14'}{Channels}{"01"}{Name} = "Dimmer" ;
$json{ModuleTypes}{'14'}{Channels}{"01"}{Type} = "Dimmer" ;

# 1-channel Dimmer: VMBDMI
$json{ModuleTypes}{'15'}{Channels}{"01"}{Name} = "Dimmer" ;
$json{ModuleTypes}{'15'}{Channels}{"01"}{Type} = "Dimmer" ;

# 1-channel Dimmer: VMBDMI-R
$json{ModuleTypes}{'2F'}{Channels}{"01"}{Name} = "Dimmer" ;
$json{ModuleTypes}{'2F'}{Channels}{"01"}{Type} = "Dimmer" ;

################### Blinds: Channel names
# 1-channel blind control module: VMB1BL
$json{ModuleTypes}{'03'}{Channels}{"01"}{Name} = "Blind" ;
$json{ModuleTypes}{'03'}{Channels}{"01"}{Type} = "Blind" ;
$json{ModuleTypes}{'03'}{ChannelNumbers}{Name}{Map}{'03'} = "01" ; # 00000011 = 03 bin

# 2-channel blind control module: VMB2BL
$json{ModuleTypes}{'09'}{Channels}{"01"}{Name} = "Blind 1" ;
$json{ModuleTypes}{'09'}{Channels}{"01"}{Type} = "Blind" ;
$json{ModuleTypes}{'09'}{Channels}{"02"}{Name} = "Blind 2" ;
$json{ModuleTypes}{'09'}{Channels}{"02"}{Type} = "Blind" ;
$json{ModuleTypes}{'09'}{ChannelNumbers}{Name}{Map}{'03'} = "01" ; # 00000011 = 03 bin
$json{ModuleTypes}{'09'}{ChannelNumbers}{Name}{Map}{'0C'} = "02" ; # 00001100 = 12 bin = 0C hex

# 2-channel blind control module: VMB2BLE
$json{ModuleTypes}{'1D'}{Channels}{"01"}{Name} = "Blind 1" ;
$json{ModuleTypes}{'1D'}{Channels}{"01"}{Type} = "Blind" ;
$json{ModuleTypes}{'1D'}{Channels}{"02"}{Name} = "Blind 2" ;
$json{ModuleTypes}{'1D'}{Channels}{"02"}{Type} = "Blind" ;

# VMB1BLS (2E): 1 channel blind module
$json{ModuleTypes}{'2E'}{Channels}{"01"}{Name} = "Blind" ;
$json{ModuleTypes}{'2E'}{Channels}{"01"}{Type} = "Blind" ;

################### Touch panels: Channel names
# VMBGP1
$json{ModuleTypes}{'1E'}{General} = "Touch1 Touch124Temperature" ;

# VMBGP2
$json{ModuleTypes}{'1F'}{General} = "Touch2 Touch124Temperature" ;

# VMBGP4
$json{ModuleTypes}{'20'}{General} = "Touch4 Touch124Temperature" ;

# VMBGPO (21): Touch panel with Oled display
$json{ModuleTypes}{'21'}{General} = "TouchO TouchOTemperature" ;

# Four touch buttons with PIR detectormodule: VMBGP4PIR
$json{ModuleTypes}{'2D'}{General} = "Touch4 Touch124Temperature TouchPIR" ; # TouchPIR AFTER Touch4!

# Touch panel with Oled display: VMBGPOD
$json{ModuleTypes}{'28'}{General} = "TouchO TouchOTemperature" ;

# VMBEL1 (34): Edge-lit one, two or four touch buttons module
$json{ModuleTypes}{'34'}{General} = "TouchEdgeLit Touch1 TouchBEL124Temperature" ;

# VMBEL1 (35): Edge-lit one, two or four touch buttons module
$json{ModuleTypes}{'35'}{General} = "TouchEdgeLit Touch2 TouchBEL124Temperature" ;

# VMBEL1 (36): Edge-lit one, two or four touch buttons module
$json{ModuleTypes}{'36'}{General} = "TouchEdgeLit Touch4 TouchBEL124Temperature" ;

# VMBELO (37): Edge-lit touch panel with Oled display
$json{ModuleTypes}{'37'}{General} = "TouchEdgeLit TouchO TouchBELOTemperature" ;

# VMBELPIR (38): Edge-lit Motion detector with one touch button module
$json{ModuleTypes}{'38'}{General} = "TouchEdgeLit TouchBEL124Temperature" ;
$json{ModuleTypes}{'38'}{ChannelNumbers}{Name}{Convert} = "hex" ;
$json{ModuleTypes}{'38'}{AllChannelStatus} = "FF" ;
$json{ModuleTypes}{'38'}{ThermostatAddr} = "0" ;
$json{ModuleTypes}{'38'}{Channels}{"01"}{Name} = "Push button" ;
$json{ModuleTypes}{'38'}{Channels}{"01"}{Type} = "Button" ;
$json{ModuleTypes}{'38'}{Channels}{"02"}{Name} = "Virtual button" ;
$json{ModuleTypes}{'38'}{Channels}{"02"}{Type} = "Button" ;
$json{ModuleTypes}{'38'}{Channels}{"03"}{Name} = "Dark output" ;
$json{ModuleTypes}{'38'}{Channels}{"03"}{Type} = "Sensor" ;
$json{ModuleTypes}{'38'}{Channels}{"04"}{Name} = "Light output" ;
$json{ModuleTypes}{'38'}{Channels}{"04"}{Type} = "Sensor" ;
$json{ModuleTypes}{'38'}{Channels}{"05"}{Name} = "Motion output" ;
$json{ModuleTypes}{'38'}{Channels}{"05"}{Type} = "Sensor" ;
$json{ModuleTypes}{'38'}{Channels}{"06"}{Name} = "Motion output 1 (LD)" ;
$json{ModuleTypes}{'38'}{Channels}{"06"}{Type} = "Sensor" ;
$json{ModuleTypes}{'38'}{Channels}{"07"}{Name} = "Motion output 2 (LD)" ;
$json{ModuleTypes}{'38'}{Channels}{"07"}{Type} = "Sensor" ;
$json{ModuleTypes}{'38'}{Channels}{"08"}{Name} = "Absence output" ;
$json{ModuleTypes}{'38'}{Channels}{"08"}{Type} = "Sensor" ;

$json{ModuleTypes}{'38'}{Channels}{"99"}{Name} = "Light value" ;
$json{ModuleTypes}{'38'}{Channels}{"99"}{Type} = "LightSensor" ;

# VMBGP1-2 (3A): One, two or four touch buttons module (ed2)
$json{ModuleTypes}{'3A'}{General} = "Touch1 Touch124Temperature" ;

# VMBGP2-2 (3B): One, two or four touch buttons module (ed2)
$json{ModuleTypes}{'3B'}{General} = "Touch2 Touch124Temperature" ;

# VMBGP4-2 (3C): One, two or four touch buttons module (ed2)
$json{ModuleTypes}{'3C'}{General} = "Touch4 Touch124Temperature" ;

# VMBGPOD-2 (3D): Touch panel with Oled display (ed2)
$json{ModuleTypes}{'3D'}{General} = "TouchO TouchOTemperature" ;

# VMBGP4PIR-2 (3E): Four touch buttons with PIR detector module (ed2)
$json{ModuleTypes}{'3E'}{General} = "Touch4 Touch124Temperature TouchPIR" ; # TouchPIR AFTER Touch4!
 
################### Input: Channel names
# 8-channel Push button interface module: VMB8PB
$json{ModuleTypes}{'01'}{Channels}{"01"}{Name} = "Push button 1" ;
$json{ModuleTypes}{'01'}{Channels}{"01"}{Type} = "Button" ;
$json{ModuleTypes}{'01'}{Channels}{"02"}{Name} = "Push button 2" ;
$json{ModuleTypes}{'01'}{Channels}{"02"}{Type} = "Button" ;
$json{ModuleTypes}{'01'}{Channels}{"03"}{Name} = "Push button 3" ;
$json{ModuleTypes}{'01'}{Channels}{"03"}{Type} = "Button" ;
$json{ModuleTypes}{'01'}{Channels}{"04"}{Name} = "Push button 4" ;
$json{ModuleTypes}{'01'}{Channels}{"04"}{Type} = "Button" ;
$json{ModuleTypes}{'01'}{Channels}{"05"}{Name} = "Push button 5" ;
$json{ModuleTypes}{'01'}{Channels}{"05"}{Type} = "Button" ;
$json{ModuleTypes}{'01'}{Channels}{"06"}{Name} = "Push button 6" ;
$json{ModuleTypes}{'01'}{Channels}{"06"}{Type} = "Button" ;
$json{ModuleTypes}{'01'}{Channels}{"07"}{Name} = "Push button 7" ;
$json{ModuleTypes}{'01'}{Channels}{"07"}{Type} = "Button" ;
$json{ModuleTypes}{'01'}{Channels}{"08"}{Name} = "Push button 8" ;
$json{ModuleTypes}{'01'}{Channels}{"08"}{Type} = "Button" ;

# 6-channel input: VMB6IN
$json{ModuleTypes}{'05'}{Channels}{"01"}{Name} = "Push button 1" ;
$json{ModuleTypes}{'05'}{Channels}{"01"}{Type} = "Button" ;
$json{ModuleTypes}{'05'}{Channels}{"02"}{Name} = "Push button 2" ;
$json{ModuleTypes}{'05'}{Channels}{"02"}{Type} = "Button" ;
$json{ModuleTypes}{'05'}{Channels}{"03"}{Name} = "Push button 3" ;
$json{ModuleTypes}{'05'}{Channels}{"03"}{Type} = "Button" ;
$json{ModuleTypes}{'05'}{Channels}{"04"}{Name} = "Push button 4" ;
$json{ModuleTypes}{'05'}{Channels}{"04"}{Type} = "Button" ;
$json{ModuleTypes}{'05'}{Channels}{"05"}{Name} = "Push button 5" ;
$json{ModuleTypes}{'05'}{Channels}{"05"}{Type} = "Button" ;
$json{ModuleTypes}{'05'}{Channels}{"06"}{Name} = "Push button 6" ;
$json{ModuleTypes}{'05'}{Channels}{"06"}{Type} = "Button" ;

# 8-channel Push button interface module: VMB8PBU
$json{ModuleTypes}{'16'}{Channels}{"01"}{Name} = "Push button 1" ;
$json{ModuleTypes}{'16'}{Channels}{"01"}{Type} = "Button" ;
$json{ModuleTypes}{'16'}{Channels}{"02"}{Name} = "Push button 2" ;
$json{ModuleTypes}{'16'}{Channels}{"02"}{Type} = "Button" ;
$json{ModuleTypes}{'16'}{Channels}{"03"}{Name} = "Push button 3" ;
$json{ModuleTypes}{'16'}{Channels}{"03"}{Type} = "Button" ;
$json{ModuleTypes}{'16'}{Channels}{"04"}{Name} = "Push button 4" ;
$json{ModuleTypes}{'16'}{Channels}{"04"}{Type} = "Button" ;
$json{ModuleTypes}{'16'}{Channels}{"05"}{Name} = "Push button 5" ;
$json{ModuleTypes}{'16'}{Channels}{"05"}{Type} = "Button" ;
$json{ModuleTypes}{'16'}{Channels}{"06"}{Name} = "Push button 6" ;
$json{ModuleTypes}{'16'}{Channels}{"06"}{Type} = "Button" ;
$json{ModuleTypes}{'16'}{Channels}{"07"}{Name} = "Push button 7" ;
$json{ModuleTypes}{'16'}{Channels}{"07"}{Type} = "Button" ;
$json{ModuleTypes}{'16'}{Channels}{"08"}{Name} = "Push button 8" ;
$json{ModuleTypes}{'16'}{Channels}{"08"}{Type} = "Button" ;

# Push button module for 1 or 2 NIKO push buttons : VMB2PBN
$json{ModuleTypes}{'18'}{Channels}{"01"}{Name} = "Push button 1" ;
$json{ModuleTypes}{'18'}{Channels}{"01"}{Type} = "Button" ;
$json{ModuleTypes}{'18'}{Channels}{"02"}{Name} = "Push button 2" ;
$json{ModuleTypes}{'18'}{Channels}{"02"}{Type} = "Button" ;
$json{ModuleTypes}{'18'}{Channels}{"03"}{Name} = "Virtual button" ;
$json{ModuleTypes}{'18'}{Channels}{"03"}{Type} = "Button" ;
$json{ModuleTypes}{'18'}{Channels}{"04"}{Name} = "Virtual button" ;
$json{ModuleTypes}{'18'}{Channels}{"04"}{Type} = "Button" ;
$json{ModuleTypes}{'18'}{Channels}{"05"}{Name} = "Virtual button" ;
$json{ModuleTypes}{'18'}{Channels}{"05"}{Type} = "Button" ;
$json{ModuleTypes}{'18'}{Channels}{"06"}{Name} = "Virtual button" ;
$json{ModuleTypes}{'18'}{Channels}{"06"}{Type} = "Button" ;
$json{ModuleTypes}{'18'}{Channels}{"07"}{Name} = "Virtual button" ;
$json{ModuleTypes}{'18'}{Channels}{"07"}{Type} = "Button" ;
$json{ModuleTypes}{'18'}{Channels}{"08"}{Name} = "Virtual button" ;
$json{ModuleTypes}{'18'}{Channels}{"08"}{Type} = "Button" ;

# Push button interface module for 4 or 6 NIKO push buttons : VMB6PBN
$json{ModuleTypes}{'17'}{Channels}{"01"}{Name} = "Push button 1" ;
$json{ModuleTypes}{'17'}{Channels}{"01"}{Type} = "Button" ;
$json{ModuleTypes}{'17'}{Channels}{"02"}{Name} = "Push button 2" ;
$json{ModuleTypes}{'17'}{Channels}{"02"}{Type} = "Button" ;
$json{ModuleTypes}{'17'}{Channels}{"03"}{Name} = "Push button 3" ;
$json{ModuleTypes}{'17'}{Channels}{"03"}{Type} = "Button" ;
$json{ModuleTypes}{'17'}{Channels}{"04"}{Name} = "Push button 4" ;
$json{ModuleTypes}{'17'}{Channels}{"04"}{Type} = "Button" ;
$json{ModuleTypes}{'17'}{Channels}{"05"}{Name} = "Push button 5" ;
$json{ModuleTypes}{'17'}{Channels}{"05"}{Type} = "Button" ;
$json{ModuleTypes}{'17'}{Channels}{"06"}{Name} = "Push button 6" ;
$json{ModuleTypes}{'17'}{Channels}{"06"}{Type} = "Button" ;
$json{ModuleTypes}{'17'}{Channels}{"07"}{Name} = "Virtual button" ;
$json{ModuleTypes}{'17'}{Channels}{"07"}{Type} = "Button" ;
$json{ModuleTypes}{'17'}{Channels}{"08"}{Name} = "Virtual button" ;
$json{ModuleTypes}{'17'}{Channels}{"08"}{Type} = "Button" ;

# 7-channel input: VMB7IN
$json{ModuleTypes}{'22'}{Channels}{"01"}{Name} = "Push button 1" ;
$json{ModuleTypes}{'22'}{Channels}{"01"}{Type} = "ButtonCounter" ;
$json{ModuleTypes}{'22'}{Channels}{"02"}{Name} = "Push button 2" ;
$json{ModuleTypes}{'22'}{Channels}{"02"}{Type} = "ButtonCounter" ;
$json{ModuleTypes}{'22'}{Channels}{"03"}{Name} = "Push button 3" ;
$json{ModuleTypes}{'22'}{Channels}{"03"}{Type} = "ButtonCounter" ;
$json{ModuleTypes}{'22'}{Channels}{"04"}{Name} = "Push button 4" ;
$json{ModuleTypes}{'22'}{Channels}{"04"}{Type} = "ButtonCounter" ;
$json{ModuleTypes}{'22'}{Channels}{"05"}{Name} = "Push button 5" ;
$json{ModuleTypes}{'22'}{Channels}{"05"}{Type} = "Button" ;
$json{ModuleTypes}{'22'}{Channels}{"06"}{Name} = "Push button 6" ;
$json{ModuleTypes}{'22'}{Channels}{"06"}{Type} = "Button" ;
$json{ModuleTypes}{'22'}{Channels}{"07"}{Name} = "Push button 7" ;
$json{ModuleTypes}{'22'}{Channels}{"07"}{Type} = "Button" ;
$json{ModuleTypes}{'22'}{Channels}{"08"}{Name} = "Virtual button" ;
$json{ModuleTypes}{'22'}{Channels}{"08"}{Type} = "Button" ;

# Push button and timer panel: VMB4PD
$json{ModuleTypes}{'0B'}{Channels}{"01"}{Name} = "Push button 1" ;
$json{ModuleTypes}{'0B'}{Channels}{"01"}{Type} = "Button" ;
$json{ModuleTypes}{'0B'}{Channels}{"02"}{Name} = "Push button 2" ;
$json{ModuleTypes}{'0B'}{Channels}{"02"}{Type} = "Button" ;
$json{ModuleTypes}{'0B'}{Channels}{"03"}{Name} = "Push button 3" ;
$json{ModuleTypes}{'0B'}{Channels}{"03"}{Type} = "Button" ;
$json{ModuleTypes}{'0B'}{Channels}{"04"}{Name} = "Push button 4" ;
$json{ModuleTypes}{'0B'}{Channels}{"04"}{Type} = "Button" ;
$json{ModuleTypes}{'0B'}{Channels}{"05"}{Name} = "Push button 5" ;
$json{ModuleTypes}{'0B'}{Channels}{"05"}{Type} = "Button" ;
$json{ModuleTypes}{'0B'}{Channels}{"06"}{Name} = "Push button 6" ;
$json{ModuleTypes}{'0B'}{Channels}{"06"}{Type} = "Button" ;
$json{ModuleTypes}{'0B'}{Channels}{"07"}{Name} = "Push button 7" ;
$json{ModuleTypes}{'0B'}{Channels}{"07"}{Type} = "Button" ;
$json{ModuleTypes}{'0B'}{Channels}{"08"}{Name} = "Push button 8" ;
$json{ModuleTypes}{'0B'}{Channels}{"08"}{Type} = "Button" ;

################### PIR Sensors: Channel names
# Mini PIR sensor: VMBPIRM
$json{ModuleTypes}{'2A'}{General} = "PIR" ;
$json{ModuleTypes}{'2A'}{Channels}{"07"}{Name} = "Absence output" ;
$json{ModuleTypes}{'2A'}{Channels}{"07"}{Type} = "Sensor" ;
$json{ModuleTypes}{'2A'}{Channels}{"99"}{Name} = "Light value" ;
$json{ModuleTypes}{'2A'}{Channels}{"99"}{Type} = "LightSensor" ;

# 	VMBPIRC (2B): Ceiling PIR detector module
$json{ModuleTypes}{'2B'}{General} = "PIR" ;
$json{ModuleTypes}{'2B'}{Channels}{"07"}{Name} = "Absence output" ;
$json{ModuleTypes}{'2B'}{Channels}{"07"}{Type} = "Sensor" ;
$json{ModuleTypes}{'2B'}{Channels}{"99"}{Name} = "Light value" ;
$json{ModuleTypes}{'2B'}{Channels}{"99"}{Type} = "LightSensor" ;

# Outdoor PIR sensor: VMBPIRO
$json{ModuleTypes}{'2C'}{General} = "PIR" ;
$json{ModuleTypes}{'2C'}{ChannelNumbers}{Name}{Map}{'01'} = "09" ;
$json{ModuleTypes}{'2C'}{AllChannelStatus} = "FF" ;
$json{ModuleTypes}{'2C'}{Channels}{"07"}{Name} = "Low alarm" ;
$json{ModuleTypes}{'2C'}{Channels}{"07"}{Type} = "Sensor" ;
$json{ModuleTypes}{'2C'}{Channels}{"08"}{Name} = "High alarm" ;
$json{ModuleTypes}{'2C'}{Channels}{"08"}{Type} = "Sensor" ;
$json{ModuleTypes}{'2C'}{Channels}{"09"}{Name} = "Temperature" ;
$json{ModuleTypes}{'2C'}{Channels}{"09"}{Type} = "Temperature" ;
$json{ModuleTypes}{'2C'}{Channels}{"99"}{Name} = "Light value" ;
$json{ModuleTypes}{'2C'}{Channels}{"99"}{Type} = "LightSensor" ;

#	VMBMETEO (31): Meteo station
$json{ModuleTypes}{'31'}{ChannelNumbers}{SensorNumber}{Map}{'02'} = "11" ; # bin 00000010 = hex 02
$json{ModuleTypes}{'31'}{ChannelNumbers}{SensorNumber}{Map}{'04'} = "12" ; # bin 00000100 = hex 04
$json{ModuleTypes}{'31'}{ChannelNumbers}{SensorNumber}{Map}{'08'} = "13" ; # bin 00001000 = hex 08
$json{ModuleTypes}{'31'}{AllChannelStatus} = "FF" ;
$json{ModuleTypes}{'31'}{Channels}{"01"}{Name} = "Frost alarm" ;
$json{ModuleTypes}{'31'}{Channels}{"01"}{Type} = "Sensor" ;
$json{ModuleTypes}{'31'}{Channels}{"02"}{Name} = "Heat alarm" ;
$json{ModuleTypes}{'31'}{Channels}{"02"}{Type} = "Sensor" ;
$json{ModuleTypes}{'31'}{Channels}{"03"}{Name} = "Rain alarm" ;
$json{ModuleTypes}{'31'}{Channels}{"03"}{Type} = "Sensor" ;
$json{ModuleTypes}{'31'}{Channels}{"04"}{Name} = "Dawn alarm" ;
$json{ModuleTypes}{'31'}{Channels}{"04"}{Type} = "Sensor" ;
$json{ModuleTypes}{'31'}{Channels}{"05"}{Name} = "Dusk alarm" ;
$json{ModuleTypes}{'31'}{Channels}{"05"}{Type} = "Sensor" ;
$json{ModuleTypes}{'31'}{Channels}{"06"}{Name} = "Sun alarm" ;
$json{ModuleTypes}{'31'}{Channels}{"06"}{Type} = "Sensor" ;
$json{ModuleTypes}{'31'}{Channels}{"07"}{Name} = "Wind alarm" ;
$json{ModuleTypes}{'31'}{Channels}{"07"}{Type} = "Sensor" ;
$json{ModuleTypes}{'31'}{Channels}{"08"}{Name} = "Storm alarm" ;
$json{ModuleTypes}{'31'}{Channels}{"08"}{Type} = "Sensor" ;
$json{ModuleTypes}{'31'}{Channels}{"10"}{Name} = "Temperature" ;
$json{ModuleTypes}{'31'}{Channels}{"10"}{Type} = "Temperature" ;
$json{ModuleTypes}{'31'}{Channels}{"11"}{Name} = "Rainfall" ;
$json{ModuleTypes}{'31'}{Channels}{"11"}{Type} = "SensorNumber" ;
$json{ModuleTypes}{'31'}{Channels}{"12"}{Name} = "Illuminance" ;
$json{ModuleTypes}{'31'}{Channels}{"12"}{Type} = "SensorNumber" ;
$json{ModuleTypes}{'31'}{Channels}{"13"}{Name} = "Wind speed" ;
$json{ModuleTypes}{'31'}{Channels}{"13"}{Type} = "SensorNumber" ;

# VMB4AN: Analog I/O module
$json{ModuleTypes}{'32'}{ChannelNumbers}{Name}{Convert} = "hex" ;
$json{ModuleTypes}{'32'}{ChannelNumbers}{ConvertChannel}{Convert} = "hex" ;
$json{ModuleTypes}{'32'}{ChannelNumbers}{MakeMessage}{Convert} = "hex" ;
$json{ModuleTypes}{'32'}{AllChannelStatus} = "FF" ;
$json{ModuleTypes}{'32'}{Channels}{"01"}{Name} = "Alarm 1" ;
$json{ModuleTypes}{'32'}{Channels}{"01"}{Type} = "Sensor" ;
$json{ModuleTypes}{'32'}{Channels}{"02"}{Name} = "Alarm 2" ;
$json{ModuleTypes}{'32'}{Channels}{"02"}{Type} = "Sensor" ;
$json{ModuleTypes}{'32'}{Channels}{"03"}{Name} = "Alarm 3" ;
$json{ModuleTypes}{'32'}{Channels}{"03"}{Type} = "Sensor" ;
$json{ModuleTypes}{'32'}{Channels}{"04"}{Name} = "Alarm 4" ;
$json{ModuleTypes}{'32'}{Channels}{"04"}{Type} = "Sensor" ;
$json{ModuleTypes}{'32'}{Channels}{"05"}{Name} = "Alarm 5" ;
$json{ModuleTypes}{'32'}{Channels}{"05"}{Type} = "Sensor" ;
$json{ModuleTypes}{'32'}{Channels}{"06"}{Name} = "Alarm 6" ;
$json{ModuleTypes}{'32'}{Channels}{"06"}{Type} = "Sensor" ;
$json{ModuleTypes}{'32'}{Channels}{"07"}{Name} = "Alarm 7" ;
$json{ModuleTypes}{'32'}{Channels}{"07"}{Type} = "Sensor" ;
$json{ModuleTypes}{'32'}{Channels}{"08"}{Name} = "Alarm 8" ;
$json{ModuleTypes}{'32'}{Channels}{"08"}{Type} = "Sensor" ;
$json{ModuleTypes}{'32'}{Channels}{"09"}{Name} = "Sensor 1" ;
$json{ModuleTypes}{'32'}{Channels}{"09"}{Type} = "SensorNumber" ;
$json{ModuleTypes}{'32'}{Channels}{"10"}{Name} = "Sensor 2" ;
$json{ModuleTypes}{'32'}{Channels}{"10"}{Type} = "SensorNumber" ;
$json{ModuleTypes}{'32'}{Channels}{"11"}{Name} = "Sensor 3" ;
$json{ModuleTypes}{'32'}{Channels}{"11"}{Type} = "SensorNumber" ;
$json{ModuleTypes}{'32'}{Channels}{"12"}{Name} = "Sensor 4" ;
$json{ModuleTypes}{'32'}{Channels}{"12"}{Type} = "SensorNumber" ;

# VMBVP1 (33): Doorbird interface module
$json{ModuleTypes}{'33'}{Channels}{"01"}{Name} = "Motion 1" ;
$json{ModuleTypes}{'33'}{Channels}{"01"}{Type} = "Sensor" ;
$json{ModuleTypes}{'33'}{Channels}{"02"}{Name} = "Motion 2" ;
$json{ModuleTypes}{'33'}{Channels}{"02"}{Type} = "Sensor" ;
$json{ModuleTypes}{'33'}{Channels}{"03"}{Name} = "Bell 1" ;
$json{ModuleTypes}{'33'}{Channels}{"03"}{Type} = "Button" ;
$json{ModuleTypes}{'33'}{Channels}{"04"}{Name} = "Bell 2" ;
$json{ModuleTypes}{'33'}{Channels}{"04"}{Type} = "Button" ;
$json{ModuleTypes}{'33'}{Channels}{"05"}{Name} = "Door 1" ;
$json{ModuleTypes}{'33'}{Channels}{"05"}{Type} = "Sensor" ;
$json{ModuleTypes}{'33'}{Channels}{"06"}{Name} = "Door 2" ;
$json{ModuleTypes}{'33'}{Channels}{"06"}{Type} = "Sensor" ;
$json{ModuleTypes}{'33'}{Channels}{"07"}{Name} = "Virtual button 1" ;
$json{ModuleTypes}{'33'}{Channels}{"07"}{Type} = "Button" ;
$json{ModuleTypes}{'33'}{Channels}{"08"}{Name} = "Virtual button 2" ;
$json{ModuleTypes}{'33'}{Channels}{"08"}{Type} = "Button" ;

#################### General definitions that can be used in different modules
# 1 channel relay
$json{ModuleGeneral}{Relay1}{Channels}{"01"}{Name} = "Relay" ;
$json{ModuleGeneral}{Relay1}{Channels}{"01"}{Type} = "Relay" ;
$json{ModuleGeneral}{Relay1}{Channels}{"02"}{Name} = "Virtual relay 1" ;
$json{ModuleGeneral}{Relay1}{Channels}{"02"}{Type} = "Relay" ;
$json{ModuleGeneral}{Relay1}{Channels}{"03"}{Name} = "Virtual relay 2" ;
$json{ModuleGeneral}{Relay1}{Channels}{"03"}{Type} = "Relay" ;
$json{ModuleGeneral}{Relay1}{Channels}{"04"}{Name} = "Virtual relay 3" ;
$json{ModuleGeneral}{Relay1}{Channels}{"04"}{Type} = "Relay" ;
$json{ModuleGeneral}{Relay1}{Channels}{"05"}{Name} = "Virtual relay 4" ;
$json{ModuleGeneral}{Relay1}{Channels}{"05"}{Type} = "Relay" ;

# 4 channel relay
$json{ModuleGeneral}{Relay4}{Channels}{"01"}{Name} = "Relay 1" ;
$json{ModuleGeneral}{Relay4}{Channels}{"01"}{Type} = "Relay" ;
$json{ModuleGeneral}{Relay4}{Channels}{"02"}{Name} = "Relay 2" ;
$json{ModuleGeneral}{Relay4}{Channels}{"02"}{Type} = "Relay" ;
$json{ModuleGeneral}{Relay4}{Channels}{"03"}{Name} = "Relay 3" ;
$json{ModuleGeneral}{Relay4}{Channels}{"03"}{Type} = "Relay" ;
$json{ModuleGeneral}{Relay4}{Channels}{"04"}{Name} = "Relay 4" ;
$json{ModuleGeneral}{Relay4}{Channels}{"04"}{Type} = "Relay" ;

# Touch with 1 button: touch channels
$json{ModuleGeneral}{Touch1}{ChannelNumbers}{Name}{Convert} = "hex" ;
$json{ModuleGeneral}{Touch1}{AllChannelStatus} = "FF" ;
$json{ModuleGeneral}{Touch1}{ThermostatAddr} = "0" ;
$json{ModuleGeneral}{Touch1}{Channels}{"01"}{Name} = "Push button 1" ;
$json{ModuleGeneral}{Touch1}{Channels}{"01"}{Type} = "Button" ;
$json{ModuleGeneral}{Touch1}{Channels}{"02"}{Name} = "Virtual button 2" ;
$json{ModuleGeneral}{Touch1}{Channels}{"02"}{Type} = "Button" ;
$json{ModuleGeneral}{Touch1}{Channels}{"03"}{Name} = "Virtual button 3" ;
$json{ModuleGeneral}{Touch1}{Channels}{"03"}{Type} = "Button" ;
$json{ModuleGeneral}{Touch1}{Channels}{"04"}{Name} = "Virtual button 4" ;
$json{ModuleGeneral}{Touch1}{Channels}{"04"}{Type} = "Button" ;
$json{ModuleGeneral}{Touch1}{Channels}{"05"}{Name} = "Virtual button 5" ;
$json{ModuleGeneral}{Touch1}{Channels}{"05"}{Type} = "Button" ;
$json{ModuleGeneral}{Touch1}{Channels}{"06"}{Name} = "Virtual button 6" ;
$json{ModuleGeneral}{Touch1}{Channels}{"06"}{Type} = "Button" ;
$json{ModuleGeneral}{Touch1}{Channels}{"07"}{Name} = "Virtual button 7" ;
$json{ModuleGeneral}{Touch1}{Channels}{"07"}{Type} = "Button" ;
$json{ModuleGeneral}{Touch1}{Channels}{"08"}{Name} = "Virtual button 8" ;
$json{ModuleGeneral}{Touch1}{Channels}{"08"}{Type} = "Button" ;

# Touch with 2 buttons: touch channels
$json{ModuleGeneral}{Touch2}{ChannelNumbers}{Name}{Convert} = "hex" ;
$json{ModuleGeneral}{Touch2}{AllChannelStatus} = "FF" ;
$json{ModuleGeneral}{Touch2}{ThermostatAddr} = "0" ;
$json{ModuleGeneral}{Touch2}{Channels}{"01"}{Name} = "Push button 1" ;
$json{ModuleGeneral}{Touch2}{Channels}{"01"}{Type} = "Button" ;
$json{ModuleGeneral}{Touch2}{Channels}{"02"}{Name} = "Push button 2" ;
$json{ModuleGeneral}{Touch2}{Channels}{"02"}{Type} = "Button" ;
$json{ModuleGeneral}{Touch2}{Channels}{"03"}{Name} = "Virtual button 3" ;
$json{ModuleGeneral}{Touch2}{Channels}{"03"}{Type} = "Button" ;
$json{ModuleGeneral}{Touch2}{Channels}{"04"}{Name} = "Virtual button 4" ;
$json{ModuleGeneral}{Touch2}{Channels}{"04"}{Type} = "Button" ;
$json{ModuleGeneral}{Touch2}{Channels}{"05"}{Name} = "Virtual button 5" ;
$json{ModuleGeneral}{Touch2}{Channels}{"05"}{Type} = "Button" ;
$json{ModuleGeneral}{Touch2}{Channels}{"06"}{Name} = "Virtual button 6" ;
$json{ModuleGeneral}{Touch2}{Channels}{"06"}{Type} = "Button" ;
$json{ModuleGeneral}{Touch2}{Channels}{"07"}{Name} = "Virtual button 7" ;
$json{ModuleGeneral}{Touch2}{Channels}{"07"}{Type} = "Button" ;
$json{ModuleGeneral}{Touch2}{Channels}{"08"}{Name} = "Virtual button 8" ;
$json{ModuleGeneral}{Touch2}{Channels}{"08"}{Type} = "Button" ;

# Touch with 4 buttons: touch channels
$json{ModuleGeneral}{Touch4}{ChannelNumbers}{Name}{Convert} = "hex" ;
$json{ModuleGeneral}{Touch4}{AllChannelStatus} = "FF" ;
$json{ModuleGeneral}{Touch4}{ThermostatAddr} = "0" ;
$json{ModuleGeneral}{Touch4}{Channels}{"01"}{Name} = "Push button 1" ;
$json{ModuleGeneral}{Touch4}{Channels}{"01"}{Type} = "Button" ;
$json{ModuleGeneral}{Touch4}{Channels}{"02"}{Name} = "Push button 2" ;
$json{ModuleGeneral}{Touch4}{Channels}{"02"}{Type} = "Button" ;
$json{ModuleGeneral}{Touch4}{Channels}{"03"}{Name} = "Push button 3" ;
$json{ModuleGeneral}{Touch4}{Channels}{"03"}{Type} = "Button" ;
$json{ModuleGeneral}{Touch4}{Channels}{"04"}{Name} = "Push button 4" ;
$json{ModuleGeneral}{Touch4}{Channels}{"04"}{Type} = "Button" ;
$json{ModuleGeneral}{Touch4}{Channels}{"05"}{Name} = "Virtual button 5" ;
$json{ModuleGeneral}{Touch4}{Channels}{"05"}{Type} = "Button" ;
$json{ModuleGeneral}{Touch4}{Channels}{"06"}{Name} = "Virtual button 6" ;
$json{ModuleGeneral}{Touch4}{Channels}{"06"}{Type} = "Button" ;
$json{ModuleGeneral}{Touch4}{Channels}{"07"}{Name} = "Virtual button 7" ;
$json{ModuleGeneral}{Touch4}{Channels}{"07"}{Type} = "Button" ;
$json{ModuleGeneral}{Touch4}{Channels}{"08"}{Name} = "Virtual button 8" ;
$json{ModuleGeneral}{Touch4}{Channels}{"08"}{Type} = "Button" ;

# Touch with 1/2/4 buttons: temperature and thermostat channels
$json{ModuleGeneral}{Touch124Temperature}{ChannelNumbers}{Name}{Map}{'09'} = "10" ; # Temperature channel name is reported on CH09
$json{ModuleGeneral}{Touch124Temperature}{Channels}{"10"}{Name} = "Temperature" ;
$json{ModuleGeneral}{Touch124Temperature}{Channels}{"10"}{Type} = "Temperature" ;
$json{ModuleGeneral}{Touch124Temperature}{Channels}{"11"}{Name} = "Heater" ;
$json{ModuleGeneral}{Touch124Temperature}{Channels}{"11"}{Type} = "ThermostatChannel" ;
$json{ModuleGeneral}{Touch124Temperature}{Channels}{"12"}{Name} = "Boost" ;
$json{ModuleGeneral}{Touch124Temperature}{Channels}{"12"}{Type} = "ThermostatChannel" ;
$json{ModuleGeneral}{Touch124Temperature}{Channels}{"13"}{Name} = "Pump" ;
$json{ModuleGeneral}{Touch124Temperature}{Channels}{"13"}{Type} = "ThermostatChannel" ;
$json{ModuleGeneral}{Touch124Temperature}{Channels}{"14"}{Name} = "Cooler" ;
$json{ModuleGeneral}{Touch124Temperature}{Channels}{"14"}{Type} = "ThermostatChannel" ;
$json{ModuleGeneral}{Touch124Temperature}{Channels}{"15"}{Name} = "Alarm 1" ;
$json{ModuleGeneral}{Touch124Temperature}{Channels}{"15"}{Type} = "ThermostatChannel" ;
$json{ModuleGeneral}{Touch124Temperature}{Channels}{"16"}{Name} = "Alarm 2" ;
$json{ModuleGeneral}{Touch124Temperature}{Channels}{"16"}{Type} = "ThermostatChannel" ;
$json{ModuleGeneral}{Touch124Temperature}{Channels}{"17"}{Name} = "Alarm 3" ;
$json{ModuleGeneral}{Touch124Temperature}{Channels}{"17"}{Type} = "ThermostatChannel" ;
$json{ModuleGeneral}{Touch124Temperature}{Channels}{"18"}{Name} = "Alarm 4" ;
$json{ModuleGeneral}{Touch124Temperature}{Channels}{"18"}{Type} = "ThermostatChannel" ;

# Edge-lit touch with 1/2/4 buttons: temperature and thermostat channels
$json{ModuleGeneral}{TouchBEL124Temperature}{Channels}{"09"}{Name} = "Temperature" ;
$json{ModuleGeneral}{TouchBEL124Temperature}{Channels}{"09"}{Type} = "Temperature" ;
$json{ModuleGeneral}{TouchBEL124Temperature}{Channels}{"10"}{Name} = "Heater" ;
$json{ModuleGeneral}{TouchBEL124Temperature}{Channels}{"10"}{Type} = "ThermostatChannel" ;
$json{ModuleGeneral}{TouchBEL124Temperature}{Channels}{"11"}{Name} = "Boost" ;
$json{ModuleGeneral}{TouchBEL124Temperature}{Channels}{"11"}{Type} = "ThermostatChannel" ;
$json{ModuleGeneral}{TouchBEL124Temperature}{Channels}{"12"}{Name} = "Pump" ;
$json{ModuleGeneral}{TouchBEL124Temperature}{Channels}{"12"}{Type} = "ThermostatChannel" ;
$json{ModuleGeneral}{TouchBEL124Temperature}{Channels}{"13"}{Name} = "Cooler" ;
$json{ModuleGeneral}{TouchBEL124Temperature}{Channels}{"13"}{Type} = "ThermostatChannel" ;
$json{ModuleGeneral}{TouchBEL124Temperature}{Channels}{"14"}{Name} = "Alarm 1" ;
$json{ModuleGeneral}{TouchBEL124Temperature}{Channels}{"14"}{Type} = "ThermostatChannel" ;
$json{ModuleGeneral}{TouchBEL124Temperature}{Channels}{"15"}{Name} = "Alarm 2" ;
$json{ModuleGeneral}{TouchBEL124Temperature}{Channels}{"15"}{Type} = "ThermostatChannel" ;
$json{ModuleGeneral}{TouchBEL124Temperature}{Channels}{"16"}{Name} = "Alarm 3" ;
$json{ModuleGeneral}{TouchBEL124Temperature}{Channels}{"16"}{Type} = "ThermostatChannel" ;
$json{ModuleGeneral}{TouchBEL124Temperature}{Channels}{"17"}{Name} = "Alarm 4" ;
$json{ModuleGeneral}{TouchBEL124Temperature}{Channels}{"17"}{Type} = "ThermostatChannel" ;
$json{ModuleGeneral}{TouchBEL124Temperature}{Channels}{"18"}{Name} = "Output" ;
$json{ModuleGeneral}{TouchBEL124Temperature}{Channels}{"18"}{Type} = "Relay" ;

# Touch with PIR sensor: sensor channels
$json{ModuleGeneral}{TouchPIR}{Channels}{"05"}{Name} = "Dark/Light output" ;
$json{ModuleGeneral}{TouchPIR}{Channels}{"05"}{Type} = "Sensor" ;
$json{ModuleGeneral}{TouchPIR}{Channels}{"06"}{Name} = "Motion output" ;
$json{ModuleGeneral}{TouchPIR}{Channels}{"06"}{Type} = "Sensor" ;
$json{ModuleGeneral}{TouchPIR}{Channels}{"07"}{Name} = "Light Depending motion" ;
$json{ModuleGeneral}{TouchPIR}{Channels}{"07"}{Type} = "Sensor" ;
$json{ModuleGeneral}{TouchPIR}{Channels}{"08"}{Name} = "Absence output" ;
$json{ModuleGeneral}{TouchPIR}{Channels}{"08"}{Type} = "Sensor" ;
$json{ModuleGeneral}{TouchPIR}{Channels}{"99"}{Name} = "Light value" ;
$json{ModuleGeneral}{TouchPIR}{Channels}{"99"}{Type} = "LightSensor" ;

# Touch with OLED: touch channels
$json{ModuleGeneral}{TouchO}{ChannelNumbers}{Name}{Convert} = "hex" ;
$json{ModuleGeneral}{TouchO}{AllChannelStatus} = "FF" ;
$json{ModuleGeneral}{TouchO}{ThermostatAddr} = "3" ;
$json{ModuleGeneral}{TouchO}{Channels}{"01"}{Name} = "Push button 1" ;
$json{ModuleGeneral}{TouchO}{Channels}{"01"}{Type} = "Button" ;
$json{ModuleGeneral}{TouchO}{Channels}{"02"}{Name} = "Push button 2" ;
$json{ModuleGeneral}{TouchO}{Channels}{"02"}{Type} = "Button" ;
$json{ModuleGeneral}{TouchO}{Channels}{"03"}{Name} = "Push button 3" ;
$json{ModuleGeneral}{TouchO}{Channels}{"03"}{Type} = "Button" ;
$json{ModuleGeneral}{TouchO}{Channels}{"04"}{Name} = "Push button 4" ;
$json{ModuleGeneral}{TouchO}{Channels}{"04"}{Type} = "Button" ;
$json{ModuleGeneral}{TouchO}{Channels}{"05"}{Name} = "Push button 5" ;
$json{ModuleGeneral}{TouchO}{Channels}{"05"}{Type} = "Button" ;
$json{ModuleGeneral}{TouchO}{Channels}{"06"}{Name} = "Push button 6" ;
$json{ModuleGeneral}{TouchO}{Channels}{"06"}{Type} = "Button" ;
$json{ModuleGeneral}{TouchO}{Channels}{"07"}{Name} = "Push button 7" ;
$json{ModuleGeneral}{TouchO}{Channels}{"07"}{Type} = "Button" ;
$json{ModuleGeneral}{TouchO}{Channels}{"08"}{Name} = "Push button 8" ;
$json{ModuleGeneral}{TouchO}{Channels}{"08"}{Type} = "Button" ;
$json{ModuleGeneral}{TouchO}{Channels}{"09"}{Name} = "Push button 9" ;
$json{ModuleGeneral}{TouchO}{Channels}{"09"}{Type} = "Button" ;
$json{ModuleGeneral}{TouchO}{Channels}{"10"}{Name} = "Push button 10" ;
$json{ModuleGeneral}{TouchO}{Channels}{"10"}{Type} = "Button" ;
$json{ModuleGeneral}{TouchO}{Channels}{"11"}{Name} = "Push button 11" ;
$json{ModuleGeneral}{TouchO}{Channels}{"11"}{Type} = "Button" ;
$json{ModuleGeneral}{TouchO}{Channels}{"12"}{Name} = "Push button 12" ;
$json{ModuleGeneral}{TouchO}{Channels}{"12"}{Type} = "Button" ;
$json{ModuleGeneral}{TouchO}{Channels}{"13"}{Name} = "Push button 13" ;
$json{ModuleGeneral}{TouchO}{Channels}{"13"}{Type} = "Button" ;
$json{ModuleGeneral}{TouchO}{Channels}{"14"}{Name} = "Push button 14" ;
$json{ModuleGeneral}{TouchO}{Channels}{"14"}{Type} = "Button" ;
$json{ModuleGeneral}{TouchO}{Channels}{"15"}{Name} = "Push button 15" ;
$json{ModuleGeneral}{TouchO}{Channels}{"15"}{Type} = "Button" ;
$json{ModuleGeneral}{TouchO}{Channels}{"16"}{Name} = "Push button 16" ;
$json{ModuleGeneral}{TouchO}{Channels}{"16"}{Type} = "Button" ;
$json{ModuleGeneral}{TouchO}{Channels}{"17"}{Name} = "Push button 17" ;
$json{ModuleGeneral}{TouchO}{Channels}{"17"}{Type} = "Button" ;
$json{ModuleGeneral}{TouchO}{Channels}{"18"}{Name} = "Push button 18" ;
$json{ModuleGeneral}{TouchO}{Channels}{"18"}{Type} = "Button" ;
$json{ModuleGeneral}{TouchO}{Channels}{"19"}{Name} = "Push button 19" ;
$json{ModuleGeneral}{TouchO}{Channels}{"19"}{Type} = "Button" ;
$json{ModuleGeneral}{TouchO}{Channels}{"20"}{Name} = "Push button 10" ;
$json{ModuleGeneral}{TouchO}{Channels}{"20"}{Type} = "Button" ;
$json{ModuleGeneral}{TouchO}{Channels}{"21"}{Name} = "Push button 21" ;
$json{ModuleGeneral}{TouchO}{Channels}{"21"}{Type} = "Button" ;
$json{ModuleGeneral}{TouchO}{Channels}{"22"}{Name} = "Push button 22" ;
$json{ModuleGeneral}{TouchO}{Channels}{"22"}{Type} = "Button" ;
$json{ModuleGeneral}{TouchO}{Channels}{"23"}{Name} = "Push button 23" ;
$json{ModuleGeneral}{TouchO}{Channels}{"23"}{Type} = "Button" ;
$json{ModuleGeneral}{TouchO}{Channels}{"24"}{Name} = "Push button 24" ;
$json{ModuleGeneral}{TouchO}{Channels}{"24"}{Type} = "Button" ;
$json{ModuleGeneral}{TouchO}{Channels}{"25"}{Name} = "Push button 25" ;
$json{ModuleGeneral}{TouchO}{Channels}{"25"}{Type} = "Button" ;
$json{ModuleGeneral}{TouchO}{Channels}{"26"}{Name} = "Push button 26" ;
$json{ModuleGeneral}{TouchO}{Channels}{"26"}{Type} = "Button" ;
$json{ModuleGeneral}{TouchO}{Channels}{"27"}{Name} = "Push button 27" ;
$json{ModuleGeneral}{TouchO}{Channels}{"27"}{Type} = "Button" ;
$json{ModuleGeneral}{TouchO}{Channels}{"28"}{Name} = "Push button 28" ;
$json{ModuleGeneral}{TouchO}{Channels}{"28"}{Type} = "Button" ;
$json{ModuleGeneral}{TouchO}{Channels}{"29"}{Name} = "Push button 29" ;
$json{ModuleGeneral}{TouchO}{Channels}{"29"}{Type} = "Button" ;
$json{ModuleGeneral}{TouchO}{Channels}{"30"}{Name} = "Push button 30" ;
$json{ModuleGeneral}{TouchO}{Channels}{"30"}{Type} = "Button" ;
$json{ModuleGeneral}{TouchO}{Channels}{"31"}{Name} = "Push button 31" ;
$json{ModuleGeneral}{TouchO}{Channels}{"31"}{Type} = "Button" ;
$json{ModuleGeneral}{TouchO}{Channels}{"32"}{Name} = "Push button 32" ;
$json{ModuleGeneral}{TouchO}{Channels}{"32"}{Type} = "Button" ;
$json{ModuleGeneral}{TouchO}{Channels}{"98"}{Name} = "Memo Text" ;
$json{ModuleGeneral}{TouchO}{Channels}{"98"}{Type} = "Memo" ;

$json{ModuleGeneral}{TouchEdgeLit}{Channels}{"97"}{Name} = "Edge Lit" ;
$json{ModuleGeneral}{TouchEdgeLit}{Channels}{"97"}{Type} = "EdgeLit" ;

# Touch with OLED: temperature and thermostat channels
$json{ModuleGeneral}{TouchOTemperature}{ChannelNumbers}{Name}{Map}{'21'} = "34" ; # Temperature channel name is reported on CH33 (33 dec = 21 hex)
$json{ModuleGeneral}{TouchOTemperature}{Channels}{"34"}{Name} = "Temperature" ;
$json{ModuleGeneral}{TouchOTemperature}{Channels}{"34"}{Type} = "Temperature" ;
$json{ModuleGeneral}{TouchOTemperature}{Channels}{"35"}{Name} = "Heater" ;
$json{ModuleGeneral}{TouchOTemperature}{Channels}{"35"}{Type} = "ThermostatChannel" ;
$json{ModuleGeneral}{TouchOTemperature}{Channels}{"36"}{Name} = "Boost" ;
$json{ModuleGeneral}{TouchOTemperature}{Channels}{"36"}{Type} = "ThermostatChannel" ;
$json{ModuleGeneral}{TouchOTemperature}{Channels}{"37"}{Name} = "Pump" ;
$json{ModuleGeneral}{TouchOTemperature}{Channels}{"37"}{Type} = "ThermostatChannel" ;
$json{ModuleGeneral}{TouchOTemperature}{Channels}{"38"}{Name} = "Cooler" ;
$json{ModuleGeneral}{TouchOTemperature}{Channels}{"38"}{Type} = "ThermostatChannel" ;
$json{ModuleGeneral}{TouchOTemperature}{Channels}{"39"}{Name} = "Alarm 1" ;
$json{ModuleGeneral}{TouchOTemperature}{Channels}{"39"}{Type} = "ThermostatChannel" ;
$json{ModuleGeneral}{TouchOTemperature}{Channels}{"40"}{Name} = "Alarm 2" ;
$json{ModuleGeneral}{TouchOTemperature}{Channels}{"40"}{Type} = "ThermostatChannel" ;
$json{ModuleGeneral}{TouchOTemperature}{Channels}{"41"}{Name} = "Alarm 3" ;
$json{ModuleGeneral}{TouchOTemperature}{Channels}{"41"}{Type} = "ThermostatChannel" ;
$json{ModuleGeneral}{TouchOTemperature}{Channels}{"42"}{Name} = "Alarm 4" ;
$json{ModuleGeneral}{TouchOTemperature}{Channels}{"42"}{Type} = "ThermostatChannel" ;

# Touch with OLED: temperature and thermostat channels
$json{ModuleGeneral}{TouchBELOTemperature}{Channels}{"33"}{Name} = "Temperature" ;
$json{ModuleGeneral}{TouchBELOTemperature}{Channels}{"33"}{Type} = "Temperature" ;
$json{ModuleGeneral}{TouchBELOTemperature}{Channels}{"34"}{Name} = "Heater" ;
$json{ModuleGeneral}{TouchBELOTemperature}{Channels}{"34"}{Type} = "ThermostatChannel" ;
$json{ModuleGeneral}{TouchBELOTemperature}{Channels}{"35"}{Name} = "Boost" ;
$json{ModuleGeneral}{TouchBELOTemperature}{Channels}{"35"}{Type} = "ThermostatChannel" ;
$json{ModuleGeneral}{TouchBELOTemperature}{Channels}{"36"}{Name} = "Pump" ;
$json{ModuleGeneral}{TouchBELOTemperature}{Channels}{"36"}{Type} = "ThermostatChannel" ;
$json{ModuleGeneral}{TouchBELOTemperature}{Channels}{"37"}{Name} = "Cooler" ;
$json{ModuleGeneral}{TouchBELOTemperature}{Channels}{"37"}{Type} = "ThermostatChannel" ;
$json{ModuleGeneral}{TouchBELOTemperature}{Channels}{"38"}{Name} = "Alarm 1" ;
$json{ModuleGeneral}{TouchBELOTemperature}{Channels}{"38"}{Type} = "ThermostatChannel" ;
$json{ModuleGeneral}{TouchBELOTemperature}{Channels}{"39"}{Name} = "Alarm 2" ;
$json{ModuleGeneral}{TouchBELOTemperature}{Channels}{"39"}{Type} = "ThermostatChannel" ;
$json{ModuleGeneral}{TouchBELOTemperature}{Channels}{"40"}{Name} = "Alarm 3" ;
$json{ModuleGeneral}{TouchBELOTemperature}{Channels}{"40"}{Type} = "ThermostatChannel" ;
$json{ModuleGeneral}{TouchBELOTemperature}{Channels}{"41"}{Name} = "Alarm 4" ;
$json{ModuleGeneral}{TouchBELOTemperature}{Channels}{"41"}{Type} = "ThermostatChannel" ;
$json{ModuleGeneral}{TouchBELOTemperature}{Channels}{"42"}{Name} = "Output" ;
$json{ModuleGeneral}{TouchBELOTemperature}{Channels}{"42"}{Type} = "Relay" ;

# PIR sensor
$json{ModuleGeneral}{PIR}{Channels}{"01"}{Name} = "Dark output" ;
$json{ModuleGeneral}{PIR}{Channels}{"01"}{Type} = "Sensor" ;
$json{ModuleGeneral}{PIR}{Channels}{"02"}{Name} = "Light output" ;
$json{ModuleGeneral}{PIR}{Channels}{"02"}{Type} = "Sensor" ;
$json{ModuleGeneral}{PIR}{Channels}{"03"}{Name} = "Motion output 1" ;
$json{ModuleGeneral}{PIR}{Channels}{"03"}{Type} = "Sensor" ;
$json{ModuleGeneral}{PIR}{Channels}{"04"}{Name} = "Motion output 1 (LD)" ;
$json{ModuleGeneral}{PIR}{Channels}{"04"}{Type} = "Sensor" ;
$json{ModuleGeneral}{PIR}{Channels}{"05"}{Name} = "Motion output 2" ;
$json{ModuleGeneral}{PIR}{Channels}{"05"}{Type} = "Sensor" ;
$json{ModuleGeneral}{PIR}{Channels}{"06"}{Name} = "Motion output 2 (LD)" ;
$json{ModuleGeneral}{PIR}{Channels}{"06"}{Type} = "Sensor" ;

foreach my $ModuleType (sort keys %{$json{ModuleTypes}}) {
   # Merge the {General} information
   if ( defined $json{ModuleTypes}{$ModuleType}{General} ) {
      foreach my $GeneralType (split " ", $json{ModuleTypes}{$ModuleType}{General} ) { # No sort!
         if ( defined $json{ModuleGeneral}{$GeneralType} ) {
            %{$json{ModuleTypes}{$ModuleType}} = %{ merge( \%{$json{ModuleTypes}{$ModuleType}}, \%{$json{ModuleGeneral}{$GeneralType}} ) };
         }
      }
      # Delete internal info from the json
      delete $json{ModuleTypes}{$ModuleType}{General} ;
   }

   if ( $json{ModuleTypes}{$ModuleType}{Channels} ) {
      foreach my $Channel (sort keys %{$json{ModuleTypes}{$ModuleType}{Channels}}) {
         if ( defined $json{ModuleTypes}{$ModuleType}{Channels}{$Channel}{Type} ) {
            my $ChannelType = $json{ModuleTypes}{$ModuleType}{Channels}{$Channel}{Type} ;

            $json{ChannelTypes}{$ChannelType}{ModulesList}{$ModuleType} = "yes" ;  # Remember the channel types per module

            # Remember the Temperature channel for the module
            if ( $ChannelType eq "Temperature" ) {
               $json{ModuleTypes}{$ModuleType}{TemperatureChannel} = $Channel ;
            }

            # Mark channel name editable, this means it will respond to a channel name request
            if ( $ChannelType eq "Blind" or
                 $ChannelType eq "Button" or
                 $ChannelType eq "ButtonCounter" or
                 $ChannelType eq "Dimmer" or
                 $ChannelType eq "Relay" or
                 $ChannelType eq "Temperature" ) {
               if ( defined $json{ModuleTypes}{$ModuleType}{Messages}{'F0'} ) {
                  $json{ModuleTypes}{$ModuleType}{Channels}{$Channel}{Editable} = "yes" ;
               } else {
                  print "ERROR: ModuleType=$ModuleType=$json{ModuleTypes}{$ModuleType}{Type} ($json{ModuleTypes}{$ModuleType}{Info}), Channel=$Channel marked as Editable but no message F0 found for module type\n" ;
               }
            } elsif (
               # These types are not editable:
               $ChannelType eq "EdgeLit" or
               $ChannelType eq "LightSensor" or
               $ChannelType eq "Memo" or
               $ChannelType eq "Sensor" or
               $ChannelType eq "SensorNumber" or
               $ChannelType eq "ThermostatChannel" ) {
            } else {
               print "TODO: mark channel type $ChannelType as Editable or not\n" ;
            }
         
         } else {
            print "ERROR: no channel type for ModuleType=$ModuleType=$json{ModuleTypes}{$ModuleType}{Type} ($json{ModuleTypes}{$ModuleType}{Info}), Channel=$Channel\n" ;
         }
      }
   } else {
      print "No channels for ModuleType=$ModuleType=$json{ModuleTypes}{$ModuleType}{Type} ($json{ModuleTypes}{$ModuleType}{Info})\n" if defined $global{opts}{verbose} ;
   }

   # Delete internal info from the json
   if ( defined $json{ModuleTypes}{$ModuleType}{ChannelsEditable} ) {
      delete $json{ModuleTypes}{$ModuleType}{ChannelsEditable} ;
   }
}

foreach my $ChannelType (sort keys %{$json{ChannelTypes}} ) {
   my $Modules = join ",", sort keys %{$json{ChannelTypes}{$ChannelType}{ModulesList}} ;
   $json{ChannelTypes}{$ChannelType}{Modules} = $Modules ;
   # Delete internal info from the json
   delete $json{ChannelTypes}{$ChannelType}{ModulesList} ;
}

# Delete internal info from the json
delete $json{ModuleGeneral} ;

return 1 ;
