sub EVENT_SIGNAL {
  if ($signal == 666){
     quest::settimer("hate",43); #cast every 43 seconds
}
  if ($signal == 333){
     quest::stoptimer("hate");
}
 }
 
sub EVENT_TIMER {
 if ($timer eq "hate") {
     $npc->CastSpell(3785,228118);
}    
 } 