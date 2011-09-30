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
quest::say("Nice to meet you $name. don't mind me I've had a lot to drink."); }
}
#END of FILE Zone:shadowhaven  ID:150111 -- Milasar_Husnalsn 

