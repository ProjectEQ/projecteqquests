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
quest::say("If you can't find what you need. please let me know."); }
}
#END of FILE Zone:sharvahl  ID:155240 -- Scribe_Kaleej 

