#!/usr/bin/perl

my %global ;

use Getopt::Long ;
&GetOptions (
             'verbose' => \$global{opts}{verbose} ,
             'help' => \$global{opts}{help} ) or &print_help ;

use Data::Dumper ;
$Data::Dumper::Sortkeys = 1 ; # Sort the keys in the output
$Data::Dumper::Deepcopy = 1 ; # Enable deep copies of structures
$Data::Dumper::Indent = 1 ;   # Output in a reasonable style (but no array indexes)

use lib "data" ;

our %json ;

# Helper function needed for Velbus_data_protocol_memory.pm
# This is copied from velserver/lib/Velbus/Velbus_helper.pm
# Needed in Velbus_data_protocol_memory
sub hex_to_dec {
   my $hex = $_[0] ;
   return hex ($hex) ;
}
sub dec_to_4hex {
   my $dec = $_[0] ;
   return sprintf ("%04X",$dec) ;
}

use Hash::Merge qw( merge );
use Velbus_data ;
use Velbus_data_channels ;
use Velbus_data_protocol_channels ;
use Velbus_data_protocol_memory ;
use Velbus_data_protocol_messages ;

use JSON ;

# Add a version to the json
my  ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime() ;
$year = $year+1900 ;
$mon += 1 ;
$mon  = "0" . $mon  if $mon  < 10 ;
$mday = "0" . $mday if $mday < 10 ;
print "$json{Version}\n" ;

`mkdir -p txt` ;

print "Convert pdf files to txt\n" ;
# Convert the pdf's to text
foreach my $pdf (sort `ls protocol*.pdf`) {
   chomp $pdf ;

   # skip pdf's that are not protocol files
   next if $pdf eq "protocol_vmb1rs.pdf" ;
   next if $pdf eq "protocol_vmb1usb.pdf" ;
   next if $pdf eq "protocol_vmb4pd_ir.pdf" ;
   next if $pdf eq "protocol_vmb4pd_ir_hexcodes.pdf" ;
   next if $pdf eq "protocol_vmbgpod_ir.pdf" ;
   next if $pdf eq "protocol_vmbgpod_ir_hexcodes.pdf" ;
   next if $pdf eq "protocol_vmbrsusb.pdf" ;

   # Skip some duplicate protocol files
   next if $pdf eq "protocol_vmb1tcw.pdf" ; # This is the same as protocol_vmb1tc.pdf
   next if $pdf eq "protocol_vmb1tsw.pdf" ; # This is the same as protocol_vmb1ts.pdf

   my $txt = $pdf ;
   $txt =~ s/\.pdf/.txt/g ;
   print "   - pdftotext -layout $pdf txt/$txt\n" if defined $global{opts}{verbose} ;
   `pdftotext -layout $pdf txt/$txt` ;
}

print "\n" ;
print "Read txt files\n" ;

my %file ; # Contains all raw info read from the files

# Loop all files and process the raw input.
foreach my $file (sort `ls txt/protocol*.txt`) {
   chomp $file ;
   print "   - $file\n" if defined $global{opts}{verbose} ;

   open (FILE,"<$file") ;
   my @file = <FILE> ;
   close FILE ;

   $file =~ s/txt\/// ;  # Remove the starting txt/ from file filename

   # First line of the file is the type of the module
   my $ModuleType = &clean (shift @file) ;
   if ( $ModuleType eq "VMBGP1" ) { # For VMBGP1, VMBGP2 and VMBGP4: the text is split on 3 lines
      $ModuleType = "VMBGPx" ;
      shift @file ; # VMBGP2
      shift @file ; # VMBGP4
   } elsif ( $ModuleType eq "VMBEL1" ) { # For VMBEL1, VMBEL2 and VMBEL4: the text is split on 3 lines
      $ModuleType = "VMBELx" ;
      shift @file ; # VMBEL2
      shift @file ; # VMBEL4:
   } elsif ( $ModuleType eq "VMBGP1-2" ) { # For VMBGP1-2, VMBGP2-3 and VMBGP4:-2: the text is split on 3 lines
      $ModuleType = "VMBGPx-2" ;
      shift @file ; # VMBGP2-2
      shift @file ; # VMBGP4-2
   } elsif ( $ModuleType eq "VMBGPO" ) { # For VMBGPO and VMBGPTC: the text is split on 3 lines
      shift @file ; # &
      shift @file ; # VMBGPTC
   } elsif ( $ModuleType eq "VMBSIG" ) { # For VMBSIG, VMBUSBIP and VMCM3
      $ModuleType = "VMBSIG-VMBUSBIP-VMCM3" ;
      shift @file ; # VMBUSBIP
      shift @file ; # VMCM3
   }
   $file{PerFile}{$file}{Info}{ModuleType} = $ModuleType ;

   # Second last line can be used to filter out the edition of the file
   &clean (pop @file) ;
   $file{PerFile}{$file}{Info}{Edition} = &clean (pop @file) ;
   if ( $file{PerFile}{$file}{Info}{Edition} =~ /(edition \d+ _ rev\d+)/ ) {
      $file{PerFile}{$file}{Info}{Edition} = $1 ;
   } elsif ( $file{PerFile}{$file}{Info}{Edition} =~ /(edition \d+)/ ) {
      $file{PerFile}{$file}{Info}{Edition} = $1 ;
   } elsif ( $file{PerFile}{$file}{Info}{Edition} =~ /(version \d+)/ ) {
      $file{PerFile}{$file}{Info}{Edition} = $1 ;
   } else {
      $file{PerFile}{$file}{Info}{Edition} = "" ;
   }

   # Second and optional the third line contains information about the module
   $file{PerFile}{$file}{Info}{ModuleText}  = &clean (shift @file) . " " ;
   $file{PerFile}{$file}{Info}{ModuleText} .= &clean (shift @file) ;
   $file{PerFile}{$file}{Info}{ModuleText} =~ s/PROTOCOL//g ; # Clean op some of the text
   $file{PerFile}{$file}{Info}{ModuleText} =~ s/for ?VELBUS ?system//ig ; # Clean op some of the text
   $file{PerFile}{$file}{Info}{ModuleText} =~ s/for ?VELBUS//ig ; # Clean op some of the text
   $file{PerFile}{$file}{Info}{ModuleText} =~ s/ +$//g ; # Clean op some of the text

   my $counter = 0 ; #  Counter will be incremented per found message

   my $previousline ;

   foreach my $line (@file) {
      chomp $line ;
      next if $line eq "" ; # Skip empty lines

      $line =~ s///g ; # Removing new page marker

      $line =~ s/^\s+//g ; # Remove spaces at start of line
      $line =~ s/\s+$//g ; # Remove spaces at end of line
      $line =~ s/\s+=\s+/=/g ; # Remove spaces around =

      # The page footer contains the text 'PROTOCOL –'.
      # The page footer contains some information about the version of the document
      if ( $line =~ /PROTOCOL –/ ) {
         if ( !defined $file{PerFile}{$file}{Info}{Version} ) {
            $file{PerFile}{$file}{Info}{Version} = &clean ($line) ;
         }
         next ;
      }

      my @split = split "=", $line ;
      # Priority of the message
      if ( $split[0] eq "SID10-SID9" ) {
         if ( $split[1] =~ /\((.+ priority)\)/ ) {
            $counter ++ ; # Incrementing the message counter
            $file{PerFile}{$file}{Messages}{$counter}{Prio} = $1 ;

            # The previous line is the tekst that belongs to this message
            $previousline =~ s/\(build\d+ or higher\)// ; # Filter out some unwanted text
            $previousline =~ s/\(build \d+ or higher\)// ; # Filter out some unwanted text
            $file{PerFile}{$file}{Messages}{$counter}{Info} = &clean($previousline) ;

         } else {
            print "Error: SID10-SID9 not correctly parsed: $line\n" ;
         }
      # Filtering out the address
      } elsif ( $split[0] eq "SID8...SID1" ) {
         $file{PerFile}{$file}{Messages}{$counter}{MessageAddress} .= $split[1] ;

      # Info about RTR in the message
      } elsif ( $split[0] eq "RTR" ) {
         $file{PerFile}{$file}{Messages}{$counter}{RTR} = $split[1] ;

      # Info about the databytes in the message
      } elsif ( $split[0] =~ /^DATABYTE/ ) {
         $file{PerFile}{$file}{Messages}{$counter}{DATABYTE} .= $line . "\n" ;

      } elsif ( $line =~ /Memory map:/i or
                $line =~ /Memory map build/i ) {
         last ;

      } else {
         $previousline = $line ;
      }
   }
}

print "\n" ;
print "Parse the data (1/2)\n" ;

my %data ; # Contains al parsed data

# Loop all the data we found in the files
foreach my $file (sort keys(%{$file{PerFile}})) {
   print "   - $file\n" if defined $global{opts}{verbose} ;
   my $ModuleType = $file{PerFile}{$file}{Info}{ModuleType} ; # Handier var

   # Make sure we see each ModuleType only once
   if ( defined $file{PerType}{$ModuleType} ) {
      print "Error: file $file: We already had type $ModuleType in file $file{PerType}{$ModuleType}{File}\n" ;
      next ;
   } else {
      $file{PerType}{$ModuleType}{File} = $file ; # Remember that we have seen the module
   }

   # Loop all the messages
   foreach my $counter (sort keys (%{$file{PerFile}{$file}{Messages}}) ) {
      # We need at least an address and text for each message
      if ( defined $file{PerFile}{$file}{Messages}{$counter}{MessageAddress} and
           defined $file{PerFile}{$file}{Messages}{$counter}{Info} ) {

         my $MessageAddress = $file{PerFile}{$file}{Messages}{$counter}{MessageAddress} ; # Handier var
         my $Info           = $file{PerFile}{$file}{Messages}{$counter}{Info} ;           # Handier var

         # Parse the info in $MessageAddress to find the type of address: broadcast, local or remote
         my $MessageAddressType ;
         if ( $MessageAddress eq 'H’00’' ) {
              $MessageAddressType = "broadcast" ;
         } elsif ( $MessageAddress =~ /^Address of the module/i or
                   $MessageAddress =~ /^Address set by hex switches/i or
                   $MessageAddress =~ /^Module Address/i or
                   $MessageAddress =~ /^Current module Address/i or
                   $MessageAddress =~ /^Program location Address/i or
                   $MessageAddress =~ /^Channel button address/i or
                   $MessageAddress =~ /Subaddress/i ) {
            $MessageAddressType = "local" ;
         } else {
            $MessageAddressType = "remote" ;
         }
         $file{PerFile}{$file}{Messages}{$counter}{MessageAddressType} = $MessageAddressType ; # Remember MessageAddressType

         # Remember the messages per MessageAddressType (broadcast, local of remote)
         # Can be used to check if the MessageAddressType is correct detected
         $file{PerMessageAddressTypeDebug}{$MessageAddressType}{$MessageAddress}{$file} .= $counter . " " ;

         $file{PerFile}{$file}{Messages}{$counter}{Info} =~ s/ \(Build.+ or higher\)//g ; # Filter out some unwanted text

         # Parse the Info to determine if the message is a message or a command and is it receive or transmit
         # "... command received:" The blind module can receive the following commands
         $file{PerFile}{$file}{Messages}{$counter}{Info} =~ s/://g ;
         #if (  $file{PerFile}{$file}{Messages}{$counter}{Info} =~ s/(.+) command received/$1/g ) {
         #   $MessageType = "ReceiveCommand" ;
         ## "... received:" The blind module can transmit the following messages
         #} elsif (  $file{PerFile}{$file}{Messages}{$counter}{Info} =~ s/(.+) received/$1/g ) {
         #   $MessageType = "ReceiveMessage" ;
         ## "Transmit: ... :" The blind module can transmit the following commands
         #} elsif (  $file{PerFile}{$file}{Messages}{$counter}{Info} =~ s/Transmit (.+)/$1/g )  {
         #   $MessageType = "TransmitCommand" ;
         ## "Transmits ... :" The blind module can transmit the following messages
         #} elsif (  $file{PerFile}{$file}{Messages}{$counter}{Info} =~ s/(Transmits .+)/$1/g )  {
         #   $MessageType = "TransmitMessage" ;
         #} else {
         #   print "REST $file{PerFile}{$file}{Messages}{$counter}{Info}\n" ;
         #}
         #$file{PerFile}{$file}{Messages}{$counter}{MessageType} = $MessageType if defined $MessageType ; # Remember MessageType

         # Priority....
         if ( $file{PerFile}{$file}{Messages}{$counter}{Prio} =~ /high/i ) {
            $file{PerFile}{$file}{Messages}{$counter}{Prio} = "High"
         } else {
            $file{PerFile}{$file}{Messages}{$counter}{Prio} = "Low"
         }

         # Parse the DATABYTE information
         foreach my $line (split "\n", $file{PerFile}{$file}{Messages}{$counter}{DATABYTE} ) {
            # First databyte contains the type of message
            if ( $line =~ /DATABYTE1/ ) {
               if ( $line =~ /DATABYTE1=(.+) \(H’(..)’\)/ or
                    $line =~ /DATABYTE1 (.+) \(H’(..)’\)/ or
                    $line =~ /DATABYTE1=(.+) \(0x(.+)\)/ or
                    $line =~ /DATABYTE1=(COMMAND_CANCEL_INHIBIT) \(0(17)\)/) {
                  my $CommandText = $1 ;
                  my $CommandHex  = $2 ;
                  # Some text corrections so we have the same text for the different modules
                  $CommandText = "COMMAND_BUS_ERROR_COUNTER_STATUS_REQUEST" if $CommandText eq "COMMAND_BUS_ERROR_CONTER_STATUS_REQUEST" ;
                  $CommandText = "COMMAND_PUSH_BUTTON_STATUS"               if $CommandText eq "COMMAND_PUSHBUTTON_STATUS" ;
                  $CommandText = "COMMAND_MODULETYPE"                       if $CommandText eq "COMMAND_MODULE_TYPE" ;
                  $CommandText = "COMMAND_REALTIME_CLOCK_STATUS"            if $CommandText eq "COMMAND_SET_REALTIME_CLOCK" ;

                  $file{PerFile}{$file}{Messages}{$counter}{CommandText} = $CommandText ;
                  $file{PerFile}{$file}{Messages}{$counter}{CommandHex}  = $CommandHex ;

                  # Remember the message per AdressType
                  $file{PerMessageAddressType}{$MessageAddressType}{$file} .= $counter . " " ;

                  # Remember per file the $CommandHex. We use this to quickly find message 'FF'.
                  # We need to make sure that the 'FF' message is for the local module and not for connected sensors
                  if ( $MessageAddressType eq "local" ) {
                     $file{PerCommandHex}{$file}{$CommandHex} .= $counter . " " ;
                  }

               } elsif ( $line =~ /SOF-SID10/ ) {
                  # Ignore
                  #  DATABYTE1: <SOF-SID10...SID0-RTR-IDE-r0-DLC3...0-DATABYTE1...DATABYTEn-CRC14...CRC1-CRCDEL-ACK-ACKDEL-
               } else {
                  print "Error: DATABYTE1 format not recognized: $line\n" ;
               }
            } else {
               if ( $line =~ /DATABYTE(\d)=(.+)/ ) {
                  my $DATABYTE = $1 ;
                  $file{PerFile}{$file}{Messages}{$counter}{byte}{$DATABYTE}{text} = $2 ;
                  if ( $line =~ /100%/ ) {
                     $file{PerFile}{$file}{Messages}{$counter}{byte}{$DATABYTE}{type} = "%" ;
                  }
               }
            }
         }
      } else {
         # Some error messages
         if ( ! defined $file{PerFile}{$file}{Messages}{$counter}{MessageAddress} ) {
            print "Error: file $file, MessageAddress missing for $counter\n" ;
         }
         if ( ! defined $file{PerFile}{$file}{Messages}{$counter}{Info} ) {
            print "Error: file $file, Info missing for $counter\n" ;
         }
         print Dumper \%{$file{PerFile}{$file}{Messages}{$counter}}
      }
   }
}

print "\n" ;
print "Parse the data (2/2)\n" ;

# Loop all the data we found in the files a second time.
# We search for MessageHex FF to find out the ModuleTypeHex.
# This time we will sort the data per CommandHex. We do this to filter out the broadcast messages.
`mkdir -p out` ;

foreach my $file (sort keys(%{$file{PerFile}})) {
   print "   - $file\n" if defined $global{opts}{verbose} ;

   my $ModuleType    = $file{PerFile}{$file}{Info}{ModuleType} ; # Handier var
   my $ModuleTypeHex ;

   # Parse CommandHex FF
   if ( defined $file{PerCommandHex}{$file}{'FF'} ) {
      my @counter = split " ", $file{PerCommandHex}{$file}{'FF'} ;
      my $counter = $counter[-1] ; # Take the last occurence of the command, this should be the one for the most recent firmware

      if ( defined $file{PerFile}{$file}{Messages}{$counter} ) {
         # filter out all possible formats for DATABYTE2
         if ( $file{PerFile}{$file}{Messages}{$counter}{byte}{'2'}{text} =~ /.+_TYPE.+\(H’(..)’\)/i or
              $file{PerFile}{$file}{Messages}{$counter}{byte}{'2'}{text} =~ /.+ TYPE.+\(H’(..)’\)/i or
              $file{PerFile}{$file}{Messages}{$counter}{byte}{'2'}{text} =~ /.+.+\(H’(..)’\)/i or
              $file{PerFile}{$file}{Messages}{$counter}{byte}{'2'}{text} =~ /.+ type \(0x(..)\)/i or
              $file{PerFile}{$file}{Messages}{$counter}{byte}{'2'}{text} =~ /type \(0x(..)/i ) {
            $ModuleTypeHex = $1 ;

            if ( $ModuleType eq "VMBDMI-R" ) {
               $ModuleTypeHex = "2F" ; # 15 in protocol file but the file is wrong
            }
            #if ( $ModuleType eq "VMBGPOD" ) { # In the pdf this is type 21, but this is wrong and should be type 28. I think...
            #   $ModuleTypeHex = "28" ;
            #}

            if ( defined $file{PerHexType}{$ModuleTypeHex} ) {
               print "Error: we have ModuleTypeHex=$ModuleTypeHex for $file, but we already have that ModuleTypeHex in $file{PerHexType}{$ModuleTypeHex}!\n" ;
               next ;
            }
            $file{PerHexType}{$ModuleTypeHex} = $file ; # Remember all the Hex Module Types
            $file{PerFile}{$file}{Info}{ModuleTypeHex} = $ModuleTypeHex ; # Remember the Hex value per ModuleType

            # Step 1: Search for extra info in the FF message
            if ( defined $file{PerFile}{$file}{Messages}{$counter}{byte} ) {
               # For VMB1TSW (0C) this is wrong in the protocol files
               if ( $ModuleTypeHex eq "0C" ) {
                  $file{ModuleType}{$ModuleTypeHex}{Messages}{FF}{Data}{SerialHigh} = "4" ;
                  $file{ModuleType}{$ModuleTypeHex}{Messages}{FF}{Data}{SerialLow}  = "5" ;
                  $file{ModuleType}{$ModuleTypeHex}{Messages}{FF}{Data}{MemoryMap}  = "6" ;
                  $file{ModuleType}{$ModuleTypeHex}{Messages}{FF}{Data}{BuildYear}  = "7" ;
                  $file{ModuleType}{$ModuleTypeHex}{Messages}{FF}{Data}{BuildWeek}  = "8" ;

               } else {
                  foreach my $DATABYTE (sort keys %{$file{PerFile}{$file}{Messages}{$counter}{byte}}) {
                     next if $DATABYTE eq "2" ;
                     if ( $file{PerFile}{$file}{Messages}{$counter}{byte}{$DATABYTE}{text} =~ /Memorymap version/ or
                          $file{PerFile}{$file}{Messages}{$counter}{byte}{$DATABYTE}{text} =~ /Memory map version/ ) {
                        $file{ModuleType}{$ModuleTypeHex}{Messages}{FF}{Data}{MemoryMap} = $DATABYTE ;
                     } elsif ( $file{PerFile}{$file}{Messages}{$counter}{byte}{$DATABYTE}{text} =~ /High byte of serial number/ or
                               $file{PerFile}{$file}{Messages}{$counter}{byte}{$DATABYTE}{text} =~ /Serial number high/ ) {
                        $file{ModuleType}{$ModuleTypeHex}{Messages}{FF}{Data}{SerialHigh} = $DATABYTE ;
                     } elsif ( $file{PerFile}{$file}{Messages}{$counter}{byte}{$DATABYTE}{text} =~ /Low byte of serial number/ or
                               $file{PerFile}{$file}{Messages}{$counter}{byte}{$DATABYTE}{text} =~ /Serial number low/ ) {
                        $file{ModuleType}{$ModuleTypeHex}{Messages}{FF}{Data}{SerialLow} = $DATABYTE ;
                     } elsif ( $file{PerFile}{$file}{Messages}{$counter}{byte}{$DATABYTE}{text} =~ /Build year/i ) {
                        $file{ModuleType}{$ModuleTypeHex}{Messages}{FF}{Data}{BuildYear} = $DATABYTE ;
                     } elsif ( $file{PerFile}{$file}{Messages}{$counter}{byte}{$DATABYTE}{text} =~ /Build week/i ) {
                        $file{ModuleType}{$ModuleTypeHex}{Messages}{FF}{Data}{BuildWeek} = $DATABYTE ;
                     } elsif ( $file{PerFile}{$file}{Messages}{$counter}{byte}{$DATABYTE}{text} =~ /don’t care/i ) {
                     } else {
                        #print "Warning: DATABYTE=$DATABYTE = \"$file{PerFile}{$file}{Messages}{$counter}{byte}{$DATABYTE}{text}\" in $file\n" ;
                     }
                  }
               }
            }

            # Step 2: Save relevant data
            $file{ModuleType}{$ModuleTypeHex}{File}    = $file ;
            $file{ModuleType}{$ModuleTypeHex}{Type}    = $ModuleType ;
            $file{ModuleType}{$ModuleTypeHex}{Info}    = $file{PerFile}{$file}{Info}{ModuleText} ;
            $file{ModuleType}{$ModuleTypeHex}{Version} = $file{PerFile}{$file}{Info}{Edition} ;

            # Step 3: copy the found data for the modules that are described in the same protocol file
            # VMBGP1 = 1E: from pdf file
            # VMBGP2 = 1F: ??
            # VMBGP4 = 20: from my bus
            if ( $ModuleTypeHex eq "1E" ) {
               %{$file{ModuleType}{'1F'}} = %{$file{ModuleType}{'1E'}} ;
               %{$file{ModuleType}{'20'}} = %{$file{ModuleType}{'1E'}} ;

               $file{ModuleType}{'1E'}{Type} = "VMBGP1" ;
               $file{ModuleType}{'1F'}{Type} = "VMBGP2" ;
               $file{ModuleType}{'20'}{Type} = "VMBGP4" ;

            # VMBEL1 = 34
            # VMBEL2 = 35
            # VMBEL4 = 36
            } elsif ( $ModuleTypeHex eq "34" ) {
               %{$file{ModuleType}{'35'}} = %{$file{ModuleType}{'34'}} ;
               %{$file{ModuleType}{'36'}} = %{$file{ModuleType}{'34'}} ;

               $file{ModuleType}{'34'}{Type} = "VMBEL1" ;
               $file{ModuleType}{'35'}{Type} = "VMBEL2" ;
               $file{ModuleType}{'36'}{Type} = "VMBEL4" ;

            # VMBGP1-2 = 3A
            # VMBGP2-2 = 3B
            # VMBGP4-2 = 3C
            } elsif ( $ModuleTypeHex eq "3C" ) {
               %{$file{ModuleType}{'3A'}} = %{$file{ModuleType}{'3C'}} ;
               %{$file{ModuleType}{'3B'}} = %{$file{ModuleType}{'3C'}} ;

               $file{ModuleType}{'3A'}{Type} = "VMBGP1-2" ;
               $file{ModuleType}{'3B'}{Type} = "VMBGP2-2" ;
               $file{ModuleType}{'3C'}{Type} = "VMBGP4-2" ;

            # VMBSIG = 39
            # VMBUSBIP = 40
            # VMCM3 = 3F
            } elsif ( $ModuleTypeHex eq "3F" ) {
               %{$file{ModuleType}{'39'}} = %{$file{ModuleType}{'3F'}} ;
               %{$file{ModuleType}{'40'}} = %{$file{ModuleType}{'3F'}} ;

               $file{ModuleType}{'39'}{Type} = "VMCM3" ;
               $file{ModuleType}{'3F'}{Type} = "VMBUSBIP" ;
               $file{ModuleType}{'40'}{Type} = "VMBSIG" ;
            }

         } else {
            print "Error: $ModuleType: no matching FF command: $file{PerFile}{$file}{Messages}{$counter}{byte}{'2'}{text}\n" ;
         }
      } else {
         print "Error: no DATABYTE2 found in $file for message counter $counter\n" ;
      }
   } else {
      print "Error: no message FF in $file found!\n" ;
   }

   # Loop all the messages
   foreach my $counter (sort keys (%{$file{PerFile}{$file}{Messages}}) ) {
      # When RTR is 1, we receive an empty request 'Module type request'
      # We ignore this message since this contains no extra HEX code for the command. The answer however, is type FF
      if (  $file{PerFile}{$file}{Messages}{$counter}{RTR} eq "1" ) {
      } else {
         my $MessageAddressType  = $file{PerFile}{$file}{Messages}{$counter}{MessageAddressType} ; # Handier var
         my $CommandHex          = $file{PerFile}{$file}{Messages}{$counter}{CommandHex} ;         # Handier var
         my $CommandText         = $file{PerFile}{$file}{Messages}{$counter}{CommandText} ;        # Handier var
         my $Info                = $file{PerFile}{$file}{Messages}{$counter}{Info} ;               # Handier var
         my $Prio                = $file{PerFile}{$file}{Messages}{$counter}{Prio} ;               # Handier var

         # Broadcast messages are stored and processed later
         # We keep all possible options by using them als keys for a hash
         if ( $MessageAddressType eq "broadcast" ) {
            $file{PerCommandHexBroadcast}{$CommandHex}{CommandText}{$CommandText} .= "" ; # $file . ":" . $counter  . " " ;
            $file{PerCommandHexBroadcast}{$CommandHex}{Info}{$Info} .= "" ; # . $file . ":" . $counter  . " " ;
            $file{PerCommandHexBroadcast}{$CommandHex}{Prio}{$Prio} .= "" ; # . $file . ":" . $counter  . " " ;
         } elsif ( $MessageAddressType eq "remote" ) {
            $file{PerCommandHexRemote}{$ModuleTypeHex}{$CommandHex}{CommandText}{$CommandText} .= "" ; # . $file . ":" . $counter  . " " ;
            $file{PerCommandHexRemote}{$ModuleTypeHex}{$CommandHex}{Info}{$Info} .= "" ; # . $file . ":" . $counter  . " " ;
            $file{PerCommandHexRemote}{$ModuleTypeHex}{$CommandHex}{Prio}{$Prio} .= "" ; # . $file . ":" . $counter  . " " ;
         } elsif ( $MessageAddressType eq "local" ) {
            $file{PerCommandHexLocal}{$ModuleTypeHex}{$CommandHex}{CommandText}{$CommandText} .= "" ; # . $file . ":" . $counter  . " " ;
            $file{PerCommandHexLocal}{$ModuleTypeHex}{$CommandHex}{Info}{$Info} .= "" ; # . $file . ":" . $counter  . " " ;
            $file{PerCommandHexLocal}{$ModuleTypeHex}{$CommandHex}{Prio}{$Prio} .= "" ; # . $file . ":" . $counter  . " " ;
         }
      }
   }
}

print "\n" ;
print "Save the data\n" ;

# Per module and message
foreach my $ModuleTypeHex (sort keys %{$file{PerCommandHexLocal}}) {
   foreach my $CommandHex (sort keys %{$file{PerCommandHexLocal}{$ModuleTypeHex}}) {
      if ( defined $file{PerCommandHexBroadcast}{$CommandHex} ) {
      } else {
         my @Name = sort keys %{$file{PerCommandHexLocal}{$ModuleTypeHex}{$CommandHex}{CommandText}} ;
         my @Info = sort keys %{$file{PerCommandHexLocal}{$ModuleTypeHex}{$CommandHex}{Info}} ;
         my @Prio = sort keys %{$file{PerCommandHexLocal}{$ModuleTypeHex}{$CommandHex}{Prio}} ; # TODO: waht if we have different Prio for 1 command?

         my $Name = join ";", @Name ;
         my $Info = join ";", @Info ;
         my $Prio = join ";", @Prio    ;

         $file{ModuleType}{$ModuleTypeHex}{Messages}{$CommandHex}{Name} = $Name ;
         $file{ModuleType}{$ModuleTypeHex}{Messages}{$CommandHex}{Info} = $Info ;
         $file{ModuleType}{$ModuleTypeHex}{Messages}{$CommandHex}{Prio} = $Prio ;

         # The next if statements are for protocol files that describes multiple modules
         #
         # VMBGP1 = 1E: from pdf file
         # VMBGP2 = 1F: ??
         # VMBGP4 = 20: from my bus
         if ( $ModuleTypeHex eq "1E" ) {
            $file{ModuleType}{'1F'}{Messages}{$CommandHex}{Name} = $Name ;
            $file{ModuleType}{'1F'}{Messages}{$CommandHex}{Info} = $Info ;
            $file{ModuleType}{'1F'}{Messages}{$CommandHex}{Prio} = $Prio ;
            $file{ModuleType}{'20'}{Messages}{$CommandHex}{Name} = $Name ;
            $file{ModuleType}{'20'}{Messages}{$CommandHex}{Info} = $Info ;
            $file{ModuleType}{'20'}{Messages}{$CommandHex}{Prio} = $Prio ;

         # VMBEL1 = 34
         # VMBEL2 = 35
         # VMBEL4 = 36
         } elsif ( $ModuleTypeHex eq "34" ) {
            $file{ModuleType}{'35'}{Messages}{$CommandHex}{Name} = $Name ;
            $file{ModuleType}{'35'}{Messages}{$CommandHex}{Info} = $Info ;
            $file{ModuleType}{'35'}{Messages}{$CommandHex}{Prio} = $Prio ;
            $file{ModuleType}{'36'}{Messages}{$CommandHex}{Name} = $Name ;
            $file{ModuleType}{'36'}{Messages}{$CommandHex}{Info} = $Info ;
            $file{ModuleType}{'36'}{Messages}{$CommandHex}{Prio} = $Prio ;

         # VMBGP1-2 = 3A
         # VMBGP2-2 = 3B
         # VMBGP4-2 = 3C
         } elsif ( $ModuleTypeHex eq "3C" ) {
            $file{ModuleType}{'3A'}{Messages}{$CommandHex}{Name} = $Name ;
            $file{ModuleType}{'3A'}{Messages}{$CommandHex}{Info} = $Info ;
            $file{ModuleType}{'3A'}{Messages}{$CommandHex}{Prio} = $Prio ;
            $file{ModuleType}{'3B'}{Messages}{$CommandHex}{Name} = $Name ;
            $file{ModuleType}{'3B'}{Messages}{$CommandHex}{Info} = $Info ;
            $file{ModuleType}{'3B'}{Messages}{$CommandHex}{Prio} = $Prio ;

         # VMBSIG = 39
         # VMBUSBIP = 40
         # VMCM3 = 3F
         } elsif ( $ModuleTypeHex eq "3F" ) {
            $file{ModuleType}{'39'}{Messages}{$CommandHex}{Name} = $Name ;
            $file{ModuleType}{'39'}{Messages}{$CommandHex}{Info} = $Info ;
            $file{ModuleType}{'39'}{Messages}{$CommandHex}{Prio} = $Prio ;
            $file{ModuleType}{'40'}{Messages}{$CommandHex}{Name} = $Name ;
            $file{ModuleType}{'40'}{Messages}{$CommandHex}{Info} = $Info ;
            $file{ModuleType}{'40'}{Messages}{$CommandHex}{Prio} = $Prio ;
         }
      }
   }
}

# We only neede the ModuleTypes information in the json
%{$json{ModuleTypes}} = %{ merge( \%{$json{ModuleTypes}}, \%{$file{ModuleType}} ) };

# Broadcast messages
foreach my $CommandHex (sort keys %{$file{PerCommandHexBroadcast}}) {
   my @Name = sort keys %{$file{PerCommandHexBroadcast}{$CommandHex}{CommandText}} ;
   my @Info = sort keys %{$file{PerCommandHexBroadcast}{$CommandHex}{Info}} ;
   my @Prio = sort keys %{$file{PerCommandHexBroadcast}{$CommandHex}{Prio}} ;

   my $Name = join ";", @Name ;
   my $Info = join ";", @Info ;
   my $Prio = join ";", @Prio    ;

   $json{MessagesBroadCast}{$CommandHex}{Name} = "$Name" ;
   $json{MessagesBroadCast}{$CommandHex}{Info} = "$Info" ;
   $json{MessagesBroadCast}{$CommandHex}{Prio} = "$Prio" ;
}

# Save the data in json format
open (OUTPUT,">","out/protocol.json") ;
my $json = JSON->new->allow_nonref;
$json->canonical(1) ;
$json->pretty(1) ;
print OUTPUT $json->encode( \%json) ;
close OUTPUT ;

sub clean () {
   my $text = $_[0] ;
   chomp $text ;
   $text =~ s/^ +//g ;
   $text =~ s/ +$//g ;
   $text =~ s/‘//g ;
   $text =~ s/’//g ;
   return $text ;
}
