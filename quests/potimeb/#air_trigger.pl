sub EVENT_SPAWN {
   $x = $npc->GetX();
   $y = $npc->GetY();
   quest::set_proximity($x - 80, $x + 80, $y - 60, $y + 60);
}

sub EVENT_ENTER { #looks like we need a timer here or else zone crashes.
   quest::settimer("air",1); #1 second after first player enters event starts
   quest::clear_proximity();
}

sub EVENT_TIMER {
	if ($timer eq "air") {
		quest::spawn2(223187,0,0,-129.6,1720,547,0); #spawn event script
		quest::signalwith(223211,23,0); #send signal to main trigger to start hour time limit
		quest::stoptimer("air");
		quest::depop();
	}
}