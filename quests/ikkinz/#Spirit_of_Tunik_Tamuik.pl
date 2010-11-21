sub EVENT_SPAWN {
   my $random_result = int(rand(7)) +1;
   quest::setnexthpevent(75);
}

sub EVENT_HP {
  if($hpevent == 75) {
     if($random_result == 1) {
     quest::npcrace(402);
     }
     if($random_result == 2) {
     quest::npcrace(392);
     }
     if($random_result == 3) {
     quest::npcrace(394);
     }
     if($random_result == 4) {
     quest::npcrace(386);
     }
     if($random_result == 5) {
     quest::npcrace(393);
     }
     if($random_result == 6) {
     quest::npcrace(396);
     }
  }
}

sub EVENT_DEATH {
  quest::spawn2(294579,0,0,-126,-919,-3,254);
  quest::spawn2(294579,0,0,-124,-855,-3,130);
  quest::spawn2(294579,0,0,-187,-853,-3,127);
  quest::spawn2(294579,0,0,-182,-922,-3,248);
}
     