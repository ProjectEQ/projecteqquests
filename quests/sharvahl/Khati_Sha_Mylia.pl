
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
quest::say("Greetings. may I help you?"); }
}
#END of FILE Zone:sharvahl  ID:155239 -- Khati_Sha_Mylia 

