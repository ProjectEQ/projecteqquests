
sub EVENT_SPAWN {
	#check for our event global and see if we should even be up
	if(defined $qglobals{cursed_dead}) {
		quest::depop_withtimer();
	}
}

sub EVENT_DEATH_COMPLETE {
	quest::signalwith(162279,1,0); #cursed_ten
}