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
quest::say("Excuse me. I am trying to finish my meal."); }
}
#END of FILE Zone:potranquility  ID:203023 -- Saluk_Tramuj 

