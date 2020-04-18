# Parsing protocol files with parse_protocol.pl
## Goal
We want to parse the protocol files and extract as much information as possible:
- mapping between hexadecimal module type and the module name
- per module type:
  - mapping between the hexadecimal code and the message name and priority
- mapping between the hexadecimal code and the message name and priority for broadcast messages
- location of build week, build year, memory map, serial high and serial low in message 0xFF

## Install binary pdftotext
This tool converts pdf files to text files. Ubuntu install instructions:

```
sudo apt install poppler-utils
```

## How to use
Clone the github repository locally.

Go to the base of the repository and execute:

```
./bin/parse_protocol.pl
```

This will do 3 steps:
- convert the *.pdf files to *.txt files and save them in directory text
- read all the text/*.txt files
- parse the data

Errors are logged as ERROR.

Option -v can be used to get more verbose output.

## Format of the protocol files
-  The file start with a frontpage where the module type and text can be found.
-  The next page(s) contains an index that we don't need.
-  After the index comes a list of messages that we need. Every messages start with a line that begins with no space and contains some fixed text like "Received", "Transmit", ...
-  After the list of messages comes the Memory Map. We don't need this information.
-  Every file has a footer with some extra information about the protocol file.

When reading the txt files, this is taken into account:
- First line = module type
  - If the module type is VMBGP1, this is for VMBGP1, VMBGP2 and VMBGP4 so we set module type to VMBGPx
  - If the module type is VMBEL1, this is for VMBEL2, VMBEL1-and VMBEL4-2 so we set module type to VMBGPx
  - If the module type is VMBGP1-2, this is for VMBGP1-2, VMBGP2-2 and VMBGP4-2 so we set module type to VMBGPx-2
  - For module type VMBGPO, we discard the next 2 lines because it says 'VMBGPO & VMBGPTC
- Revision information is filtered out
- The rest of the file is stored per message:
  - A line with 1SID10-SID91 and regex `.+ priority)` means the start of a new message
- The content after `Memory Map` is discarded

## Parsing the data
When parsing the txt files and the messages, this is taken into account:
- A module type may occure only once
- We try to guess the type of message: broadcast, remote or local
  - Broadcast if if address is H'00'
  - Messages with this text are considered local:
    - Address of the module
    - Address set by hex switches
    - Module Address
    - Current module Address
    - Program location Address
    - Channel button address
    - Subaddress
  - The rest is considered a remote message
- We need to filter out the Command out of the DATABYTE1 definition. There are 3 sorts of DATABYTE1 definition formats:
  - DATABYTE1=(.+) \(H’(..)’\)
  - DATABYTE1 (.+) \(H’(..)’\)
  - DATABYTE1=(.+) \(0x(.+)\)
- For some commands, the name is not correct so we we overrule them:
  - COMMAND_BUS_ERROR_CONTER_STATUS_REQUEST: COMMAND_BUS_ERROR_COUNTER_STATUS_REQUEST
  - COMMAND_PUSHBUTTON_STATUS: COMMAND_PUSH_BUTTON_STATUS
  - COMMAND_MODULE_TYPE: COMMAND_MODULETYPE
  - COMMAND_SET_REALTIME_CLOCK: COMMAND_REALTIME_CLOCK_STATUS

In the second step we will re-parse the data:
- search the FF command and extract the Hex code for each module from DATABYE2
  - The format of DATABYTE2 is rather complex and differs a lot
  - VMBDMI-R is 15 in the protocol file but this is in reality 2F
  - We als search for the location of the serial (high and low), memory map and build (year and week)
    - for module VMB1TSW this is wrong in the protocol file so we set this hard coded in the script
  - We copy the data for some modules who have the same protocol file:
    - VMBGP1, VMBGP2 and VMBGP4
    - VMBEL1, VMBEL2 and VMBEL4
    - VMBGP1-2, VMBGP2-2 and VMBGP4-2
    - VMBEL1, VMBEL2 and VMBEL4
- Sort the messages per type: broadcast, remote and local
  - broadcast messages are not stored per module type but are considered the same for all modules

## Saving the data
The data is saved in the out folder.

- save all local messages
  - this is per module
  - Name, Info and Prio is saved
- save all broadcast messages
  - this is independent of the module
- save the hex type per module

# Extra information added to the data
The files in subdirectory data contains extra information.

This information is incorporated in the json file.

## data/Velbus_data.pm
This contains only the day of the week in text. It's just when the date and time is broadcasted on the bus

- {Cons}
  - {day number} = {day in text}

## data/Velbus_data_channels.pm
This files contains a list of posstible channel types. For each channel type, we define extra information:
- a Get Message: how can we get the state of this channel type?
  - if this is set, it contains the message that should be supported by the module type where this channel type is used. If the message is not supported, it's not possible to get the set of this type of channel.
  - if not set, it's always possible to query the state of this type of channel
- 1 of or more Set Message: how can we change the state of this channel type?
  - it defines the possible ways we can change the channel
  - it also defines the message we have to use to change the channel
  - optionally, it also defined the way we have to change the channel
    - POSITION | LEVEl
- list of modules: this channel type is restricted to a list of supported module types
- openHAB specific options

Some channel types are based on an other:
- ButtonLong is based on Button
  - These scripts are developed for OpenHAB and OpenHAB only suports ON or OF for a channel. So for a long press on a button, we create an extra copy of the item in OpenHAB. So each button has a 'Button' item and a 'ButtonLong' item
- CounterRaw, CounterCurrent and Divider are based on Counter
  - CounterRaw is the counter found in the module.
  - Divider is the divider configured for the channel
  - Counter = CounterRaw / Counter
  - CounterCurrent is calculated so it's in kWh or m3/hour

- ButtonCounter is Counter
  - this is for the modules where you can configure the channel as a counter or as a button
  - if Divider is defined: it's a counter, otherwise it's a button

This is a list of the channel types:
- Blind
- Button
- ButtonLong: based on Button
- ButtonCounter: behaves as Button or Counter
- Counter, CounterRaw, CounterCurrent, Divider
- Dimmer
- LightSensor
- Memo
- Relay
- Sensor
- SensorNumber
- Temperature
- ThermostatChannel, ThermostatCoHeMode, ThermostatMode, ThermostatTarget
- ELEdge, ELEdgeTop, ELEdgeRight, ELEdgeBottom, ELEdgeLeft, ELPalette, ELAction, ELColor, ELBrightness

## data/Velbus_data_protocol_channels.pm
This file defined the channels per module type.

Some channels are very similar. So we define them in $json{ModuleGeneral} and we insert them with $json{ModuleTypes}{<Module Type>}{General}

- per Channel:
  - Default channel name
  - Channel type
  - how to convert the channel number in the raw message to the channel number
    - this is configured with ChannelNumbers:
    - hex: take the number as hexadecimal and convert it to decimal
    - Map: if no easy conversion is available, we define a fixed mapping
- does the module contains a Thermostat
- AllChannelStatus: can we query the 'FF' Channel to get the status of each channel or do we need to query the channel individually
  

## data/Velbus_data_protocol_memory.pm
This file contains memory addresses per module type.

This depends on the build version so we have different sets of rules depending on the build versions.

- Module name
- Divider and units for Counter channel types
- Type of sensor for Sensor channel types
- Unit configured for VMB4AN channels

## data/Velbus_data_protocol_messages.pm
This files contains a list of messages per module type and how to interprete the messages.

Some definition sare very similar. So we define them in $json{ModuleGeneral}{Messages} and we insert them with $json{ModuleTypes}{<Module Type>}}{Messages}{<Message>}{General}

There a lot of options available, these are the most important ones:
- PerByte: parse the message per byte
  - Match: regex to match the byte
    - Name: the name 
    - Channel: the channel of the module
    - Value: the value of the channel state
    - Convert: how we have to convert the message to get the channel statep
    - openHAB: what to send to OpenHAB
- PerMessage: parse all the bytes in the message at once
  - this is for memo text and sensors
