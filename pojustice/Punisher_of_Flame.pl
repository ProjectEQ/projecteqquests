#Punisher_of_Flame.pl
#Trial of flame
#Kilelen

sub EVENT_SPAWN {
	quest::moveto(880, -728, 55, 0, 1);
}

sub EVENT_SIGNAL {
	if ($signal == 1) {
		quest::depop();
	}
}

sub EVENT_DEATH_COMPLETE {
	#Stop the AEs when I die, they have won.
	quest::signalwith(201417, 2, 5); # NPC: #Event_Burning_Control
}