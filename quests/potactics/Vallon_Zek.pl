my $phase;	# undef = pre-split, 1 = split form, 2 = final form

sub EVENT_SPAWN {
	$phase = 0;
	quest::setnexthpevent(75);
}

sub EVENT_SIGNAL {
	if ($signal == 1) {		# Split form
		$phase = 1;		
		quest::setnexthpevent(50);
	} elsif ($signal == 2) {		# Final form
		$phase = 2;
	} elsif ($signal == 6) { 
		quest::depop_withtimer();	# times up, despawn
	}
}

sub EVENT_HP {
	if ($hpevent == 75 && $phase == undef) { # Time to split for the first time
		quest::signalwith(214112, 3, 0);	# tell trigger to spawn real in phase 1 along with 4 clones 
		quest::depop_withtimer();
	} elsif ($hpevent == 50) {				# split again
		quest::signalwith(214112, 4, 0);	# tell the trigger this version is dead, respawn in either phase 1 with clones or phase 2 without
		quest::depop_withtimer();
	}
}

# tell trigger to stop timer and reset counter
sub EVENT_DEATH_COMPLETE {
	quest::signalwith(214112, 5, 0);
	quest::spawn2(202368,0,0,$x,$y,$z,$h);	
}
# End of File  Zone: PoTactics  ID: 214083 -- Vallon_Zek