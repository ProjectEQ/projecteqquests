# Template Written By: Reno of Turks
# File Modified By: ???
#
# Zone: PoEarthA
# MOB Name: jewel Trap
# MOB ID Number: 218113
#

# Set up some variables we will use throughout the code
my $TripCounter = 0;
my $TrapActive = 0;

# When he spawns, set up the distances and variables that we will trigger on
# There are potential issues here if people trigger the same trap type at the exact same instant, if the perlparser is slow.
sub EVENT_SPAWN {

   # This is the counter we will use to keep track of how many time's the trap has been tripped
   # TrapActive will only ever reset on zone/server repop.
   if($TrapActive == 0) { # This should only ever get called on zone start or #reloadpl/#repop
     $TrapActive = 1; # Set active flag
     $TripCounter = 0; # Re-set tripcounter as "first use"
   }

   # Get location and set Range for trap
   my $x = $npc->GetX();
   my $y = $npc->GetY();
   my $range = 25;

   # This is the distances that the NPC will trigger on. It is Max X, Max Y, Min X, Min Y
   # We use 25 so we get an effective trigger range of 50
   quest::set_proximity($x - $range, $x + $range, $y - $range, $y + $range);
}

# This is what we actually do when someone steps within our predefined boundaries
sub EVENT_ENTER {

  # Grab a random number between 0 and 100
  my $chance = int(rand(100));

  # If we have been tripped 5 times, we have a chance at a named
  # NOTE: It says greater than or equal to 4 because we started at zero, not one.
    if($TripCounter >= 4) {

      # If our random number is greater than 70, spawn the named here
      if($chance > 70) {

        # Spawn the named NPC for this trap
        # He will spawn at this NPC's current X,Y,Z,H coordinates
        quest::spawn2(218083,0,0,$x,$y,$z,$h); # A Perfect Rock Formation

        # Reset TripCounter to zero
        $TripCounter = 0;

        # Depop ourselves so we can respawn on our normal timer and start the cycle again
        quest::depop();

        # If our random number was not above 70, spawn a PH
      } else {

        # Spawn the PH
        # He will spawn at this NPC's current X,Y,Z,H coordinates
        quest::spawn2(218001,0,0,$x,$y,$z,$h);# A Majestic Gemwalker

        # Reset TripCounter to zero
        $TripCounter = 0;

        # Depop so we can respawn and start the cycle again
        quest::depop();
      }

  # If we have been tripped less than 5 times, spawn a trash mob
  } else {

    # Spawn our trash NPC because we have been tripped under 5 times
    # He will spawn at this NPC's current X,Y,Z,H coordinates
    quest::spawn2(218066,0,0,$x,$y,$z,$h);# A Gemmed Rockman

    # Increase TrapCounter by 1 so we know how many time's we have been tripped.
    $TripCounter += 1;

    # Depop Trap. Other traps of this type will still be able to continue the counters.
    quest::depop();
  }
}