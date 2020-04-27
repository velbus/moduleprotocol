$json{ChannelTypes}{Blind}{Get}{Message} = "EC" ;
$json{ChannelTypes}{Blind}{Set}{Match}{STOP}{Message}  = "04" ;
$json{ChannelTypes}{Blind}{Set}{Match}{UP}{Message}    = "05" ;
$json{ChannelTypes}{Blind}{Set}{Match}{DOWN}{Message}  = "06" ;
$json{ChannelTypes}{Blind}{Set}{Match}{'\d+'}{Message} = "1C" ;
$json{ChannelTypes}{Blind}{Set}{Match}{'\d+'}{Action}  = "POSITION" ; # Default Action = $Match
$json{ChannelTypes}{Blind}{openHAB}{ItemIcon}        = "rollershutter" ;
$json{ChannelTypes}{Blind}{openHAB}{ItemStateFormat} = "[%s %%]" ;
$json{ChannelTypes}{Blind}{openHAB}{ItemType}        = "Rollershutter" ;

$json{ChannelTypes}{Button}{Get}{Message} = "00" ;
$json{ChannelTypes}{Button}{Set}{Match}{ON}{Message}  = "00" ;
$json{ChannelTypes}{Button}{Set}{Match}{OFF}{Message} = "00" ;

# ButtonLong is the same as Button except for Append2Name
$json{ChannelTypes}{ButtonLong}{BasedOn} = "Button" ; # Copy of Button
$json{ChannelTypes}{ButtonLong}{openHAB}{Append2Name} = "Long" ;

$json{ChannelTypes}{Counter}{Get}{Message} = "BE" ;
$json{ChannelTypes}{Counter}{openHAB}{ItemIcon} = "chart" ;
$json{ChannelTypes}{Counter}{openHAB}{ItemType} = "Number" ;

$json{ChannelTypes}{CounterRaw}{BasedOn} = "Counter" ;
$json{ChannelTypes}{CounterRaw}{openHAB}{ItemIcon} = "chart" ;
$json{ChannelTypes}{CounterRaw}{openHAB}{ItemType} = "Number" ;

$json{ChannelTypes}{CounterCurrent}{BasedOn} = "Counter" ;
$json{ChannelTypes}{CounterCurrent}{openHAB}{ItemIcon} = "chart" ;
$json{ChannelTypes}{CounterCurrent}{openHAB}{ItemType} = "Number" ;

$json{ChannelTypes}{Divider}{BasedOn} = "Counter" ;
$json{ChannelTypes}{Divider}{openHAB}{ItemType} = "Number" ;

$json{ChannelTypes}{Dimmer}{Get}{Message} = "" ;
$json{ChannelTypes}{Dimmer}{Set}{Match}{'\d+\.?\d*'}{Message} = "07" ; # &dim_value
$json{ChannelTypes}{Dimmer}{Set}{Match}{'\d+\.?\d*'}{Action} = "LEVEL" ; # &dim_value, Default Action = $Match
$json{ChannelTypes}{Dimmer}{Set}{Match}{ON}{Message} = "07" ; # &dim_value
$json{ChannelTypes}{Dimmer}{Set}{Match}{ON}{Action} = "LEVEL" ; # &dim_value, Default Action = $Match
$json{ChannelTypes}{Dimmer}{Set}{Match}{OFF}{Message} = "07" ; # &dim_value
$json{ChannelTypes}{Dimmer}{Set}{Match}{OFF}{Action} = "LEVEL" ; # &dim_value, Default Action = $Match
$json{ChannelTypes}{Dimmer}{openHAB}{ItemIcon} = "slider" ;
$json{ChannelTypes}{Dimmer}{openHAB}{ItemStateFormat} = "[%s %%]" ;
$json{ChannelTypes}{Dimmer}{openHAB}{ItemType} = "Dimmer" ;

$json{ChannelTypes}{LightSensor}{openHAB}{ItemType} = "Number" ;
$json{ChannelTypes}{LightSensor}{openHAB}{ItemStateFormat} = "[%.0f]" ;

$json{ChannelTypes}{Memo}{Get}{Message} = "AC" ;
$json{ChannelTypes}{Memo}{Set}{Match}{'.*'}{Message} = "AC" ; # &send_memo
$json{ChannelTypes}{Memo}{Set}{Match}{''}{Message} = "AC" ; # &send_memo: allow empty message
$json{ChannelTypes}{Memo}{Modules} = "28,37" ; # This is the only ChannelType where we set the list of Modules manually because there is no channel for Memo. TODO: Create a channel for Memo so we can send and receive memo text remotely
$json{ChannelTypes}{Memo}{openHAB}{ItemType} = "String" ;

$json{ChannelTypes}{Relay}{Get}{Message} = "FB" ;
$json{ChannelTypes}{Relay}{Set}{Match}{ON}{Message} = "02" ; # &relay_on
$json{ChannelTypes}{Relay}{Set}{Match}{OFF}{Message} = "01" ; # &relay_off
$json{ChannelTypes}{Relay}{openHAB}{ItemIcon} = "switch" ;

$json{ChannelTypes}{Sensor}{Get}{Message} = "00" ;

$json{ChannelTypes}{SensorNumber}{Get}{Message} = "AC" ;
$json{ChannelTypes}{SensorNumber}{openHAB}{ItemType} = "Number" ;

$json{ChannelTypes}{LightSensor}{Get}{Message} = "ED" ;

$json{ChannelTypes}{Temperature}{Get}{Message} = "" ;
$json{ChannelTypes}{Temperature}{openHAB}{ItemIcon} = "temperature" ;
$json{ChannelTypes}{Temperature}{openHAB}{ItemStateFormat} = "[%.1f °C]" ;
$json{ChannelTypes}{Temperature}{openHAB}{ItemType} = "Number" ;

$json{ChannelTypes}{ThermostatChannel}{Get}{Message} = "00" ;

$json{ChannelTypes}{ThermostatCoHeMode}{BasedOn} = "Temperature" ;
$json{ChannelTypes}{ThermostatCoHeMode}{Set}{Match}{'[01]'}{Message} = "DF" ;
$json{ChannelTypes}{ThermostatCoHeMode}{openHAB}{ItemIcon} = "temperature" ;
$json{ChannelTypes}{ThermostatCoHeMode}{openHAB}{Append2Name} = "Cool/Heat mode" ;
$json{ChannelTypes}{ThermostatCoHeMode}{openHAB}{ItemType} = "Number" ;

$json{ChannelTypes}{ThermostatMode}{BasedOn} = "Temperature" ;
$json{ChannelTypes}{ThermostatMode}{Set}{Match}{'[1234]+'}{Message} = "DB" ;
$json{ChannelTypes}{ThermostatMode}{openHAB}{ItemIcon} = "temperature" ;
$json{ChannelTypes}{ThermostatMode}{openHAB}{Append2Name} = "mode" ;
$json{ChannelTypes}{ThermostatMode}{openHAB}{ItemType} = "Number" ;

$json{ChannelTypes}{ThermostatTarget}{BasedOn} = "Temperature" ;
$json{ChannelTypes}{ThermostatTarget}{Set}{Match}{'[\d.]+'}{Message} = "E4" ;
$json{ChannelTypes}{ThermostatTarget}{openHAB}{ItemIcon} = "temperature" ;
$json{ChannelTypes}{ThermostatTarget}{openHAB}{Append2Name} = "temperature target" ;
$json{ChannelTypes}{ThermostatTarget}{openHAB}{ItemStateFormat} = "[%.1f °C]" ;
$json{ChannelTypes}{ThermostatTarget}{openHAB}{ItemType} = "Number" ;

$json{ChannelTypes}{ELEdge}{Set}{Match}{'.+'}{Message} = "" ;
$json{ChannelTypes}{ELEdge}{Get}{Message} = "" ;
$json{ChannelTypes}{ELEdge}{Modules} = "34,35,36,37" ;
$json{ChannelTypes}{ELEdge}{openHAB}{ItemType} = "String" ;
$json{ChannelTypes}{ELEdge}{openHAB}{Append2Name} = "TLBR" ;

$json{ChannelTypes}{ELEdgeTop}{Set}{Match}{ON}{Message} = "" ;
$json{ChannelTypes}{ELEdgeTop}{Set}{Match}{OFF}{Message} = "" ;
$json{ChannelTypes}{ELEdgeTop}{Get}{Message} = "" ;
$json{ChannelTypes}{ELEdgeTop}{Modules} = "34,35,36,37" ;
$json{ChannelTypes}{ELEdgeTop}{openHAB}{Append2Name} = "Top" ;
$json{ChannelTypes}{ELEdgeTop}{openHAB}{SkipAutoUpdate} = "yes" ;

$json{ChannelTypes}{ELEdgeRight}{Set}{Match}{ON}{Message} = "" ;
$json{ChannelTypes}{ELEdgeRight}{Set}{Match}{OFF}{Message} = "" ;
$json{ChannelTypes}{ELEdgeRight}{Get}{Message} = "" ;
$json{ChannelTypes}{ELEdgeRight}{Modules} = "34,35,36,37" ;
$json{ChannelTypes}{ELEdgeRight}{openHAB}{Append2Name} = "Right" ;
$json{ChannelTypes}{ELEdgeRight}{openHAB}{SkipAutoUpdate} = "yes" ;

$json{ChannelTypes}{ELEdgeBottom}{Set}{Match}{ON}{Message} = "" ;
$json{ChannelTypes}{ELEdgeBottom}{Set}{Match}{OFF}{Message} = "" ;
$json{ChannelTypes}{ELEdgeBottom}{Get}{Message} = "" ;
$json{ChannelTypes}{ELEdgeBottom}{Modules} = "34,35,36,37" ;
$json{ChannelTypes}{ELEdgeBottom}{openHAB}{Append2Name} = "Bottom" ;
$json{ChannelTypes}{ELEdgeBottom}{openHAB}{SkipAutoUpdate} = "yes" ;

$json{ChannelTypes}{ELEdgeLeft}{Set}{Match}{ON}{Message} = "" ;
$json{ChannelTypes}{ELEdgeLeft}{Set}{Match}{OFF}{Message} = "" ;
$json{ChannelTypes}{ELEdgeLeft}{Get}{Message} = "" ;
$json{ChannelTypes}{ELEdgeLeft}{Modules} = "34,35,36,37" ;
$json{ChannelTypes}{ELEdgeLeft}{openHAB}{Append2Name} = "Left" ;
$json{ChannelTypes}{ELEdgeLeft}{openHAB}{SkipAutoUpdate} = "yes" ;

$json{ChannelTypes}{ELPalette}{Set}{Match}{"\\d+"}{Message} = "" ;
$json{ChannelTypes}{ELPalette}{Get}{Message} = "" ;
$json{ChannelTypes}{ELPalette}{openHAB}{ItemType} = "Number" ;
$json{ChannelTypes}{ELPalette}{Modules} = "34,35,36,37" ;
$json{ChannelTypes}{ELPalette}{openHAB}{Append2Name} = "Palette [%d]" ;
$json{ChannelTypes}{ELPalette}{openHAB}{SkipAutoUpdate} = "yes" ;

$json{ChannelTypes}{ELAction}{Set}{Match}{'[012]'}{Message} = "" ;
$json{ChannelTypes}{ELAction}{Get}{Message} = "" ;
$json{ChannelTypes}{ELAction}{openHAB}{ItemType} = "Number" ;
$json{ChannelTypes}{ELAction}{Modules} = "34,35,36,37" ;
$json{ChannelTypes}{ELAction}{openHAB}{Append2Name} = "Action" ;
$json{ChannelTypes}{ELAction}{openHAB}{SkipAutoUpdate} = "yes" ;

$json{ChannelTypes}{ELColor}{Set}{Match}{'\d+,\d+,\d+'}{Message} = "" ;
$json{ChannelTypes}{ELColor}{Set}{Match}{ON}{Message} = "" ;
$json{ChannelTypes}{ELColor}{Set}{Match}{OFF}{Message} = "" ;
$json{ChannelTypes}{ELColor}{Get}{Message} = "" ;
$json{ChannelTypes}{ELColor}{Modules} = "34,35,36,37" ;
$json{ChannelTypes}{ELColor}{openHAB}{Append2Name} = "Color" ;
$json{ChannelTypes}{ELColor}{openHAB}{ItemType} = "Color" ;
$json{ChannelTypes}{ELColor}{openHAB}{ItemIcon} = "Colorpicker" ;

$json{ChannelTypes}{ELBrightness}{Set}{Match}{'\d+'}{Message} = "" ;
$json{ChannelTypes}{ELBrightness}{Set}{Match}{ON}{Message} = "" ;
$json{ChannelTypes}{ELBrightness}{Set}{Match}{OFF}{Message} = "" ;
$json{ChannelTypes}{ELBrightness}{Get}{Message} = "" ;
$json{ChannelTypes}{ELBrightness}{Modules} = "34,35,36,37" ;

$json{ChannelTypes}{ELBrightness}{openHAB}{ItemIcon} = "slider" ;
$json{ChannelTypes}{ELBrightness}{openHAB}{ItemStateFormat} = "[%s %%]" ;
$json{ChannelTypes}{ELBrightness}{openHAB}{ItemType} = "Dimmer" ;
$json{ChannelTypes}{ELBrightness}{openHAB}{Append2Name} = "Brightness" ;
$json{ChannelTypes}{ELBrightness}{openHAB}{SkipAutoUpdate} = "yes" ;

# ButtonCounter in the config file is actually Counter. So merge Counter with ButtonCounter.
%{$json{ChannelTypes}{Counter}} = %{ merge( \%{$json{ChannelTypes}{Counter}}, \%{$json{ChannelTypes}{ButtonCounter}} ) };

# Loop all Channel Types
foreach my $ChannelType (sort keys %{$json{ChannelTypes}}) {
   # If this ChannelType is based on an other, take over te relelvant settings
   if ( defined $json{ChannelTypes}{$ChannelType}{BasedOn} ) {
      my $BasedOn = $json{ChannelTypes}{$ChannelType}{BasedOn} ;

      $json{ChannelTypes}{$ChannelType}{Modules} = $json{ChannelTypes}{$BasedOn}{Modules} ;
      %{$json{ChannelTypes}{$ChannelType}{Get}} = %{ merge( \%{$json{ChannelTypes}{$ChannelType}{Get}}, \%{$json{ChannelTypes}{$BasedOn}{Get}} ) } if $json{ChannelTypes}{$BasedOn}{Get} ;
      %{$json{ChannelTypes}{$ChannelType}{Set}} = %{ merge( \%{$json{ChannelTypes}{$ChannelType}{Set}}, \%{$json{ChannelTypes}{$BasedOn}{Set}} ) } if $json{ChannelTypes}{$BasedOn}{Set} ;
   }

   # Loop all Module Types to see what's supported based on the Message
   foreach my $ModuleType (sort split ",", $json{ChannelTypes}{$ChannelType}{Modules}) {
      if ( defined $json{ChannelTypes}{$ChannelType}{Get} ) {
         if ( $json{ChannelTypes}{$ChannelType}{Get}{Message} eq "" ) {
            $json{ChannelTypes}{$ChannelType}{Module}{$ModuleType}{Action}{Get} = "yes" ;
         } else {
            foreach my $Message (split ",", $json{ChannelTypes}{$ChannelType}{Get}{Message}) {
               if ( defined $json{ModuleTypes}{$ModuleType}{Messages}{$Message} and
                    defined $json{ModuleTypes}{$ModuleType}{Messages}{$Message}{Data} ) {
                  $json{ChannelTypes}{$ChannelType}{Module}{$ModuleType}{Action}{Get} = "yes" ;
               } else {
                  # print "NO MESSAGE: ChannelType=$ChannelType, ModuleType=$ModuleType, Message=$Message\n" ;
               }
            }
         }
      }

      if ( defined $json{ChannelTypes}{$ChannelType}{Set} ) {
         foreach my $Match (sort keys %{$json{ChannelTypes}{$ChannelType}{Set}{Match}} ) {
            my $Message = $json{ChannelTypes}{$ChannelType}{Set}{Match}{$Match}{Message} ;
            if ( defined $json{ModuleTypes}{$ModuleType}{Messages}{$Message} or $Message eq "" ) {
               $json{ChannelTypes}{$ChannelType}{Module}{$ModuleType}{Action}{Set} = "yes" ;
            } else {
               # print "NO SET: ChannelType=$ChannelType, ModuleType=$ModuleType, Match=$Match, Message=$Message\n" ;
            }
         }
      }
   }
}

return 1 ;
