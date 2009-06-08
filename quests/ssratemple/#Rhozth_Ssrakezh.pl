
sub EVENT_SPAWN {
	#check for our event global and see if we should even be up
	if(defined $qglobals{cursed_dead}) {
		quest::depop();
	}
}

sub EVENT_DEATH {
	quest::signalwith(162279,1,0); #cursed_ten
}