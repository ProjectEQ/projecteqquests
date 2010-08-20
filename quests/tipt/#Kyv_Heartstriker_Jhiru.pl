sub EVENT_COMBAT {
  if($combat_state == 1) {
  quest::settimer(1,10);
}
  if($combat_state == 0) {
  quest::stoptimer(1);
  quest::modifynpcstat("max_hit",2500);
  }
 }
sub EVENT_TIMER  {
  $dmgmod = $mob->GetX();
     if($dmgmod <= 426) {
        quest::modifynpcstat("max_hit",3500);
}
} 
sub EVENT_DEATH {
  quest::spawn2(289032,0,0,723,2239,734,244);
  quest::stoptimer(1);
}