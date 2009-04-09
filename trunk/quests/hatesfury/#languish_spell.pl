sub EVENT_SIGNAL {
  if ($signal == 666){
     quest::settimer("languish",32); #cast every 32 seconds
}
  if ($signal == 333){
     quest::stoptimer("languish");
}
 }
 
sub EVENT_TIMER {
 if ($timer eq "languish") {
     $npc->CastSpell(3783,228118);
}    
 } 