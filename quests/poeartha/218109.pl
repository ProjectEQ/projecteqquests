
# This is a template for the multiple different trap's in Plane of Earth A.
#
# To use this template all one must do is change anywhere it says:
# NPC ID NUMBER HERE -- The corresponding NPC ID from the PEQ database.
# NPC NAME GOES HERE -- The appropriate NPC's name. This name is commented out
#                   but is extremely useful to someone who may come along
#                       down the road and be looking at the code.
#
# Template Written By: Reno of Turks
# File Modified By: YOUR NAME HERE
#
# Zone: PoEarthA
# MOB Name: mud Trap
# MOB ID Number: 218109
#

# Set up some variables we will use throughout the code
my $TripCounter = 0;
my $TrapReady = 0;

# When he spawns, set up the distances and variables that we will trigger on
sub EVENT_SPAWN {

   # This is the counter we will use to keep track of how many time's the trap has been tripped
   $TripCounter = 0;
   
   # This is the distances that the NPC will trigger on. It is Max X, Max Y, Min X, Min Y
   # We use 25,25,25,25 so we get an effective trigger range of 50
   quest::set_proximity(25,25,25,25);
   
   # This variable tells us when and if we are ready to trigger
   $TrapReady = 1;
}

# This is what we actually do when someone steps within our predefined boundaries
sub EVENT_ENTER {

   # If our trap is ready, $TrapReady is at a value of 1, then we will continue on, if it is NOT equal to 1, it will skip it all
   if($TrapReady == 1) {
   
      # Grab a random number between 0 and 100
      my $chance = int(ran(100));
       
      # If we have been tripped 5 times, we have a chance at a named
      # NOTE: It says greater than or equal to 4 because we started at zero, not one.
      if($TripCounter >= 4) {
       
         # If our random number is greater than 70, spawn the named here
         if($chance > 70) {
         
            # Spawn the named NPC for this trap
            # He will spawn at this NPC's current X,Y,Z,H coordinates
            quest::spawn2(218098,0,0,$x,$y,$z,$h);# A Monsterous Earthwalker
             
            # Reset TripCounter to zero, this should not be needed as when the NPC depops
            # the variable is lost and a new one created, at a value of zero, when the NPC respawns
            # but I like to keep it tidy.
            $TripCounter = 0;
             
            # Depop ourselves so we can respawn on our normal timer and start the cycle again
            quest::depop();
             
         # If our random number was not above 70, spawn a PH
         } else {
         
            # Spawn the PH
            # He will spawn at this NPC's current X,Y,Z,H coordinates
            quest::spawn2(218098,0,0,$x,$y,$z,$h);# A Monsterous Earthwalker
             
            # Reset TripCounter to zero, this should not be needed as when the NPC depops
            # the variable is lost and a new one created, at a value of zero, when the NPC respawns
            # but I like to keep it tidy.
            $TripCounter = 0;
             
            # Depop so we can respawn and start the cycle again
            quest::depop();
         }
         
      # If we have been tripped less than 5 times, spawn a trash mob
      } else {
       
         # Spawn our trash NPC because we have been tripped under 5 times
         # He will spawn at this NPC's current X,Y,Z,H coordinates
         quest::spawn2(218099,0,0,$x,$y,$z,$h);# An Mudfilled Earth Golem
         
         # Set a timer so we know when we can trigger again. When this timer hits zero, it will call the TIMER event
         # NOTE: 1200 is equal to 20 minutes
         quest::settimer("TrapReady", 1200);
         
         # Increase TrapCounter by 1 so we know how many time's we have been tripped.
         $TripCounter += 1;
         
         # Set TrapReady to zero so that we won't trigger again until it it gets set to 1 again
         $TrapReady = 0;
      }
   }
}

# Our timer is up! Let's reset so we can spawn an NPC the next time someone enter's our boundaries
sub EVENT_TIMER {

   # Stop the timer as we don't need it to continue counting, we will reset it again when we are ready
   quest::stoptimer("TrapReady");
   
   # Set TrapReady to one so that the ENTER event knows it can spawn an NPC
   $TrapReady = 1;
} 