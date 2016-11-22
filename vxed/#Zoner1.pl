sub EVENT_SPAWN {
  	$x = $npc->GetX();
   	$y = $npc->GetY();
	quest::set_proximity($x - 40, $x + 40, $y - 10, $y + 10);
}

sub EVENT_ENTER {
	quest::movepc(283,-1258,456,-119,240);
}