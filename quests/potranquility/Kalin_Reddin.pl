
sub EVENT_SPAWN {
 quest::settimer(1,10);
}

 sub EVENT_TIMER {
 if($timer eq "1") {
  $npc->SetAppearance(1);
  quest::stoptimer(1);
 }
}



sub EVENT_SAY { 
if($text=~/Hail/i){
quest::say("looks more interested in finishing his dinner than talking to you."); }
}
#END of FILE Zone:potranquility  ID:203026 -- Kalin_Reddin 

