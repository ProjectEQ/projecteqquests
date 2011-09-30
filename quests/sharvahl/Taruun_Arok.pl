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
quest::say("I hope you are not looking for anyone in particular.  I think that everyone left for Hollowshade quite a while ago."); }
}
#END of FILE Zone:sharvahl  ID:155118 -- Taruun_Arok 

