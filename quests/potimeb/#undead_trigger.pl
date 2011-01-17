sub EVENT_SPAWN {
   $x = $npc->GetX();
   $y = $npc->GetY();
   quest::set_proximity($x - 80, $x + 80, $y - 60, $y + 60);
}

sub EVENT_ENTER {
   quest::settimer("undeadI",1); #1 sec after first player enters event starts
   quest::clear_proximity();
}

sub EVENT_TIMER {
	if ($timer eq "undeadI") {
		quest::spawn2(223188,0,0,-129.6,1720,547,0); #spawn event script
		quest::signalwith(223211,23,0); #send signal to main trigger to start hour time limit
		quest::stoptimer("undeadI");
		quest::depop();
	}
}
