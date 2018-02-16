#Bilge Farfathom spawn
#npc - #aqua_goblin_mariner - randomly spawns 1 of 4 Bilge triggers around the zone)
#zone - Dagnors Cauldron

sub EVENT_DEATH_COMPLETE{
 #this is not a PEQ ID:
 my $a=70060; #npc - an_aqua_goblin_mariner starts the loop
 if ($mdied==1){ #mariner died once
  #quest::say("I already died once!");
 }else{
   #quest::say("Starting cycle");
   quest::spawn2($a,5,0,-296.37,-122.31,-349.32,244);
   $mdied=1; #mark mariner died once
 }
}
