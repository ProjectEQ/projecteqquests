#Bilge Farfathom spawn
#npc - #Bilge_Farfathom - randomly spawns 1 of 4 Bilge triggers around the zone)
#zone - Dagnors Cauldron
#Angelox

sub EVENT_DEATH_COMPLETE{
 my $random_result = int(rand(100));
 #these are not PEQ IDs:
 my $a=70060; #npc - an_aqua_goblin_mariner
 my $b=70062; #npc - #an_undertow_skeleton
 my $c=70061; #npc - #aqua_goblin_shaman
 my $d=70063; #npc - #a_cauldron_rat
 if($random_result<25){
   #quest::say("Spawning mariner trigger1");
   quest::spawn2($a,5,0,-296.37,-122.31,-349.32,122);
  }elsif(($random_result>=25) && ($random_result<50)){
     #quest::say("Spawning skeleton trigger2");
     quest::spawn2($b,6,0,-974.5,436.4,-343.8,29);
  }elsif(($random_result>=50) && ($random_result<75)){
     #quest::say("Spawning shaman trigger3");
     quest::spawn2($c,7,0,-848.3,-184.8,216.3,37.3);
  }else{
    #quest::say("Spawning rat trigger4");
    quest::spawn2($d,8,0,612.6,625.2,209.0,175.6);
  };
};
