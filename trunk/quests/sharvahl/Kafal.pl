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
quest::say("May your ancestors guide your heart noble wanderer. It is good to meet you. Please. have a look at my wares. I have quality armor made from leather and padded for extra comfort and protection."); }
}
#END of FILE Zone:sharvahl  ID:155175 -- Kafal 

