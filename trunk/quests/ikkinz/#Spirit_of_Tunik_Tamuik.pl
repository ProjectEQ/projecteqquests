sub EVENT_SPAWN {
   $doppelganger = int(rand(7)) + 1;
   quest::setnexthpevent(75);
}

sub EVENT_HP {
  if($hpevent == 75) {
     if($doppelganger == 1) {
     quest::npcrace(402);
     }
     if($doppelganger == 2) {
     quest::npcrace(392);
     }
     if($doppelganger == 3) {
     quest::npcrace(394);
     }
     if($doppelganger == 4) {
     quest::npcrace(386);
     }
     if($doppelganger == 5) {
     quest::npcrace(393);
     }
     if($doppelganger == 6) {
     quest::npcrace(396);
     }
  }
}

sub EVENT_DEATH_COMPLETE {
  quest::spawn2(294579,0,0,-126,-919,-3,254);
  quest::spawn2(294579,0,0,-124,-855,-3,130);
  quest::spawn2(294579,0,0,-187,-853,-3,127);
  quest::spawn2(294579,0,0,-182,-922,-3,248);
  quest::signalwith(294631,3); #set lockout
}
     