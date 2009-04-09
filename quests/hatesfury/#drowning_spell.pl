sub EVENT_SIGNAL {
  if ($signal == 666){
     quest::settimer("drowning",55); #cast every 55 seconds
}
  if ($signal == 333){
       quest::stoptimer("drowning");
}
 }
 
sub EVENT_TIMER {
 if ($timer eq "drowning") {
     $npc->CastSpell(3784,228118);
}    
 } 