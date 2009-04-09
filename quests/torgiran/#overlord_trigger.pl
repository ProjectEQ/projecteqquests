sub EVENT_SPAWN {
   $x = $npc->GetX();
   $y = $npc->GetY();
   quest::spawn2(226072,0,0,-1276,1085,-141.62,0);
   quest::spawn2(226071,0,0,-1316,1073,-144.1,0);
   quest::set_proximity($x - 25, $x + 25, $y - 25, $y + 25);
}

sub EVENT_ENTER {
   quest::spawn2(226205,0,0,0,0,0,0);
   quest::depop;
} 