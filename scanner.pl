#!/usr/bin/perl
print "A simplified version of Network Mapper by Sammy Hajhamid, or Imperial#4290. Credits to Zack Smith for NMAP.\n\n";
sleep(1);

#Target declaring.
print "First, let's choose a target to scan.\n";
sleep(1);
print "Please type the target below.\n";

$targ = <STDIN>;
chomp $targ;
#Are you sure this is your target?
&targetstance();

sub targetstance {
        print "Are you sure $targ is your target? [Y/N]\n";

        $targstance = <STDIN>;
        chomp $targstance;

        if($targstance =~ m/^[Y]$/i) {
            sleep(1);
            print "Wondeful. Let's move on.\n"
        }

        elsif ($targstance =~ m/^[N]$/i) {
            sleep(1);
            print "Okay, aborting...\n";
            exit;
        }

        else {
           sleep(1);
           print "Invalid input. Quitting...\n";
           exit;
        }
    };

#Parameters help.
sleep(1);
print "Now we need a scan type for our scan.\n";

&paramstance();

sub paramstance {
  print "Would you like a list of scan types? [Y/N]\n";

  $paraminput = <STDIN>;
  chomp $paraminput;

  if($paraminput =~ m/^[Y]$/i) {
  sleep(1);
  print "Here's a list of scan types.\n\n";
  print " -sS/sT/sA/sW/sM: TCP SYN/Connect()/ACK/Window/Maimon scans. \n
  -sU: UDP Scan. \n
  -sN/sF/sX: TCP Null, FIN, and Xmas scans. \n
  --scanflags <flags>: Customize TCP scan flags. \n
  -sI <zombie host[:probeport]>: Idle scan. \n
  -sY/sZ: SCTP INIT/COOKIE-ECHO scans.\n
  -sO: IP protocol scan.\n
  -b <FTP relay host>: FTP bounce scan.\n\n
  Moving on.\n";
  }
  elsif ($paraminput =~ m/^[N]$/i) {
    sleep(1);
    print "Okay, proceeding.\n";
  }
  else {
    sleep(1);
    print "Invalid input. Quitting...\n";
  }
};

print "Please type the scan type.\n";
$scan = <STDIN>;
chomp $scan;
#Options stuff

print "Finally, we need options. A list can be found by typing 'nmap' into the terminal.\n";
print "Please enter a option/some options.\n";
$options = <STDIN>;
chomp $options;

#last bits
 print "To review, your target is $targ, your scan type is $scan, and your options are/is $options.\n";
 print "Now executing.\n";

 #the bad boy
 system("nmap $scan $options $targ");
