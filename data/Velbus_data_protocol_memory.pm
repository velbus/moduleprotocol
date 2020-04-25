# This files contains all information needed when reading the memory of the modules.
# Some information like the name of the module can only be found by reading the memory.
# For some modules, different memory addresses are needed depending on the build of the module.
# The Memory Map Version is either detected when scanning for modules or it's based on the Build version.

# VMB1TC
$json{ModuleTypes}{'0E'}{MemoryMatch}{1}{Build}   = ">= 1" ;
$json{ModuleTypes}{'0E'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'0E'}{Memory}{1}{ModuleName} = "00F0-00FF" ;

# VMB1TS
$json{ModuleTypes}{'0C'}{MemoryMatch}{1}{Build}   = ">= 1" ;
$json{ModuleTypes}{'0C'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'0C'}{Memory}{1}{ModuleName} = "" ; # No support for ModuleName in the firmware

# VMB4RYLD
$json{ModuleTypes}{'10'}{MemoryMatch}{1}{Build}   = ">= 1409" ;
$json{ModuleTypes}{'10'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'10'}{Memory}{'1'}{ModuleName} = "00E3-00EF;01E3-01EF;02E3-02EF;03E3-03EF;04E3-04EE" ;

# VMB4RYNO
$json{ModuleTypes}{'11'}{MemoryMatch}{1}{Build}   = ">= 1409" ;
$json{ModuleTypes}{'11'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'11'}{Memory}{'1'}{ModuleName} = "00E3-00EF;01E3-01EF;02E3-02EF;03E3-03EF;04E3-04EE" ;

# VMB4DC
$json{ModuleTypes}{'12'}{MemoryMatch}{1}{Build}   = ">= 1509" ;
$json{ModuleTypes}{'12'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'12'}{Memory}{'1'}{ModuleName} = "00E0-00EF;01E0-01EF" ;

# VMBDMI
$json{ModuleTypes}{'15'}{MemoryMatch}{1}{Build}   = ">= 1410" ;
$json{ModuleTypes}{'15'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'15'}{Memory}{1}{ModuleName} = "00B0-00EF" ;

# VMBDMI-R
$json{ModuleTypes}{'2F'}{MemoryMatch}{1}{Build}   = ">= 1410" ;
$json{ModuleTypes}{'2F'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'2F'}{Memory}{1}{ModuleName} = "00B0-00EF" ;

# VMB8PBU
$json{ModuleTypes}{'16'}{MemoryMatch}{1}{Build}   = ">= 1409" ;
$json{ModuleTypes}{'16'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'16'}{Memory}{1}{ModuleName} = "03C0-03FF" ;

# VMB6PBN
$json{ModuleTypes}{'17'}{MemoryMatch}{1}{Build}   = ">= 1409" ;
$json{ModuleTypes}{'17'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'17'}{Memory}{1}{ModuleName} = "03C0-03FF" ;

# VMB2PBN
$json{ModuleTypes}{'18'}{MemoryMatch}{1}{Build}   = ">= 1409" ;
$json{ModuleTypes}{'18'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'18'}{Memory}{1}{ModuleName} = "03C0-03FF" ;

# VMB4RF
$json{ModuleTypes}{'1A'}{MemoryMatch}{1}{Build}   = ">= 1409" ;
$json{ModuleTypes}{'1A'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'1A'}{Memory}{1}{ModuleName} = "02C0-03FF" ;

# VMB1RYNO
$json{ModuleTypes}{'1B'}{MemoryMatch}{1}{Build}   = ">= 1409" ;
$json{ModuleTypes}{'1B'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'1B'}{Memory}{'1'}{ModuleName} = "00E3-00EF;01E3-01EF;02E3-02EF;03E3-03EF;04E3-04EE" ;

# VMB2BLE
$json{ModuleTypes}{'1D'}{MemoryMatch}{1}{Build}   = ">= 1409" ;
$json{ModuleTypes}{'1D'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'1D'}{Memory}{'1'}{ModuleName} = "004C-008B" ;

# VMBGP1D
$json{ModuleTypes}{'1E'}{MemoryMatch}{1}{Build}   = ">= 1415" ;
$json{ModuleTypes}{'1E'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'1E'}{Memory}{'1'}{ModuleName} = "03C0-03FF" ;
# VMBGP2D
$json{ModuleTypes}{'1F'}{MemoryMatch}{1}{Build}   = ">= 1415" ;
$json{ModuleTypes}{'1F'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'1F'}{Memory}{'1'}{ModuleName} = "03C0-03FF" ;
# VMBGP4D
$json{ModuleTypes}{'20'}{MemoryMatch}{1}{Build}   = ">= 1415" ;
$json{ModuleTypes}{'20'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'20'}{Memory}{'1'}{ModuleName} = "03C0-03FF" ;

# VMBGPO
$json{ModuleTypes}{'21'}{MemoryMatch}{1}{Build}   = "> 1" ;
$json{ModuleTypes}{'21'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'21'}{Memory}{'1'}{ModuleName} = "09BE-09FD" ;

# VMB7IN
$json{ModuleTypes}{'22'}{MemoryMatch}{1}{Build}   = ">= 1424" ;
$json{ModuleTypes}{'22'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'22'}{Memory}{'1'}{ModuleName} = "03AC-03EB" ;
$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'03FE'}{Match}{'1'}{'%......00'}{Value} = "reserved" ;
$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'03FE'}{Match}{'1'}{'%......01'}{Value} = "liter" ;
$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'03FE'}{Match}{'1'}{'%......10'}{Value} = "m3" ;
$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'03FE'}{Match}{'1'}{'%......11'}{Value} = "kWh" ;
$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'03FE'}{Match}{'1'}{'%......[01][01]'}{Channel} = "01" ;
$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'03FE'}{Match}{'1'}{'%......[01][01]'}{SubName} = "Unit" ;

$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'03FE'}{Match}{'2'}{'%....00..'}{Value} = "reserved" ;
$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'03FE'}{Match}{'2'}{'%....01..'}{Value} = "liter" ;
$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'03FE'}{Match}{'2'}{'%....10..'}{Value} = "m3" ;
$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'03FE'}{Match}{'2'}{'%....11..'}{Value} = "kWh" ;
$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'03FE'}{Match}{'2'}{'%....[01][01]..'}{Channel} = "02" ;
$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'03FE'}{Match}{'2'}{'%....[01][01]..'}{SubName} = "Unit" ;

$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'03FE'}{Match}{'3'}{'%..00....'}{Value} = "reserved" ;
$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'03FE'}{Match}{'3'}{'%..01....'}{Value} = "liter" ;
$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'03FE'}{Match}{'3'}{'%..10....'}{Value} = "m3" ;
$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'03FE'}{Match}{'3'}{'%..11....'}{Value} = "kWh" ;
$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'03FE'}{Match}{'3'}{'%..[01][01]....'}{Channel} = "03" ;
$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'03FE'}{Match}{'3'}{'%..[01][01]....'}{SubName} = "Unit" ;

$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'03FE'}{Match}{'4'}{'%00......'}{Value} = "reserved" ;
$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'03FE'}{Match}{'4'}{'%01......'}{Value} = "liter" ;
$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'03FE'}{Match}{'4'}{'%10......'}{Value} = "m3" ;
$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'03FE'}{Match}{'4'}{'%11......'}{Value} = "kWh" ;
$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'03FE'}{Match}{'4'}{'%[01][01]......'}{Channel} = "04" ;
$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'03FE'}{Match}{'4'}{'%[01][01]......'}{SubName} = "Unit" ;

$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'00E4'}{Match}{'1'}{'%........'}{Value} = "PulsePerUnits" ;
$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'00E4'}{Match}{'1'}{'%........'}{SubName} = "Divider" ;
$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'00E4'}{Match}{'1'}{'%........'}{Channel} = "01" ;

$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'00E9'}{Match}{'1'}{'%........'}{Value} = "PulsePerUnits" ;
$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'00E9'}{Match}{'1'}{'%........'}{SubName} = "Divider" ;
$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'00E9'}{Match}{'1'}{'%........'}{Channel} = "02" ;

$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'00EE'}{Match}{'1'}{'%........'}{Value} = "PulsePerUnits" ;
$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'00EE'}{Match}{'1'}{'%........'}{SubName} = "Divider" ;
$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'00EE'}{Match}{'1'}{'%........'}{Channel} = "03" ;

$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'00F3'}{Match}{'1'}{'%........'}{Value} = "PulsePerUnits" ;
$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'00F3'}{Match}{'1'}{'%........'}{SubName} = "Divider" ;
$json{ModuleTypes}{'22'}{Memory}{'1'}{Address}{'00F3'}{Match}{'1'}{'%........'}{Channel} = "04" ;

# VMBGPOD
$json{ModuleTypes}{'28'}{MemoryMatch}{1}{Build}   = ">= 1640" ;
$json{ModuleTypes}{'28'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'28'}{Memory}{'1'}{ModuleName} = "09BE-09FD" ;

# VMB1RYNOS
$json{ModuleTypes}{'29'}{MemoryMatch}{1}{Build}   = ">= 1" ;
$json{ModuleTypes}{'29'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'29'}{Memory}{1}{ModuleName} = "00E3-00EF;01E3-01EF;02E3-02EF;03E3-03EF;04E3-04EE" ;

# VMBPIRM
$json{ModuleTypes}{'2A'}{MemoryMatch}{1}{Build}   = ">= 1607" ;
$json{ModuleTypes}{'2A'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'2A'}{Memory}{'1'}{ModuleName} = "00B0-00EF" ;

# VMBPIRC
$json{ModuleTypes}{'2B'}{MemoryMatch}{1}{Build}   = ">= 1" ;
$json{ModuleTypes}{'2B'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'2B'}{Memory}{1}{ModuleName} = "00B0-00EF" ;

# VMBPIRO
$json{ModuleTypes}{'2C'}{MemoryMatch}{1}{Build}   = ">= 1519" ;
$json{ModuleTypes}{'2C'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'2C'}{Memory}{'1'}{ModuleName} = "00B0-00EF" ;
#$json{ModuleTypes}{'2C'}{Memory}{'1'}{SensorName}{'09'} = "0080-008F" ;
#$json{ModuleTypes}{'2C'}{Memory}{'1'}{SensorChannel} = "09" ; # Temperature sensor is CH9

# VMBGP4PIR
$json{ModuleTypes}{'2D'}{MemoryMatch}{1}{Build}   = ">= 1" ;
$json{ModuleTypes}{'2D'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'2D'}{Memory}{1}{ModuleName} = "03C0-03FF" ;

# VMB1BLS
$json{ModuleTypes}{'2E'}{MemoryMatch}{1}{Build}   = ">= 1" ;
$json{ModuleTypes}{'2E'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'2E'}{Memory}{1}{ModuleName} = "004C-008B" ;

# VMBMETEO
$json{ModuleTypes}{'31'}{MemoryMatch}{1}{Build}   = ">= 1" ;
$json{ModuleTypes}{'31'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'31'}{Memory}{1}{ModuleName} = "03C0-03FF" ;

# CH10 = temperature sensor
$json{ModuleTypes}{'31'}{Memory}{'1'}{SensorName}{'10'} = "03B0-03BF" ;
# CH11 = rain
$json{ModuleTypes}{'31'}{Memory}{'1'}{SensorName}{'11'} = "00C0-00CF" ;
# CH12 = light
$json{ModuleTypes}{'31'}{Memory}{'1'}{SensorName}{'12'} = "00D0-00DF" ;
# CH13 = wind
$json{ModuleTypes}{'31'}{Memory}{'1'}{SensorName}{'13'} = "00E0-00EF" ;

# VMB4AN
$json{ModuleTypes}{'32'}{MemoryMatch}{1}{Build}   = ">= 1" ;
$json{ModuleTypes}{'32'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'32'}{Memory}{1}{ModuleName} = "0000-003F" ;
$json{ModuleTypes}{'32'}{Memory}{'1'}{Unit}{'09'} = "02E0-02E6" ;
$json{ModuleTypes}{'32'}{Memory}{'1'}{Unit}{'10'} = "0412-0418" ;
$json{ModuleTypes}{'32'}{Memory}{'1'}{Unit}{'11'} = "0544-054A" ;
$json{ModuleTypes}{'32'}{Memory}{'1'}{Unit}{'12'} = "0676-067C" ;

# VMBVP1
$json{ModuleTypes}{'33'}{MemoryMatch}{1}{Build}   = ">= 1" ;
$json{ModuleTypes}{'33'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'33'}{Memory}{1}{ModuleName} = "00B0-00EF" ;

# VMBEL1
$json{ModuleTypes}{'34'}{MemoryMatch}{1}{Build}   = ">= 1" ;
$json{ModuleTypes}{'34'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'34'}{Memory}{1}{ModuleName} = "06C0-06CF" ;
# VMBEL2
$json{ModuleTypes}{'35'}{MemoryMatch}{1}{Build}   = ">= 1" ;
$json{ModuleTypes}{'35'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'35'}{Memory}{1}{ModuleName} = "06C0-06CF" ;
# VMBEL4
$json{ModuleTypes}{'36'}{MemoryMatch}{1}{Build}   = ">= 1" ;
$json{ModuleTypes}{'36'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'36'}{Memory}{1}{ModuleName} = "06C0-06CF" ;

# VMBELO
$json{ModuleTypes}{'37'}{MemoryMatch}{1}{Build}   = ">= 1" ;
$json{ModuleTypes}{'37'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'37'}{Memory}{1}{ModuleName} = "0F44-0F83" ;

# VMBGP1-2
$json{ModuleTypes}{'3A'}{MemoryMatch}{1}{Build}   = ">= 1" ;
$json{ModuleTypes}{'3A'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'3A'}{Memory}{1}{ModuleName} = "03C0-03FF" ;
# VMBGP2-2
$json{ModuleTypes}{'3B'}{MemoryMatch}{1}{Build}   = ">= 1" ;
$json{ModuleTypes}{'3B'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'3B'}{Memory}{1}{ModuleName} = "03C0-03FF" ;
# VMBGP4-2
$json{ModuleTypes}{'3C'}{MemoryMatch}{1}{Build}   = ">= 1" ;
$json{ModuleTypes}{'3C'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'3C'}{Memory}{1}{ModuleName} = "03C0-03FF" ;

# VMBGPOD-2
$json{ModuleTypes}{'3D'}{MemoryMatch}{1}{Build}   = ">= 1" ;
$json{ModuleTypes}{'3D'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'3D'}{Memory}{1}{ModuleName} = "09BE-09FD" ;

# VMBGP4PIR-2
$json{ModuleTypes}{'3E'}{MemoryMatch}{1}{Build}   = ">= 1" ;
$json{ModuleTypes}{'3E'}{MemoryMatch}{1}{Version} = "1" ;
$json{ModuleTypes}{'3E'}{Memory}{1}{ModuleName} = "03C0-03FF" ;

# Parse and rewrite the memory addresses for ModuleName and SensorName so we know for each possible memory address what it contains.
foreach my $ModuleType (sort keys %{$json{ModuleTypes}}) {
   if ( defined $json{ModuleTypes}{$ModuleType}{Memory} ) {
      foreach my $MemoryKey (sort keys %{$json{ModuleTypes}{$ModuleType}{Memory}}) {
         my @StatusAddress ; # List of all addresses per ModuleType with relevant information

         if ( defined $json{ModuleTypes}{$ModuleType}{Memory}{$MemoryKey}{ModuleName} and
                      $json{ModuleTypes}{$ModuleType}{Memory}{$MemoryKey}{ModuleName} ne ""  ) {
            my $counter = 0 ; # Number of address
            my $AddressHex ; # The address in hex

            foreach my $loop (split ";", $json{ModuleTypes}{$ModuleType}{Memory}{$MemoryKey}{ModuleName}) {
               my ($start,$end) = split "-", $loop ;
               $start = &hex_to_dec ($start) ;
               $end   = &hex_to_dec ($end) ;
               for ($i="$start"; $i <= "$end"; $i++) {
                  $AddressHex = &dec_to_4hex($i) ;
                  push @StatusAddress, $AddressHex ;
                  if ( $counter eq "0" ) {
                     # First address
                     $json{ModuleTypes}{$ModuleType}{Memory}{$MemoryKey}{Address}{$AddressHex}{ModuleName} = "$counter:Start" ;
                  } else {
                     $json{ModuleTypes}{$ModuleType}{Memory}{$MemoryKey}{Address}{$AddressHex}{ModuleName} = "$counter" ;
                  }
                  $counter ++ ;
               }
            }

            # Remember last adress
            $json{ModuleTypes}{$ModuleType}{Memory}{$MemoryKey}{Address}{$AddressHex}{ModuleName} = "$counter:Save" ;
         }

         if ( defined $json{ModuleTypes}{$ModuleType}{Memory}{$MemoryKey}{SensorName} ) {
            foreach my $Channel (sort keys %{$json{ModuleTypes}{$ModuleType}{Memory}{$MemoryKey}{SensorName}}) {
               my $counter = 0 ; # Number of address
               my $AddressHex ; # The address in hex

               foreach my $loop (split ";", $json{ModuleTypes}{$ModuleType}{Memory}{$MemoryKey}{SensorName}{$Channel}) {
                  my ($start,$end) = split "-", $loop ;
                  $start = &hex_to_dec ($start) ;
                  $end   = &hex_to_dec ($end) ;
                  for ($i="$start"; $i <= "$end"; $i++) {
                     $AddressHex = &dec_to_4hex($i) ;
                     push @StatusAddress, $AddressHex ;
                     if ( $counter eq "0" ) {
                        # First address
                        $json{ModuleTypes}{$ModuleType}{Memory}{$MemoryKey}{Address}{$AddressHex}{SensorName} = "$Channel:$counter:Start" ;
                     } else {
                        $json{ModuleTypes}{$ModuleType}{Memory}{$MemoryKey}{Address}{$AddressHex}{SensorName} = "$Channel:$counter" ;
                     }
                     $counter ++ ;
                  }
               }

               # Remember last adress
               $json{ModuleTypes}{$ModuleType}{Memory}{$MemoryKey}{Address}{$AddressHex}{SensorName} = "$Channel:$counter:Save" ;
            }
         }

         if ( defined $json{ModuleTypes}{$ModuleType}{Memory}{$MemoryKey}{Unit} ) {
            foreach my $Channel (sort keys %{$json{ModuleTypes}{$ModuleType}{Memory}{$MemoryKey}{Unit}}) {
               my $counter = 0 ; # Number of address
               my $AddressHex ; # The address in hex

               foreach my $loop (split ";", $json{ModuleTypes}{$ModuleType}{Memory}{$MemoryKey}{Unit}{$Channel}) {
                  #print "loop $loop\n" ;
                  my ($start,$end) = split "-", $loop ;
                  $start = &hex_to_dec ($start) ;
                  $end   = &hex_to_dec ($end) ;
                  for ($i="$start"; $i <= "$end"; $i++) {
                     $AddressHex = &dec_to_4hex($i) ;
                     push @StatusAddress, $AddressHex ;
                     if ( $counter eq "0" ) {
                        # First address
                        $json{ModuleTypes}{$ModuleType}{Memory}{$MemoryKey}{Address}{$AddressHex}{Unit} = "$Channel:$counter:Start" ;
                     } else {
                        $json{ModuleTypes}{$ModuleType}{Memory}{$MemoryKey}{Address}{$AddressHex}{Unit} = "$Channel:$counter" ;
                     }
                     $counter ++ ;
                  }
               }

               # Remember last adress
               $json{ModuleTypes}{$ModuleType}{Memory}{$MemoryKey}{Address}{$AddressHex}{Unit} = "$Channel:$counter:Save" ;
            }
         }

         if ( @StatusAddress ) {
            # Save all addresses for the get_status procedure
            $json{ModuleTypes}{$ModuleType}{Memory}{$MemoryKey}{StatusAddress} = join ";", @StatusAddress ;
         }
      }
   }
}

return 1 ;
