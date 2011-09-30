sub EVENT_SPAWN {
 quest::settimer(1,10);
}

 sub EVENT_TIMER {
 if($timer eq "1") {
  $npc->SetAppearance(3);
  quest::stoptimer(1);
 }
}


sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("Have you seen my short ale?"); }
}
#END of FILE Zone:shadowhaven  ID:150125 -- Slosean 

