# Template Written By: Reno of Turks
# File Modified By: Ownius Maximus
#
# Zone: PoEarthA
# MOB Name: tree Trap
# MOB ID Number: 218114
#

# Set up some variables we will use throughout the code
my $TripCounter = 0;
my $TrapActive = 0;

# When he spawns, set up the distances and variables that we will trigger on
# There are potential issues here if people trigger the same trap type at the exact same instant, if the perlparser is slow.
sub EVENT_SPAWN {

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

 # Tree Traps only spawn trash NPCs
 # He will spawn at this NPC's current X,Y,Z,H coordinates
 quest::spawn2(218086,0,0,$x,$y,$z,$h); # A Tenacious Arborean

 # Depop Trap.
 quest::depop();
}