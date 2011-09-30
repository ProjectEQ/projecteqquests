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
quest::say("Huh? Ah. who's there. don't you know it's impolite to break into someone's house while they are sleeping. If it's that important then come back later will ya?"); }
}
#END of FILE Zone:shadowhaven  ID:150047 -- Nubert 

